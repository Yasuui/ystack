# market-soft-skill

Gives your AI good marketing taste. Stops it from producing generic, forgettable, "looks like everyone else" output.

The marketing equivalent of taste-skill. Five skills, each in its own folder. Built for technical founders shipping real products.

## Skills

| Skill | Covers | When to use |
| --- | --- | --- |
| market-skill | Visual identity, color, motion, platform standards, audit checklist | Every marketing asset |
| remotion-skill | Remotion architecture, spring physics, composition templates, render commands | X posts, Substack headers, LinkedIn videos |
| nano-banana-skill | Image prompt architecture, lighting direction, asset types, banned subjects | Generating brand graphics, thumbnails, backgrounds |
| copy-skill | X posts, threads, Substack, LinkedIn, display headlines, banned words | Writing any marketing copy |
| launch-skill | 7-day launch arc, asset sequence, platform order, GitHub presence | Product launches |

## Quick Start
Reference whichever skill is relevant in your prompt:
- Read and strictly follow `.agents/skills/market-soft-skill/market-skill/SKILL.md`
- Read and strictly follow `.agents/skills/market-soft-skill/remotion-skill/SKILL.md`
- For Remotion video generation, read both `market-skill` and `remotion-skill`.
- For image generation, read `market-skill` and `nano-banana-skill`.
- For copy, read `copy-skill`.
- For a launch, read all five.

## Settings
Each skill has tunable dials at the top of its `SKILL.md` file.

`market-skill`:
- `BRAND_INTENSITY` — how distinct and ownable is the visual identity
- `MOTION_DRAMA` — how choreographed is the motion
- `COPY_DIRECTNESS` — how blunt and specific is the language

## Project Tokens
This skill is calibrated for:
- **ystack** — teal accent, technical authority, open source
- **Focused AI** — violet accent, quiet focus, privacy-first
- **Lumina** — amber accent, financial confidence, Canadian
- **Standard Bio.** — editorial, infrastructure, signal vs noise

## Structure
```text
.agents/skills/market-soft-skill/
├── README.md                          — this file
├── market-skill/
│   └── SKILL.md                       — core visual + motion standards
├── remotion-skill/
│   └── SKILL.md                       — Remotion composition architecture
├── nano-banana-skill/
│   └── SKILL.md                       — image generation direction
├── copy-skill/
│   └── SKILL.md                       — copywriting standards
└── launch-skill/
    └── SKILL.md                       — product launch playbook
```

Built with direct reference to taste-skill structure. Same philosophy, different domain.
