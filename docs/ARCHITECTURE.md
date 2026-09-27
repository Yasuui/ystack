# How ystack vNext works

This is a **public starter/design**, not an export of the maintainer's personal machine configuration. Static verification is available; these published skills still require fresh-session, end-to-end validation.

```text
Select ONE repo and ONE observable outcome
                 |
       project contract (local)
                 |
     activate one on-demand skill
    bootstrap / verify / ship
                 |
       focused evidence + unknowns
                 |
         PR / approval / handoff
                 |
    separate release-target checks
```

## Three small layers

1. **Global adapter:** locally owned, short routing defaults, no repo inventory. Gemini CLI may read `~/.gemini/GEMINI.md`, but this repo **never creates or edits it**. Use conceptual effort tiers FAST, DEFAULT, HIGH, ESCALATE, STRONGEST; map to your available provider/models and escalate for an observed reason.
2. **Project contract:** one selected repo's existing GEMINI.md/AGENTS.md and conventions. If missing, bootstrap proposes the smallest useful contract: purpose, in/out of scope, acceptance criteria, do-not-touch paths, current checks, release target, and approval boundaries. Do not duplicate its CI, auth, database, or deploy configuration.
3. **On-demand skills:** bootstrap sets boundaries; verify gathers evidence; ship prepares a handoff/PR. Do not load an elaborate specialist roster for every change.

## The loop

| Stage | Question | Evidence |
| --- | --- | --- |
| Scope | Which repo, outcome, and finish line? | Acceptance criteria |
| Inspect | What's already there? | Relevant files only |
| Implement | What is the smallest safe change? | Focused diff |
| Verify | Which checks would catch this regression? | Exact commands/results and skipped checks |
| Handoff | What's done and still unverified? | Ship card / PR |
| Release | Are the actual target and integrations ready? | Target-specific evidence and approval |

A docs typo needs a small diff check. An auth, money, migration, or external-send change demands proportionately deeper verification. Don't confuse test volume with quality.

## Two different kinds of proof

- **Change proof:** exact source revision and focused commands/results, relevant UI observations, and an explicit account of what wasn't run.
- **Release-target proof:** actual Preview environment, real OAuth/provider connection, persisted state/migration verification, verified sender/receipts, and approvals appropriate to this product. Synthetic fixtures and local mocks are not substitutes.

Unknown provider readiness stays **unverified or blocked**, not READY. Old shared output files cannot stand in for current-run results.

## Parallelism and browser use

One implementation agent by default. Delegate only genuinely independent tasks with disjoint files/worktrees or separate read-only review. No compulsory frontend→motion→QA→review pipeline and no automatic memory rewrites.

A future portable browser layer is under exploration: deterministic-first interaction where possible, explicit sessions, fresh observation after effects, bounded recovery, semantic fallback, and no secret leakage. This public starter **does not** claim to ship a verified Hermes remote-browser controller.

There is **no global installer or forced MCP stack**. [Gemini CLI skill discovery](https://geminicli.com/docs/cli/skills/) and [context hierarchy](https://geminicli.com/docs/cli/gemini-md/) are documented; verify Antigravity's current paths separately in your installed version.
