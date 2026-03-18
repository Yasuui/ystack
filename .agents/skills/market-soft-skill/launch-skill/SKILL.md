---
name: launch-skill
description: |
  Product launch playbook for indie devs and technical founders. Covers asset sequencing,
  timing, platform order, community posting strategy, GitHub presence, and the 48-hour
  launch window. For ystack, Focused AI, Lumina, and Standard Bio. launches.
  Stops AI from producing generic "launch day" checklists that ignore distribution reality.
---

# Launch Skill

## The Launch Is Not a Moment

Launches fail when treated as a single event.

A launch is a 7-day arc:
- Day -3: Seed
- Day -1: Prime
- Day 0: Publish
- Day 1: Amplify
- Day 3: Follow-up
- Day 7: Compound

---

## Asset Sequence

Produce assets in this order. Never skip a step.

### Step 1: The end frame first
Build the one image you want people to screenshot and share. For ystack: the comparison table. For Focused AI: the overlay screenshot with real insights. For Lumina: the command centre with real account data.

This image is not made last. It is made first. Every other asset exists to point to it.

### Step 2: The README hero
The GitHub README is the landing page. Before posting anywhere, the README needs:
- Hero image (1200×630 Nano Banana graphic) — captures the aesthetic
- One-liner headline — what it is, for whom, in one sentence
- The comparison or differentiation table (if applicable)
- Install command that fits on one line
- 3–5 key features, specific (numbers where possible)
- Screenshot or screen recording embedded

### Step 3: Remotion X post video
The comparison or launch video. 15 seconds. Referenced in the first X post.

### Step 4: Substack header
If launching via Standard Bio., the cover image is required before writing.

### Step 5: Copy — post by post
Write each post in the sequence below. Do not write them all at once.

---

## Day -3: Seed

Plant early signals without announcing. The goal is discovery by the people most likely to care.

**GitHub:**
- Push the repo with a clean README
- Pin the repo on your profile
- Set the social preview: Settings → General → Social preview → upload hero image
- Add topics: `ai`, `open-source`, `gemini`, `developer-tools`, `typescript` (whatever applies)

**X:**
Post one observation without mentioning your project.
```
"Gemini CLI is underrated. 1M context window, free tier, function calling.
Most people are still sleeping on it."
```
No link. No product mention. Just signal.

---

## Day -1: Prime

**X:**
Post something that makes people curious about what you're building.
```
"Shipping something tomorrow. Built to replace a $20/mo tool I was tired of paying for."
```
No name. No link. Build tension.

**Communities (do this 24hrs before):**
- Draft your Gemini CLI GitHub Discussions "Show and Tell" post
- Draft your Hacker News Show HN post (if applicable)
- Do not post yet

---

## Day 0: Publish

**Order matters. Execute in this sequence:**

**8:00 AM EST**
1. Publish the GitHub repo (make public if it was private during setup)
2. Post the X launch thread

**X thread structure (Day 0):**
```
Post 1: The hook — specific claim, no preamble
"Shipped ystack.
7 agents, parallel execution, Gemini free tier.
Free alternative to gstack."
[link to repo]

Post 2: The why
"Tired of constant confirmations and needing a $20 Claude subscription.
Gemini CLI has 1M context and a free tier. Needed agents around it."

Post 3: The what
"ystack includes:
- Frontend, Backend, QA, Review, Docs, Ship, RootCause agents
- Marketing Agent for Remotion + Nano Banana
- git-standards skill
- living-skills that improve after every session"

Post 4: The comparison
[embed the XComparison video]

Post 5: CTA
"Open source. MIT license.
Drop a ⭐ if useful."
[link]
```

**10:00 AM EST**
3. Post in Gemini CLI GitHub Discussions under "Show and Tell"
4. Post in relevant Discord servers (if applicable)

**1:00 PM EST**
5. Post LinkedIn launch post
6. If Standard Bio. edition: publish it now (Friday 7 AM EST is the scheduled time — adjust if this is a non-Friday launch)

---

## Day 1: Amplify

**X:**
Reply to anyone who commented. Even short replies. Reply velocity signals the post is active and increases distribution.

Post one follow-up with real data:
```
"24hrs in. [number] stars, [number] clones.
Most surprising: [one specific observation from the response]."
```

**GitHub:**
- Watch your traffic in Insights → Traffic
- Note which referrer is sending the most traffic
- If HN or a specific X post is driving: reply in that thread

---

## Day 3: Follow-Up

**X:**
Post something you learned from the launch or from using the tool:
```
"One week with ystack.
Shipped [X PRs / Y features].
Most unexpected thing: [specific observation]"
```

**Substack (Standard Bio.):**
If this is a meaningful launch, write a brief "What I built and why" section in the next edition.

---

## Day 7: Compound

**X:**
Post one deep technical detail about how it works:
```
"How ystack's orchestrator decides which agent runs next:
[specific technical detail]
Most agents don't need to know this. I do."
```

**GitHub:**
Update the README with:
- Star count milestone (if crossed 100, 500, 1k)
- Link to any coverage or mentions
- Any major issues resolved from day-1 feedback

---

## Platform Priorities per Project

### ystack
1. X (primary — developer audience)
2. GitHub Discussions — Gemini CLI Show and Tell
3. LinkedIn (secondary)
4. Standard Bio. edition (if substantial release)

### Focused AI
1. X (primary)
2. ProductHunt (at v1.0 — not for beta)
3. LinkedIn
4. Indie Hackers (once revenue metrics exist)

### Lumina
1. LinkedIn (Canadian finance/startup community)
2. X
3. Standard Bio. (fits the editorial voice)
4. ProductHunt Canada category

### Standard Bio.
1. Substack (native)
2. X thread (each edition)
3. LinkedIn (editions about Canadian policy/tech)

---

## GitHub Presence Checklist

Before any launch, verify:

- [ ] Repository has a custom social preview image (1200×630)
- [ ] Repository is pinned on profile
- [ ] README has a hero image above the fold
- [ ] README has an install command on one line
- [ ] Repository has a description (the field under the name)
- [ ] Repository has relevant topics set
- [ ] LICENSE file exists (MIT for open source)
- [ ] CONTRIBUTING.md exists (even a minimal one)
- [ ] No TODO comments visible in the main branch
- [ ] No `.env` files in the repo (check `.gitignore`)

---

## What Kills Launches

- Posting at the wrong time. X engagement peaks 8–11 AM EST weekdays. LinkedIn peaks Tuesday–Thursday 7–9 AM and 12–1 PM EST.
- Asking for stars in the first post. Earn them by showing value.
- Posting to HN with "Show HN: I built a tool that..." — the title is the hook. "Show HN: Free multi-agent swarm for Gemini CLI" is better.
- Deleting and reposting because engagement was slow in the first 30 minutes. Give it 4 hours.
- Not replying to comments. Every reply extends post life by hours.
- Announcing before the README is ready. The first 100 visitors are the most important. Give them something real.
- Treating ProductHunt as a launch channel before you have users. PH is a vanity metric until you have retention data.
