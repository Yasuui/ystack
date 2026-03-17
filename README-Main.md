<div align="center">

# ystack

**Free multi-agent developer swarm for Antigravity IDE & Gemini CLI**

Turn one IDE into an autonomous engineering team — plans, builds, reviews,
QA's in real browsers, and ships. No subscription. No constant prompts. No slop.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Stars](https://img.shields.io/github/stars/younis-ali/ystack?style=flat)](https://github.com/younis-ali/ystack/stargazers)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)
[![Gemini](https://img.shields.io/badge/Powered%20by-Gemini-4285F4?logo=google)](https://gemini.google.com)

</div>

---

## What is ystack?

ystack is a collection of **agent prompts, living skills, and slash commands** for developers using [Antigravity IDE](https://antigravity.dev) and Gemini CLI who want to ship without constant back-and-forth.

It gives you the role-separation discipline of [gstack](https://github.com/garrytan/gstack) — but free, multi-agent, and built for 2026.

> **Antigravity user?** Clone the repo, run the bootstrap prompt in Agent Manager, and you're configured in 2 minutes. No manual setup.
>
> **Gemini CLI user?** Run `bash install.sh` for 12 slash commands in your terminal.

---

## Getting started — new project in 2 minutes

This is the fastest path to a fully configured project:

**1. Clone ystack**
```bash
git clone https://github.com/younis-ali/ystack
```

**2. Open your project in Antigravity**

**3. Open Agent Manager** — `Cmd/Ctrl + Shift + M`

**4. Paste the bootstrap prompt**
```bash
cat ystack/config/bootstrap.md
# Copy the output → paste into Agent Manager
```

**5. Walk away for 2 minutes**

The bootstrap agent automatically:
- Scans your entire codebase
- Detects your stack (framework, DB, auth, test runner, integrations)
- Generates `AGENTS.md` with your project context
- Generates `GEMINI.md` for session memory
- Installs taste-soft-skill for premium UI
- Copies all swarm agent prompts
- Runs your test suite and writes a health baseline
- Reports what it found and suggests the first swarm task

You never write config manually. Ever.

---

## The config system — global rules + project context

ystack separates **what's always true** from **what's project-specific**.

```
config/AGENTS.global.md          ← 80%: your universal rules, never changes
       +
project/AGENTS.md (generated)    ← 20%: stack, health, active context
       =
every Antigravity session starts fully loaded
```

| File | What it contains | Who writes it |
|------|-----------------|--------------|
| `config/AGENTS.global.md` | Autonomy rules, taste-soft-skill, code standards, agent roster | You (once, at setup) |
| `config/bootstrap.md` | One-time setup prompt for new projects | ystack (never edit) |
| `project/AGENTS.md` | Stack, health state, active context | Bootstrap agent (auto-generated) |

**The mental model:** Copy `config/AGENTS.global.md` to your home directory once. Every new project gets a lean `AGENTS.md` that just says "stack is X, health is Y, here's what's in progress." The global rules are always inherited.

---

## Why ystack

| | gstack | ystack |
|---|---|---|
| **Cost** | $20/mo Claude subscription | Free — Gemini free tier |
| **Context window** | 1M tokens | 1M tokens |
| **Browser QA** | 58MB compiled binary | Native Playwright MCP — zero install |
| **Multi-agent** | Sequential sessions | Parallel Agent Manager in Antigravity |
| **Autonomy** | Frequent confirmation prompts | Full auto — walk away, come back to a PR |
| **Docs accuracy** | Training data | Context7 MCP — live, version-accurate |
| **Project setup** | Manual config per project | Bootstrap prompt — 2 minutes, fully auto |
| **Self-improvement** | Static skill files | Living Skills — swarm updates itself |
| **Works in** | Claude Code only | Antigravity + Gemini CLI + any project |

---

## The swarm

Seven specialist agents run in parallel. Each locked into one role.

| Agent | Role | File |
|-------|------|------|
| **Orchestrator** | Engineering Lead — coordinates the swarm | `swarmstack/orchestrator.md` |
| **Frontend** | Premium UI with taste-soft-skill — no vibecode | `swarmstack/agents/frontend.md` |
| **Backend** | APIs, database, auth, server logic | `swarmstack/agents/backend.md` |
| **QA** | Real Playwright browser tests | `swarmstack/agents/qa.md` |
| **Review** | Paranoid security + correctness audit | `swarmstack/agents/review.md` |
| **Ship** | Commits, PRs, changelogs, deploys | `swarmstack/agents/ship.md` |
| **Root Cause** | Debug-first detective | `swarmstack/agents/rootcause.md` |

**Ship gate:** Ship agent only runs after Review AND QA both return `READY`. Hard rule.

---

## Running the swarm

Once bootstrap has run on your project:

**1. Open Agent Manager** — `Cmd/Ctrl + Shift + M`

**2. Paste `swarmstack/orchestrator.md`**

**3. Fill in the TASK section:**
```
Feature: Add Stripe checkout to the dashboard
- Frontend: pricing modal with payment form, success state
- Backend: /api/checkout endpoint, webhook handler
- QA: test successful payment, failed card, webhook delivery
- Review: check Stripe key handling, webhook signature validation
- Ship: PR with test coverage summary
```

**4. Walk away.** Agents run in parallel and come back with a finished, reviewed, QA'd PR.

---

## Autonomous mode settings

Set once in Antigravity Settings → Agent tab:

```
Terminal execution policy  →  Auto
Autonomy level             →  Agent-driven
Conversation mode          →  Fast
```

`AGENTS.md` handles the rest — all routine actions are pre-approved, agents only pause for irreversible decisions or confidence below 70%.

---

## Living Skills

After every session, the Root Cause agent updates `swarmstack/skills/living-skills.md` with what worked and what didn't. The swarm compounds.

```
Session 1  → discovers a pattern → writes to living-skills.md
Session 2  → all agents read it → apply the learned pattern
Session N  → measurably better than Session 1, automatically
```

---

## Gemini CLI slash commands (terminal workflow)

```bash
bash install.sh
```

Installs 12 commands to `~/.gemini/commands/`:

| Command | When to use |
|---------|-------------|
| `/plan` | Scope a feature — no code until you have a plan |
| `/plan:arch` | System design and architecture |
| `/build` | Implement with focus, no scope creep |
| `/review` | Paranoid code review before every ship |
| `/ship` | Commit + PR + deploy |
| `/qa` | Browser testing via Playwright MCP |
| `/debug` | Root cause before touching code |
| `/docs` | README, JSDoc, inline comments |
| `/git:commit` | Smart conventional commit from staged diff |
| `/git:pr` | PR description from branch diff |
| `/retro` | Post-ship retrospective |
| `/context` | Regenerate project GEMINI.md |

---

## Repo structure

```
ystack/
├── AGENTS.md                         ← Root agent rules (ystack repo context)
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── install.sh                        ← Gemini CLI one-liner setup
│
├── config/                           ← The setup system
│   ├── README.md                     ← How the config system works
│   ├── AGENTS.global.md              ← Copy to your project root (global rules)
│   ├── AGENTS.project-template.md    ← Auto-filled by bootstrap
│   └── bootstrap.md                  ← Paste into Agent Manager on new projects
│
├── swarmstack/
│   ├── orchestrator.md               ← Master swarm prompt for Agent Manager
│   ├── agents/
│   │   ├── frontend.md
│   │   ├── backend.md
│   │   ├── qa.md
│   │   ├── review.md
│   │   ├── ship.md
│   │   ├── rootcause.md
│   │   └── docs.md
│   ├── skills/
│   │   └── living-skills.md          ← Auto-updated after every session
│   └── examples/
│       ├── focused-ai-GEMINI.md      ← Real project GEMINI.md example
│       ├── focused-ai-swarm-prompt.md ← Real project swarm execution prompt
│       ├── ystack-repo-setup-prompt.md ← Self-setup prompt for this repo
│       └── veo-prompts.md            ← Veo 3 prompts for demo videos
│
├── mcp/
│   ├── README.md                     ← MCP server guide
│   └── settings.json                 ← Full Gemini CLI MCP config
│
└── .agents/
    ├── brain/                        ← Agent outputs (gitignored)
    └── skills/
        └── taste-soft-skill/         ← Premium UI skill (installed by bootstrap)
```

---

## Showcase — Focused AI

ystack is actively used on **Focused AI** — a real-time AI meeting assistant with a stealth overlay UI, better than Cluely.

The swarm runs ongoing development:
- 🔧 Bridge instability → fixed by Root Cause + Backend agents in one run
- 📈 Test coverage 21% → 80%+ → QA agent
- 🎨 Premium glassmorphism overlay → Frontend agent with taste-soft-skill
- 🔒 Security audit → Review agent
- 📦 Production PR → Ship agent

The whole cycle — fix, test, polish, review, ship — runs while you're in the meeting.

---

## MCP Servers

| Server | Why | Token |
|--------|-----|-------|
| **Playwright** | Real browser QA | None |
| **Context7** | Live library docs | None |
| **GitHub** | PR and issue management | GitHub PAT |
| **Sequential Thinking** | Complex architecture reasoning | None |
| **Vercel** | Deploy status and logs | Vercel token |
| **Firecrawl** | Research in /plan | Firecrawl key |

Full config: [`mcp/settings.json`](./mcp/settings.json)

---

## Contributing

Best contribution: a new agent prompt that solves a real workflow problem.

Labels: `good-first-issue` · `new-agent` · `prompt-bug` · `living-skill` · `docs`

See [CONTRIBUTING.md](./CONTRIBUTING.md).

---

## Philosophy

One mushy AI prompt produces mushy output.
A coordinated swarm of specialists — each locked into a role, sharing context,
running in parallel, self-improving after every run — produces something that
feels like having a full engineering team.

Built by [Yonis](https://github.com/younis-ali) in Toronto.
For builders who ship first and ship well.

---

<div align="center">

**[⭐ Star this if it ships something for you](https://github.com/younis-ali/ystack)**

</div>
