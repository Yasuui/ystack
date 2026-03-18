#!/usr/bin/env node
/**
 * ystack parallel-dispatch.js
 * Spawns multiple gemini CLI processes as independent OS processes.
 * True parallel execution — Frontend and Backend run simultaneously.
 *
 * Usage:
 *   node scripts/parallel-dispatch.js --tasks frontend,backend
 *   node scripts/parallel-dispatch.js --tasks qa,review --gate frontend,backend,motion
 *   node scripts/parallel-dispatch.js --tasks ship --gate qa,review
 */

import { spawn } from "child_process";
import { readFileSync, writeFileSync, existsSync, mkdirSync } from "fs";
import { join } from "path";
import { parseArgs } from "util";

const BRAIN = ".agents/brain";
const TASKS = ".agents/tasks";
const LOGS  = ".agents/logs";

const MODELS = {
  frontend:  "gemini-3-pro",
  backend:   "gemini-3-pro",
  rootcause: "gemini-3-pro",
  motion:    "gemini-3-flash-preview",
  qa:        "gemini-3-flash-preview",
  review:    "gemini-3-flash-preview",
  ship:      "gemini-3-flash-preview",
  docs:      "gemini-3-flash-preview",
  marketing: "gemini-3-flash-preview",
};

const SKILLS = {
  frontend:  "swarmstack/agents/frontend.md",
  backend:   "swarmstack/agents/backend.md",
  motion:    "swarmstack/agents/motion.md",
  qa:        "swarmstack/agents/qa.md",
  review:    "swarmstack/agents/review.md",
  ship:      "swarmstack/agents/ship.md",
  rootcause: "swarmstack/agents/rootcause.md",
  docs:      "swarmstack/agents/docs.md",
  marketing: "swarmstack/agents/marketing.md",
};

const CONTEXT_FILES = {
  motion:  ["frontend-output.md"],
  qa:      ["frontend-output.md", "backend-output.md", "motion-output.md"],
  review:  ["frontend-output.md", "backend-output.md"],
  ship:    ["qa-output.md", "review-output.md"],
};

const T = {
  teal:  "\x1b[36m", green: "\x1b[32m",
  red:   "\x1b[31m", dim:   "\x1b[2m",
  reset: "\x1b[0m",  bold:  "\x1b[1m",
};

function ensure(...dirs) {
  for (const d of dirs) if (!existsSync(d)) mkdirSync(d, { recursive: true });
}

function read(file) {
  const p = join(BRAIN, file);
  return existsSync(p) ? readFileSync(p, "utf8") : null;
}

function write(file, content) {
  writeFileSync(join(BRAIN, file), content, "utf8");
}

function isReady(id) {
  return read(`${id}-output.md`)?.includes("STATUS: READY") ?? false;
}

function checkGate(ids) {
  const blocked = ids.filter(id => !isReady(id));
  if (blocked.length > 0) {
    console.log(`\n${T.red}GATE BLOCKED — not ready: ${blocked.join(", ")}${T.reset}`);
    for (const id of blocked) {
      const r = read(`${id}-output.md`)?.match(/STATUS: NOT READY[— ]+(.+)/)?.[1];
      console.log(`  ${id}: ${r || "no output written"}`);
    }
    return false;
  }
  console.log(`${T.green}gates passed — ${ids.join(", ")} all READY${T.reset}`);
  return true;
}

function buildPrompt(id) {
  const skillPath = SKILLS[id];
  if (!existsSync(skillPath)) throw new Error(`Missing skill: ${skillPath}`);

  const skill = readFileSync(skillPath, "utf8");
  const plan  = read("orchestrator-plan.md") || "";
  const ctx   = (CONTEXT_FILES[id] || [])
    .map(f => { const c = read(f); return c ? `\n\n### Context: ${f}\n${c}` : ""; })
    .join("");

  return `${skill}\n\n---\n## Orchestrator Plan\n${plan}${ctx}\n\n---\n## Output\nWrite complete output to .agents/brain/${id}-output.md\nEnd with: STATUS: READY  or  STATUS: NOT READY — [reason]\n`;
}

function spawnAgent(id, model) {
  return new Promise(resolve => {
    const t0 = Date.now();
    const taskFile = join(TASKS, `${id}.md`);
    writeFileSync(taskFile, buildPrompt(id), "utf8");

    console.log(`  ${T.teal}→${T.reset} ${id} ${T.dim}[${model}]${T.reset}`);

    // Read task content and pass via stdin to avoid shell escaping
    const content = readFileSync(taskFile, "utf8");
    const proc = spawn("gemini", ["--approval-mode=yolo", `--model=${model}`], {
      cwd: process.cwd(),
      env: process.env,
      stdio: ["pipe", "pipe", "pipe"],
      shell: true
    });

    proc.stdin.write(content);
    proc.stdin.end();

    let out = "", err = "";
    proc.stdout.on("data", d => {
      out += d;
      d.toString().split("\n").filter(l => l.trim() && !l.startsWith("{"))
        .forEach(l => console.log(`  ${T.dim}[${id}]${T.reset} ${l.trim()}`));
    });
    proc.stderr.on("data", d => { err += d; });

    proc.on("close", code => {
      const dt = ((Date.now() - t0) / 1000).toFixed(1);
      writeFileSync(join(LOGS, `${id}-${t0}.log`), `STDOUT:\n${out}\nSTDERR:\n${err}`);
      const sym = code === 0 ? `${T.green}✓${T.reset}` : `${T.red}✗${T.reset}`;
      console.log(`  ${sym} ${id} — ${dt}s`);
      resolve({ id, ok: code === 0 });
    });
  });
}

async function main() {
  ensure(BRAIN, TASKS, LOGS);

  const { values } = parseArgs({
    options: {
      tasks: { type: "string" },
      gate:  { type: "string" },
      model: { type: "string" },
    },
    strict: false,
  });

  const tasks = (values.tasks || "").split(",").map(t => t.trim()).filter(Boolean);
  const gates = values.gate ? values.gate.split(",").map(t => t.trim()).filter(Boolean) : [];

  if (tasks.length === 0) {
    console.error("Usage: node scripts/parallel-dispatch.js --tasks frontend,backend [--gate qa,review]");
    process.exit(1);
  }

  if (gates.length > 0 && !checkGate(gates)) process.exit(1);

  console.log(`\n${T.bold}ystack dispatch${T.reset}: ${tasks.join(", ")}`);

  if (values.model) tasks.forEach(id => { MODELS[id] = values.model; });

  const results = await Promise.all(tasks.map(id => spawnAgent(id, MODELS[id] || "gemini-3-flash-preview")));
  const failed  = results.filter(r => !r.ok);

  if (failed.length > 0) {
    console.log(`\n${T.red}failed: ${failed.map(r => r.id).join(", ")} — check .agents/logs/${T.reset}`);
    process.exit(1);
  }
}

main().catch(err => { console.error(err.message); process.exit(1); });
