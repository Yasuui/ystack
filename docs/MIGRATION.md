# From the original swarm to the smaller ystack

**Old:** globally enabled swarm and MCP stack, fixed multi-agent pipeline, persistent shared READY files.
**New:** explicitly chosen repo, one outcome, local contract, on-demand skills, proportional evidence, explicit external-action gates.

## If you used the old version

1. Preserve your working local environment. This repo does **not** import, overwrite, or delete your personal ~/.gemini, ~/.codex, MCP credentials, or other repositories.
2. Stop following the old Quick Start. Historical config/bootstrap.md, config/AGENTS.global.md, mcp/settings.json, swarmstack/orchestrator.md, and dispatch scripts have assumptions vNext intentionally drops.
3. While this refresh is staged on dev, clone with `git clone --branch dev https://github.com/Yasuui/ystack.git`, select one repo, and run `bash scripts/bootstrap-project.sh --target /absolute/path/to/your-repo` for a **dry run**. Use `--apply` only after reviewing the destination.
4. The installer copies three workspace skills and **skips existing files**. It never writes a GEMINI.md for you; use ystack-bootstrap to propose changes while preserving existing project rules/CI.
5. Test one harmless task in that selected repo. In Gemini CLI, check `/skills list` or `/skills reload`, then ask for ystack-verify. Verify actual agent behavior separately; static starter checks aren't a live model benchmark.

For Antigravity, keep your existing local config until you deliberately map and verify discovery paths for that version. This public starter is not a byte-for-byte copy of installed personal skills.

## Historical code remains inspectable

`scripts/full-run.js` and `scripts/parallel-dispatch.js` contain outdated hardcoded model names, a `--approval-mode=yolo` invocation, persistent shared-output gates, and forced agent sequences. **Do not run them on important projects** or call them the new runtime. They remain as historical source and can be revisited in a separate, measured implementation.

No migration is required merely to read the repository or a standalone skill.
