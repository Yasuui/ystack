---
name: market-skill
description: |
  The main marketing skill. Teaches AI how to produce high-quality marketing assets
  from scratch. Covers visual direction, motion design, copywriting, platform strategy,
  and brand identity. For Remotion videos, Nano Banana graphics, Substack headers,
  X posts, LinkedIn, and product launches. Stops the AI from producing generic,
  forgettable, "looks like everyone else" marketing output.
---

# Market Skill

## Settings

Adjust these three dials (1–10) before generating any asset:

```
BRAND_INTENSITY = 8       // How distinct and ownable is the visual identity?
                          // 1-3: Minimal, almost invisible branding
                          // 4-7: Balanced — clear brand without being loud
                          // 8-10: Strong, immediately recognisable. Every pixel serves the brand.

MOTION_DRAMA = 7          // How cinematic and choreographed is the motion?
                          // 1-3: Almost no animation. Typography does the work.
                          // 4-7: Purposeful motion. Each element earns its entrance.
                          // 8-10: Choreographed sequences. Apple-level timing precision.

COPY_DIRECTNESS = 8       // How confident and direct is the language?
                          // 1-3: Soft, benefit-focused, descriptive
                          // 4-7: Confident but approachable
                          // 8-10: Blunt, specific, zero hedging. No adjectives without proof.
```

---

## Visual Identity Standards

### Color

The most common mistake: using more than one accent color.

- Pick one accent. Use it as a signal, not decoration.
- The background is not `#000000`. Use deep, slightly-tinted darks: `#080810`, `#0c0c14`, `#0a0f0f`.
- Never use the generic "AI gradient" — purple-to-blue linear gradient. It signals you ran out of ideas.
- White is not `#ffffff` for body text. Use `rgba(255,255,255,0.80)` or `rgba(255,255,255,0.65)`. Pure white on dark backgrounds is harsh.
- Tint your shadows. If background is `#080810`, shadows should be `rgba(0,0,0,0.6)` with a slight blue tint — not pure black.
- Glow should be subtle. `rgba(accent, 0.12)` in a radial gradient at the top. Not a lighthouse.
- Build a palette of 4 values: background, surface, accent, and muted text. Nothing else.

### Typography

- Display text (48px+) gets `letter-spacing: -2px` to `-4px`. Tight headlines look considered.
- Body text gets `letter-spacing: 0` or very slightly positive (0.1px max).
- Never mix more than two typefaces in one asset.
- Mono fonts for technical labels, file paths, version numbers, and metadata. Not for body copy.
- Line-height for headlines: `1.0` to `1.08`. Tight. Marketing is not a blog post.
- Line-height for body: `1.5` to `1.6`. Breathing room.
- Font weights: use 400 (body), 500 (sub-labels), 700 (emphasis), 800 (display). Skip 600 for display — it looks indecisive.
- All caps labels: only in mono, only for metadata-level information (version tags, dates, categories). Never all-caps for headings.

### Spacing

- Headers need room. Below every display headline: `24px` minimum before the next element.
- Cards breathe. Internal padding: `32px` minimum on all sides.
- Element groups are separated by 2x the internal spacing. If items inside a card have `16px` gap, the card-to-card gap is `32px`.
- Don't center everything. Left-aligned hierarchies with generous left margin often read more confident than centered layouts.
- Horizontal margins on full-width containers: at least `72px` each side at 1080px width.

### Surfaces and Depth

- Cards are `rgba(255,255,255,0.03)` or `rgba(255,255,255,0.04)` on dark backgrounds. Not `#1a1a1a`.
- Card borders are `rgba(255,255,255,0.07)`. Not `1px solid #333`.
- Glassmorphism: `backdrop-filter: blur(24px) saturate(160%)`. Saturate is as important as blur.
- Layering: use `z-index` and subtle box-shadows to communicate depth. Three layers minimum in complex compositions: background, mid-plane, foreground.
- Noise texture on backgrounds: use `0.03` opacity SVG noise filter or CSS grain. Pure flat dark is lifeless.

---

## Motion Standards

### The rules Apple lives by (and so do we)

- **Every animation has a purpose.** If removing it doesn't make the asset worse, remove it.
- **Spring physics only.** Never linear easing. Never `ease-in-out` on product motion. `spring({ stiffness: 200-400, damping: 18-28 })`.
- **Stagger by purpose, not just timing.** Items that belong together enter together. Items that are hierarchically different enter in sequence.
- **Exit matters as much as entrance.** If elements leave the screen, they fade and translate in the direction of the narrative.
- **Hold your best frame.** After the main message arrives, hold for 1–2 seconds before any exit. The viewer needs to read it.
- **Frame 0 is a composition.** Even before any animation plays, the first frame should look intentional.

### Timing reference (at 30fps)

```
Instant feedback:     2–4 frames   (hover states, button presses)
Fast entrance:        8–14 frames  (small elements, labels)
Normal entrance:      14–22 frames (cards, headlines)
Slow reveal:          22–36 frames (full-screen transitions)
Hold (after arrival): 30–60 frames (let the viewer absorb)
```

### What to never do

- Do not bounce text. Spring physics ≠ cartoon bounce. `damping` below 14 on text is always wrong.
- Do not animate everything at once. Simultaneous entrance of 5+ elements reads as chaos.
- Do not use `rotate` on text for entrance. It looks like a template.
- Do not loop video for social unless the loop point is invisible.
- Do not put motion behind static text. The motion wins. The text loses.

---

## Platform Standards

### X Posts (1080×1080)

- One idea per video. Not three. One.
- The first 8 frames decide whether someone keeps watching. Lead with the most provocative frame.
- Text size minimum: `40px`. This will be viewed on a phone at 2x resolution.
- Maximum 40 words of text visible at any point.
- End frame should be shareable as a screenshot. It will be screenshotted.
- Safe zone: `80px` inset from all edges. Platform UI overlaps corners.
- No watermarks, no logos in the center. Your brand is the aesthetic, not the logo.

### Substack Headers (1456×816)

- This is a still image. Motion is irrelevant.
- The cover image is the first impression. It should communicate: medium (newsletter), author (Yonis / Standard Bio.), topic, tone — in that order.
- Dark background with large left-aligned text performs better than centered layouts for newsletters targeting technical readers.
- Include: edition number (small, mono, top-left), main headline (large, display, center-left), a single horizontal rule or accent line, and publication name (bottom-right, small, mono).
- Avoid stock photography. Use abstract geometry, grain, or solid color with typography.
- Font contrast: one ultra-bold display headline, everything else 40% the size.
- Export at 2x resolution.

### LinkedIn (1200×628)

- Landscape. Professional, not casual.
- More text is acceptable here than on X. Technical readers will read.
- Include pill tags for searchability — they signal category and aid skimming.
- Avoid stock-photo backgrounds. Either solid dark or abstract pattern.
- Call to action: one line, bottom-right, muted color. Not a button graphic.
- Logo placement: bottom-left or top-left. Consistent with your other LinkedIn posts.

---

## Common Failures (ban these immediately)

### Visual failures

- The purple-to-blue linear gradient. This is the #1 signal that you used a default template.
- Pure white text on pure black background. The harshness signals no craft.
- Centered layout with three equal-width columns. This is the default AI marketing grid. Destroy it.
- Lucide icons as the primary visual element. They are utility icons, not brand assets.
- Generic "hero glow" — a radial gradient at 50% opacity centered on the middle of the frame. It does nothing.
- Drop shadows at `0 4px 6px rgba(0,0,0,0.1)`. Too weak to create depth, too strong to be invisible.
- Font size under 28px in any marketing video frame. It will be unreadable at mobile resolution.
- More than 60 words on screen at once in a video. This is a frame, not a document.

### Copy failures

- "Elevate your workflow" — banned.
- "Seamless experience" — banned.
- "Next-gen AI-powered" — banned.
- "Game changer" — banned.
- "Built for X, loved by Y" — banned.
- Exclamation marks in product launches — banned. Confidence doesn't need them.
- Any passive voice in a CTA: "Be empowered to..." — banned.
- Vague benefit statements: "Save time and money" — banned. Say how much. If you can't, say something specific.

### Motion failures

- Linear easing on any product motion.
- Simultaneous entrance of all elements.
- Text rotating in on the Y axis.
- Fake "glitch" effects as a transition. It was interesting in 2019.
- Countdown timers that serve no narrative purpose.
- Camera shake or handheld simulation on still graphics.
- Looping animations that have a visible cut point.

---

## Audit Checklist

Before delivering any marketing asset, run through this list:

**Visual**
- [ ] Background is not `#000000` or pure white
- [ ] Only one accent color in use
- [ ] Typography uses maximum two typefaces
- [ ] Display text is tracked tight (`letter-spacing: -2px` or tighter)
- [ ] Cards use transparent surfaces, not solid fills
- [ ] Depth is communicated through layering and shadow, not just border

**Motion**
- [ ] All easing uses spring physics
- [ ] Elements enter in purposeful sequence, not simultaneously
- [ ] Frame 0 looks intentional as a still
- [ ] End frame is screenshottable
- [ ] Motion has no visible loop cut (if looped)

**Copy**
- [ ] Zero use of banned words (Elevate, Seamless, Next-gen, Game-changer)
- [ ] Every benefit claim is specific or removed
- [ ] CTA is in active voice
- [ ] No exclamation marks

**Platform**
- [ ] Text is readable at mobile resolution (40px minimum for video)
- [ ] Safe zones respected
- [ ] Dimensions match platform spec exactly
