---
name: ystack-bootstrap
description: Onboard or simplify an AI coding workflow inside ONE explicitly selected Git repository. Use when a developer asks for a minimal project contract, a first scoped task, or an audit of excessive agent instructions without scanning unrelated projects.
---

# Bootstrap only the selected project

Outcome: one small project contract and one concrete first task. This is a **skill**, not a global configuration installer.

1. **Boundary:** identify the repository path the user selected and the task. If none was selected, ask instead of scanning adjacent projects, GitHub, or home directories.
2. **Inspect selectively:** read that repo's README, project instructions, and relevant scripts/CI *only as needed*. Preserve current architecture, auth, database, test, and deployment conventions. Do not duplicate existing tools.
3. **Local contract:** if project instructions are missing, draft the smallest suitable GEMINI.md or AGENTS.md using the vnext template. If they exist, propose minimal modifications; do not overwrite automatically.
4. **First outcome:** state an observable result, two to four acceptance criteria, in/out-of-scope paths, current target (local/Preview/production), and relevant checks.
5. **Route sparingly:** start with one agent. Add specialists only for independent work with non-overlapping files/worktrees. Conceptual effort tiers are FAST, DEFAULT, HIGH, ESCALATE, STRONGEST; choose actual models locally and escalate for a reason.
6. **Stop:** report exactly what was inspected, changed/proposed, the first scoped task, what was preserved, and what remains unknown.

Never alter global Gemini/Codex settings, install MCPs, read sibling repos, expose secrets, send externally, migrate databases, deploy, or merge based only on a bootstrap request.
