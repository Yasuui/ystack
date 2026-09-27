# ystack ⚡

**A small, opt-in development harness for building real products with AI agents.**

Choose **one repository**, define **one outcome**, make the smallest working change, and show what actually worked. You don't need a giant swarm, a long instruction file, or six MCP servers to fix a button.

> **September 2026 refresh:** vNext is a public starter informed by my newer local Antigravity/Gemini workflow. It is **not** a copy of my personal global configuration. Static starter checks are included; live Antigravity, model, and external-provider validation remain separate. The original March swarm is retained as a historical experiment.

## How it works

| Layer | Job |
| --- | --- |
| Small global adapter | Your own short defaults and conceptual model tiers; **never installed by ystack** |
| Project contract | Local scope, acceptance criteria, constraints, and existing conventions |
| On-demand skills | Bootstrap one project, verify a change, and prepare a clear handoff |

**The loop:** selected repo → outcome → smallest useful change → focused verification → evidence → PR/handoff → separate release checks if needed.

## Try it in one project

This safe, opt-in setup targets **Gemini CLI** skill discovery. It does not alter global settings, install MCP servers, run agents, or scan your other repositories.

```bash
git clone https://github.com/Yasuui/ystack.git
cd ystack

# Preview first. Replace this with the absolute path of ONE project.
bash scripts/bootstrap-project.sh --target /absolute/path/to/your-repo

# Only after checking the preview:
bash scripts/bootstrap-project.sh --target /absolute/path/to/your-repo --apply
```

Open **that project** in Gemini CLI. Run `/skills list` or `/skills reload`. Then ask:

> Use ystack-bootstrap. Inspect only this repository, respect its existing conventions, and propose one small first task. Don't change global settings or duplicate existing tools.

Gemini CLI supports [workspace skills](https://geminicli.com/docs/cli/skills/) and [hierarchical GEMINI.md context](https://geminicli.com/docs/cli/gemini-md/). For **Antigravity**, verify the skill discovery paths in your installed version; this is not an Antigravity auto-installer.

Existing project instructions and installed skills are **never overwritten**. Dry-run is the default.

## Three skills, not nine agents

| Skill | Use it for | Output |
| --- | --- | --- |
| [ystack-bootstrap](vnext/skills/ystack-bootstrap/SKILL.md) | Onboard one selected repository | Small project contract and acceptance criteria |
| [ystack-verify](vnext/skills/ystack-verify/SKILL.md) | Check only the affected change | Exact evidence, results, and unknowns |
| [ystack-ship](vnext/skills/ystack-ship/SKILL.md) | Prepare reviewed work | Concise ship card and PR/handoff |

Default to **one agent**. Specialists and parallel tasks are optional and should own non-overlapping work. `FAST / DEFAULT / HIGH / ESCALATE / STRONGEST` are conceptual effort tiers, **not fixed model IDs**.

### Deliberately out of scope

No global repo scanning; automatic MCP setup; mandatory Playwright or full-suite testing for every edit; blanket YOLO permissions; automatic production merges, migrations or customer sends. A local green test **does not prove** live Preview, authentication, database, or provider readiness.

**Read next:** [Architecture](docs/ARCHITECTURE.md) · [Migration from v1](docs/MIGRATION.md) · [My public lab notes](https://github.com/Yasuui/Yasuui/tree/main/lab).

**Historical v1:** `swarmstack/`, `config/bootstrap.md`, `mcp/settings.json`, and the old dispatch scripts remain for study. They are not the recommended setup. `install.sh` now redirects to the safe, selected-project bootstrap.

Built and maintained by [Yonis Diriye](https://github.com/Yasuui).
