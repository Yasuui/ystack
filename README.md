# ystack — Antigravity Swarm System ⚡

> **Free, open-source multi-agent developer swarm for Antigravity IDE and Gemini CLI.**

ystack is a framework for orchestrating specialized AI agents to build, test, and ship software with extreme autonomy. It leverages the **Antigravity IDE** and **Gemini 2.0 Flash** to provide a seamless, local-first development experience.

---

## ── Quick Start 🚀

```bash
# 1. Clone or copy to your project root
git clone https://github.com/Yasuui/ystack.git .ystack
cp -r .ystack/config/ .

# 2. Run bootstrap script
./.ystack/install.sh

# 3. Paste the contents of config/bootstrap.md into your Agent Manager
# → Done! Your agent "swarm" is now active.
```

---

## ── Agent Roster 🕵️‍♂️

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

## ── MCP Power-Ups 🔌

ystack comes pre-configured with the following Model Context Protocol (MCP) integrations for max autonomy:

| MCP | Purpose | Capability |
| :--- | :--- | :--- |
| **GitHub** | Version Control | Create PRs, issues, commits via agent |
| **Context7** | Live API Intelligence | Verify library methods in real-time |
| **Playwright** | Browser Automation | E2E testing and web scraping |
| **Supabase** | Cloud DB & Auth | Manage production database schemas |
| **FireCrawl** | Deep Web Research | Extract structured data from any URL |

---

## ── The "Living Skills" System 🧠

ystack agents don't just execute; they learn. 
- **Learning**: Every session's new patterns are recorded in `swarmstack/skills/living-skills.md`.
- **Memory**: State is shared through `.agents/brain/`.
- **Self-Improvement**: The `rootcause` agent updates skills based on resolved bugs to prevent regression.

---

## ── Repo Structure 📂

```
ystack/
├── README.md               # You're reading this
├── AGENTS.md               # Lean project entry point
├── CONTRIBUTING.md         # How to contribute
├── LICENSE                 # MIT License (Copyright 2026 Yonis Diriye)
├── install.sh              # Project bootstrap script
├── config/                 # Global configuration templates
│   ├── AGENTS.global.md    # Shared rules for all projects
│   └── bootstrap.md        # The "Seed Prompt" for Agent Manager
├── swarmstack/             # Agent and skill definitions
│   ├── agents/             # Specialist agent markdown prompts
│   └── skills/             # Modular living skill definitions
├── mcp/                    # Local MCP server settings
└── .agents/                # Local runtime context (not committed)
    └── brain/              # Agent persistent state
```

---

## ── Contributing 🤝

We ❤️ open-source contributors! 
1. **Fork** the repo.
2. **Setup** per the Quick Start.
3. **Commit** using Conventional Commits.
4. **Pull Request** must pass the `Review` and `QA` agent audits.

---

*Built with ❤️ by [Yonis Diriye](https://github.com/Yasuui) Toronto.*
