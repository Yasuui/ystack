# Git Standards — ystack

Every commit tells a story. Identical messages across different changes
signal an agent on autopilot. Each commit describes exactly what changed
and why — specific enough that someone reading the log understands the
project history without opening any files.

## Commit Format

type(scope): description

[optional body — why this change, not what it is]

### Types

feat     — new capability
fix      — bug corrected
refactor — code restructured, behavior unchanged
docs     — documentation only
test     — tests added or fixed
chore    — build, deps, tooling
perf     — performance improvement
agent    — agent prompt or skill updated
assets   — images, videos, static files

### Scope

Always specific — the module or area affected:
fix(bridge) not fix(src)
feat(qa-agent) not feat(agents)
docs(readme) not docs
assets(hero-banner) not assets

## Rules

One commit per logical change.
If you touched the bridge server AND the README, that is two commits.

Subject line under 72 characters.

Subject in imperative mood: "add X" not "added X" or "adds X"

No period at end of subject line.

Never use these messages:
- feat: initial commit (except the very first commit)
- fix: bug fix
- docs: update README
- chore: various changes
- feat: add files / feat: add all files
- Any message that applies to any other commit in the repo

## Examples

Setting up a new repo — DO NOT use one commit for everything:

Wrong:
git commit -m "feat: initial ystack setup"

Right:
git commit -m "feat(readme): add comparison table and quickstart"
git commit -m "feat(config): add AGENTS.global.md and project template"
git commit -m "agent(swarmstack): add 7 specialist agent prompts"
git commit -m "chore(mcp): add settings.json with correct package names"
git commit -m "ci: add GitHub Actions TOML validation"

Fixing a bug:

Wrong:  fix: bug fix
Right:  fix(bridge): guard ws.close() with iscoroutinefunction check

Adding an agent:

Wrong:  feat: add agent
Right:  agent(marketing): add Marketing Agent — Remotion, Nano Banana 2, X posts

Updating docs:

Wrong:  docs: update README
Right:  docs(readme): add comparison table and gstack vs ystack section
        docs(readme): add social proof — Focused AI showcase section

## PR Descriptions

Every PR answers these four questions:

## What changed
[2-3 sentences. What is different after this PR lands.]

## Why
[The problem this solves.]

## What to review
[The most important files or decisions.]

## Testing
[How you verified this works. Be specific.]

PR titles follow the same format as commit messages.

## Agent Checklist Before Committing

1. Is this one logical change? If you touched 3 unrelated things, split into 3 commits.
2. Does the subject describe THIS specific change, not a generic category?
3. Is the scope specific enough?
4. Would this message make sense in the git log 6 months from now?
5. Is the subject under 72 characters?

If any answer is no — rewrite before committing.
