---
name: nano-banana-skill
description: |
  Nano Banana image generation for marketing assets. Artist-level visual direction
  for brand graphics, thumbnails, Substack covers, X post backgrounds, and LinkedIn
  headers. Covers prompt architecture, lighting direction, composition rules,
  style consistency, and what to never generate. Stops AI from producing generic
  Midjourney-looking stock imagery.
---

# Nano Banana Skill

## The Artist Mindset

Nano Banana is not a prompt box. It is a collaborator. The quality of output is entirely determined by the quality of direction. Vague prompts produce vague images. Specific direction produces specific results.

Before generating any image, answer these four questions:

1. **What is the exact subject?** (not "a developer" — "a terminal window on a dark glass desk, partially reflected, 3/4 angle from the left")
2. **What is the lighting source?** (not "good lighting" — "single cool blue rim light from the top-left, ambient fill from below in warm amber, no direct frontal fill")
3. **What is the camera relationship to the subject?** (close-up, wide establishing, isometric, top-down, eye level, slightly below)
4. **What mood or decade does this reference?** (Apple keynote 2020, early Stripe.com, Vercel 2023, editorial NYT tech section)

If you cannot answer all four, you are not ready to generate.

---

## Prompt Architecture

### Structure every prompt in this order:

```
[Subject description] + [spatial positioning] + [lighting] + [surface/material] +
[background treatment] + [color palette] + [mood/atmosphere] + [technical specs] +
[negative prompt]
```

### The negative prompt is as important as the positive

Always include a negative prompt. The default negative prompt for all brand assets:

```
--no stock photography, watermark, lens flare, excessive bokeh, 
saturated gradients, cartoon, illustration style, human faces,
text overlaid, banner ads, corporate clipart, plugin icons,
emoji-style graphics, purple-to-blue AI gradient
```

---

## Asset Types and Prompts

### Substack Header Background

Goal: abstract, editorial, dark. The text sits on top — the background should not compete.

**Prompt template:**
```
Abstract architectural geometry, [specific material: brushed titanium / oxidized steel / dark concrete / 
smoked glass] surface, extreme close-up macro photography, shallow focus, cool ambient light from 
the left at 15 degrees, rich dark shadows, [accent color]-tinted atmospheric haze in the midground, 
no horizon line, no recognisable objects, mood: late-night studio, editorial, considered
--ar 16:9 --no text, faces, plants, logos, purple gradients, stock look
```

**Examples of specific subjects that work:**
- Macro of circuit board traces, deep green with amber highlights
- Oxidized metal surface with fine horizontal lines, lit from left
- Dark concrete with a single crack, top-down, blue ambient fill
- Glass prism face, black background, narrow teal beam refraction
- Brushed aluminum sheet, specular highlight along the top edge only

### X Post Background / Frame

Goal: visual tension without distraction. The background should make the text pop, not compete with it.

**Prompt template:**
```
[Subject] centered in negative space, isolated on near-black background (#080810),
single [color]-toned rim light from the [direction], no secondary light sources,
photorealistic material rendering, [specific material quality], extreme high resolution,
no motion blur, sharp focus on subject, atmosphere: confident, technical, quiet power
--ar 1:1 --no gradient backgrounds, text, logos, watermarks, soft vignette
```

**What works:**
- A single object with strong material quality (glass, metal, carbon fiber) in negative space
- Abstract particle fields at very low opacity (grain, not sparkle)
- Minimal geometric forms: a single line, a single plane, a single point of light
- Terminal or interface fragments, partially visible, blurred to abstraction

**What never works:**
- Busy scenes with multiple subjects
- Gradients as the hero element (they look dated in 12 months)
- Typography in the generated image (it will be wrong)
- Anything that looks like an ad

### Thumbnail / Feature Image

Goal: strong, recognisable, shareable. Must read at 240×135px.

**Prompt template:**
```
[Clear subject with high contrast] on [simple/solid background], dramatic directional lighting,
subject fills [60-80]% of frame, strong [light/dark] value contrast, single dominant color,
graphic composition, editorial photography style, not a render, photorealistic,
mood: [technical authority / quiet confidence / maker energy]
--ar [16:9 or 1:1] --no busy backgrounds, multiple subjects, text, watermark
```

**Thumbnail rules:**
- High contrast between subject and background. If they're the same value, it won't read small.
- One dominant color. Not two. Not three.
- Subject is large. Not a figure in a landscape. A figure that fills the frame.
- Avoid symmetry — off-center compositions have more tension.

### LinkedIn Header

Goal: professional without being corporate. Technical without being cold.

**Prompt template:**
```
Wide panoramic [subject], [1200×628 landscape composition], low horizon line,
atmospheric depth with soft focus background, cool blue-grey ambient light,
[single warm accent light source], near-monochromatic palette with one [color] accent,
editorial technology photography, cinematic, 2:1 aspect ratio
--ar 2:1 --no text, logos, corporate photography, stock look, cheesy handshake
```

---

## Color Direction per Project

### ystack
- Palette: deep dark navy (`#080810`), teal accent (`#00d4aa`), white text
- Lighting: cool rim light, teal atmospheric haze
- Materials: metal, code, glass, terminal
- Mood: technical authority, open source, late-night builder

### Focused AI
- Palette: deep dark (`#080810`), violet accent (`#7c6bff`), soft white
- Lighting: soft violet rim light, warm fill from below
- Materials: glass, fabric (headphones, desk surface), acoustic foam
- Mood: quiet focus, considered, minimal

### Lumina
- Palette: dark (`#080810`), amber/gold accent (`#f59e0b`), white
- Lighting: warm amber directional, cool fill
- Materials: brushed gold, glass, clean data surfaces
- Mood: financial confidence, Canadian, modern not flashy

### Standard Bio.
- Palette: black (`#080810`), teal dot accent, editorial
- Lighting: editorial photography, high contrast, newspaper energy
- Materials: paper texture, ink, signal imagery
- Mood: considered, signal vs noise, infrastructure

---

## Composition Rules

### Rule 1: One subject, one relationship
Every image has one subject and one spatial relationship to the viewer. Do not add secondary subjects to "fill space."

### Rule 2: Light has a source
Light does not come from everywhere. Specify exactly one primary light source direction and temperature. Fill light (secondary) is optional.

### Rule 3: Negative space is not empty
Background is not just a void. It has texture, depth, and atmosphere. A very subtle grain at `0.03` opacity is different from nothing.

### Rule 4: Materials have a story
"Metal" is not specific. "Brushed titanium with a horizontal grain, slightly oxidized on the edges" is specific. Material quality signals craft.

### Rule 5: The thumbnail test
Before approving any asset, squint at it. Can you still read the composition? If it becomes undecipherable when blurred, the composition is too complex.

---

## What to Never Generate

- **Faces.** They distract, they get weird, and they belong in photography, not brand graphics.
- **Motivational imagery** — silhouette of a person climbing a mountain, person looking at horizon, fist pump.
- **Corporate diversity photography** — diverse group of people around a laptop, smiling at a boardroom.
- **The AI gradient** — purple-blue linear gradient as background. Banned in all contexts.
- **Lens flare as a style choice** — this was cinematic in 2012. It is now a stock photo filter.
- **Text in generated images** — Nano Banana will misspell it. Text goes in the composition layer, not the generated image.
- **Logos of any kind** — cannot be generated accurately. Create separately and composite.
- **Neon cyberpunk** — bright neons on dark backgrounds with rain effects. This aesthetic ages poorly.
- **Generic "tech" imagery** — glowing neural networks, floating UI elements, hands touching holograms.

---

## Iteration Protocol

1. **Generate 3 variants of the same prompt** before choosing. First generation is rarely the final.
2. **Adjust one variable at a time.** If you change lighting AND subject AND background simultaneously, you cannot learn which change improved the image.
3. **Write the winning prompt down** in `.agents/brain/image-library.md` with the asset it was used for.
4. **Build a prompt library.** Every successful prompt is an asset.

---

## Asset Sizing Reference

| Asset | Dimensions | Format | Notes |
|-------|-----------|--------|-------|
| Substack header | 1456×816 | PNG | Export at 2x |
| X post frame | 1080×1080 | PNG | Safe zone 80px |
| X post video bg | 1080×1080 | PNG | Used as bg layer in Remotion |
| LinkedIn header | 1200×628 | PNG | |
| Thumbnail (16:9) | 1280×720 | PNG | Must read at 240×135 |
| README hero | 1200×630 | PNG | GitHub OG card size |
| Favicon | 512×512 | PNG | Centered subject, high contrast |
