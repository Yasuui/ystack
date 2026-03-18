# ystack — Antigravity Swarm System

> **Free, open-source multi-agent developer swarm for Antigravity IDE and Gemini CLI.**

ystack is a framework for orchestrating specialized AI agents to build, test, and ship software with extreme autonomy. It leverages the **Antigravity IDE** and **Gemini 2.0 Flash** to provide a seamless, local-first development experience.

| | gstack | ystack |
|---|---|---|
| **Cost** | $20/mo Claude subscription | Free — Gemini free tier |
| **Context window** | ~200k tokens | 1M tokens |
| **Browser QA** | 58MB compiled binary | Native Playwright MCP |
| **Multi-agent** | Sequential sessions | Parallel Agent Manager |
| **Autonomy** | Frequent confirmations | Walk away, come back to a PR |
| **Self-improvement** | Static skill files | Living Skills — updates after every run |
| **Works in** | Claude Code only | Antigravity + Gemini CLI |

---

## Quick Start

```bash
# 1. Clone the repository into your project
git clone https://github.com/Yasuui/ystack.git .ystack

# 2. Run the bootstrap script
./.ystack/install.sh

# 3. Paste the contents of config/bootstrap.md into your Agent Manager
# → Done! Your agent swarm is now configured and active.
```

---

## Agent Roster

ystack uses a "divide and conquer" approach. Each task is handled by a specialized agent with a specific role and set of tools.

| Agent | Icon | Role | Invoke when |
| :--- | :---: | :--- | :--- |
| **Frontend** | 🎨 | Premium UI + `taste-soft-skill` | Any UI change, new component, design work |
| **Backend** | ⚙️ | API / DB / Server Logic | endpoints, DB schema, auth, IPC |
| **QA** | 🧪 | Playwright + Integrity Tests | All user-facing features — always |
| **Review** | 🔒 | Security + Correctness Audit | Before every ship — always |
| **Ship** | 🚢 | Git + PR + Deploy | After Review and QA return READY |
| **RootCause** | 🔍 | Debug-first Detective | Any broken test, runtime error, or unstable system |
| **Docs** | 📝 | README + JSDoc + Comments | New public APIs, components, README updates |

---

## MCP Power-Ups

ystack comes pre-configured with the following Model Context Protocol (MCP) integrations for max autonomy:

| MCP | Purpose | Capability |
| :--- | :--- | :--- |
| **GitHub** | Version Control | Create PRs, issues, commits via agent |
| **Context7** | Live API Intelligence | Verify library methods in real-time |
| **Playwright** | Browser Automation | E2E testing and web scraping |
| **Supabase** | Cloud DB & Auth | Manage production database schemas |
| **FireCrawl** | Deep Web Research | Extract structured data from any URL |

---

## The "Living Skills" System

ystack agents don't just execute; they learn.
- **Learning**: Every session's new patterns are recorded in `swarmstack/skills/living-skills.md`.
- **Memory**: State is shared through `.agents/brain/`.
- **Self-Improvement**: The `rootcause` agent updates skills based on resolved bugs to prevent regression.

---

## Repo Structure

```
ystack/
├── README.md
├── AGENTS.md              ← lean, points to config/
├── CONTRIBUTING.md
├── LICENSE
├── .gitignore
├── install.sh
├── config/
│   ├── README.md
│   ├── AGENTS.global.md   ← the full global rules (only lives here)
│   ├── AGENTS.project-template.md
│   └── bootstrap.md       ← the detailed bootstrap prompt (only lives here)
├── swarmstack/
│   ├── orchestrator.md
│   ├── agents/
│   │   ├── frontend.md
│   │   ├── backend.md
│   │   ├── qa.md
│   │   ├── review.md
│   │   ├── ship.md
│   │   ├── rootcause.md
│   │   ├── docs.md
│   │   └── marketing.md   ← new, from ystack-updates
│   ├── skills/
│   │   ├── living-skills.md
│   │   └── git-standards.md  ← new, from ystack-updates
│   └── examples/
│       └── focused-ai-GEMINI.md
├── mcp/
│   ├── README.md
│   └── settings.json
└── .agents/
    ├── brain/.gitkeep
    └── skills/
        └── market-soft-skill/  ← new, from ystack-updates
            ├── README.md
            ├── remotion-patterns.md
            ├── nano-banana-patterns.md
            └── x-post-patterns.md
```

---

## Built with ystack

[Focused AI](https://github.com/Yasuui) — real-time AI meeting co-pilot
(Tauri + Python + Gemini 2.0 Flash). Every feature shipped using ystack swarms.

---

## Contributing

We ❤️ open-source contributors! 
1. **Fork** the repo.
2. **Setup** per the Quick Start.
3. **Commit** using Conventional Commits.
4. **Pull Request** must pass the `Review` and `QA` agent audits.

---

*Built with ❤️ by [Yonis Diriye](https://github.com/Yasuui) Toronto.*
