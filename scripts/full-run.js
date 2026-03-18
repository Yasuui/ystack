#!/usr/bin/env node
/**
 * ystack full-run.js
 * Runs the complete pipeline with correct sequencing and gates.
 *
 * Usage:
 *   node scripts/full-run.js "build login page"
 *   node scripts/full-run.js --ui-only "polish dashboard"
 *   node scripts/full-run.js --api-only "add sync endpoint"
 *   node scripts/full-run.js --bug "fix WebSocket crash"
 */

import { execSync } from "child_process";
import { writeFileSync, existsSync, mkdirSync } from "fs";

const BRAIN = ".agents/brain";

function ensure(d) { if (!existsSync(d)) mkdirSync(d, { recursive: true }); }

function dispatch(tasks, gate = "") {
  const gateArg = gate ? ` --gate ${gate}` : "";
  execSync(`node scripts/parallel-dispatch.js --tasks ${tasks}${gateArg}`, { stdio: "inherit" });
}

function phase(name) {
  console.log(`\n\x1b[1m\x1b[36m━━━ ${name} ━━━\x1b[0m\n`);
}

async function main() {
  ensure(BRAIN);
  ensure(".agents/tasks");
  ensure(".agents/logs");

  const args  = process.argv.slice(2);
  const uiOnly  = args.includes("--ui-only");
  const apiOnly = args.includes("--api-only");
  const bug     = args.includes("--bug");
  const task    = args.filter(a => !a.startsWith("--")).join(" ") || "run swarm";

  if (!existsSync(`${BRAIN}/orchestrator-plan.md`)) {
    writeFileSync(`${BRAIN}/orchestrator-plan.md`, `## Task\n${task}\n`);
  }

  console.log(`\x1b[1mystack full-run\x1b[0m — ${task}`);

  if (bug) {
    phase("Root Cause");  dispatch("rootcause");
    phase("QA");          dispatch("qa", "rootcause");
    phase("Ship");        dispatch("ship", "qa");
    return;
  }

  if (uiOnly) {
    phase("Frontend");    dispatch("frontend");
    phase("Motion");      dispatch("motion", "frontend");
    phase("QA + Review"); dispatch("qa,review", "frontend,motion");
    phase("Ship");        dispatch("ship", "qa,review");
    return;
  }

  if (apiOnly) {
    phase("Backend");     dispatch("backend");
    phase("QA + Review"); dispatch("qa,review", "backend");
    phase("Ship");        dispatch("ship", "qa,review");
    return;
  }

  // Full pipeline
  phase("Phase A: Frontend + Backend");  dispatch("frontend,backend");
  phase("Phase B: Motion");              dispatch("motion", "frontend");
  phase("Phase C: QA + Review");         dispatch("qa,review", "frontend,backend,motion");
  phase("Phase D: Ship");                dispatch("ship", "qa,review");
}

main().catch(err => { console.error(err.message); process.exit(1); });
