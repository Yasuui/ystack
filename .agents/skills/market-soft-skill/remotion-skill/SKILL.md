---
name: remotion-skill
description: |
  Remotion video composition for marketing. Teaches AI to write Apple-quality motion
  in React/TypeScript. Covers spring physics, composition architecture, frame timing,
  text reveal patterns, and platform-specific output. For X posts, Substack headers,
  LinkedIn launches, and product demos. Stops AI from writing flat, linear, template-looking
  Remotion code.
---

# Remotion Skill

## Architecture Rules

### File structure (non-negotiable)
```
project-video/
├── src/
│   ├── Root.tsx              — all Composition registrations
│   ├── brand.ts              — single source of truth for all tokens
│   └── compositions/
│       ├── x/                — 1080×1080 square
│       ├── substack/         — 1456×816 landscape
│       └── linkedin/         — 1200×628 landscape
```

### brand.ts is the only place for tokens
Never hardcode a hex value inside a composition file. Every color, font, spring config, and timing constant lives in `brand.ts`. If you find yourself typing `#00d4aa` inside a `.tsx` file, stop and move it to `brand.ts` first.

```typescript
// brand.ts structure
export const BRAND = {
  // Backgrounds — never pure black
  bg: "#080810",
  bgCard: "rgba(255,255,255,0.03)",
  
  // Accent — one accent, one glow
  accent: "#00d4aa",
  accentGlow: "rgba(0,212,170,0.12)",
  
  // Text hierarchy
  white: "#ffffff",
  white80: "rgba(255,255,255,0.80)",
  white50: "rgba(255,255,255,0.50)",
  white20: "rgba(255,255,255,0.20)",
  
  // Surfaces
  border: "rgba(255,255,255,0.07)",
  
  // Typography
  mono: "'SF Mono','Fira Code','Cascadia Code',monospace",
  sans: "-apple-system,'SF Pro Display','Segoe UI',sans-serif",
  
  // Spring configs — named by feel, not numbers
  spring: {
    snappy:  { stiffness: 400, damping: 28 },  // UI feedback, small elements
    smooth:  { stiffness: 200, damping: 22 },  // Standard entrances
    gentle:  { stiffness: 120, damping: 18 },  // Full-screen transitions
    bouncy:  { stiffness: 300, damping: 12 },  // Only for icons, never text
  },
} as const;
```

---

## The Spring Pattern

This is how every animated element is written. No exceptions.

```typescript
// THE PATTERN — memorise this
import { useCurrentFrame, useVideoConfig, spring, interpolate } from "remotion";

const frame = useCurrentFrame();
const { fps } = useVideoConfig();

// 1. Spring value (0 → 1)
const entrance = spring({
  frame: Math.max(0, frame - DELAY),  // DELAY = when this element starts (in frames)
  fps,
  config: BRAND.spring.smooth,
});

// 2. Use interpolate to drive transform and opacity separately
const opacity = interpolate(entrance, [0, 1], [0, 1]);
const translateY = interpolate(entrance, [0, 1], [20, 0]);  // enters from below
```

**Rules for using the pattern:**
- `Math.max(0, frame - DELAY)` — always clamp to 0. Without this, elements animate backwards before their delay.
- Drive `opacity` and `transform` separately. Never combine into a single `interpolate` call.
- Start `translateY` offset at `12–24px` for small elements, `20–32px` for large ones.
- Translate direction should match the narrative: elements entering from the direction they came from.

---

## Timing Architecture

Every composition has phases. Name them in comments before writing the interpolation values.

```typescript
// ── PHASE TIMING (at 30fps) ──────────────────────────────
// 0-20:    Composition reveals (background gradients fade in)
// 20-50:   Headline enters
// 50-90:   Subheadline/tagline enters
// 90-180:  Content items stagger in (3 items × 20 frame spacing)
// 180-270: Hold — viewer reads
// 270-310: CTA enters
// 310-360: Hold on final frame
// Total:   360 frames = 12 seconds at 30fps
```

**Timing rules:**
- Each phase must have a hard start frame in a comment.
- Stagger between items in a list: `18–24 frames`. Less = rushed, more = slow.
- Hold on the final message: minimum `60 frames` (2 seconds). Viewers are reading.
- Total composition length: `300–450 frames` for X posts. `240–330 frames` for LinkedIn.
- Substack stills: `1 frame`. Export as PNG with `npx remotion still`.

---

## Text Reveal Patterns

### Pattern 1: Slide up (default for headlines)
```typescript
<div style={{
  opacity: interpolate(entrance, [0, 1], [0, 1]),
  transform: `translateY(${interpolate(entrance, [0, 1], [24, 0])}px)`,
}}>
  {headline}
</div>
```

### Pattern 2: Expand width (for accent underlines and rule lines)
```typescript
<div style={{
  width: interpolate(entrance, [0, 1], [0, targetWidth]),
  height: 3,
  background: BRAND.accent,
  borderRadius: 2,
}} />
```

### Pattern 3: Fade only (for metadata, labels, version numbers)
```typescript
<div style={{
  opacity: interpolate(entrance, [0, 1], [0, 1]),
  // no transform — labels don't move, they appear
}}>
  v1.0.0
</div>
```

### Pattern 4: Staggered list
```typescript
{items.map((item, i) => {
  const itemEntrance = spring({
    frame: Math.max(0, frame - (BASE_DELAY + i * STAGGER)),
    fps,
    config: BRAND.spring.smooth,
  });
  return (
    <div key={item} style={{
      opacity: interpolate(itemEntrance, [0, 1], [0, 1]),
      transform: `translateY(${interpolate(itemEntrance, [0, 1], [16, 0])}px)`,
    }}>
      {item}
    </div>
  );
})}
```

---

## Composition Templates

### X Post — XLaunch (1080×1080)
```
Frame 0-60:    Project name
Frame 65-155:  Tagline
Frame 160-300: Value props (3 items, 20-frame stagger)
Frame 305-390: CTA / URL
Frame 390-450: Hold
```
- Background: `BRAND.bg` with radial accent glow at top `(50% 0%)`
- Headline: `80–96px`, weight `800`, tracking `-3px`
- Tagline: `24–28px`, weight `400`, color `BRAND.white50`
- Value props: mono font, `20–22px`, checkmark (`✓`) in accent color before each
- CTA: URL in mono, `14–16px`, `BRAND.white20`

### X Comparison (1080×1080)
```
Frame 0-20:    Title fades in
Frame 20-30:   Column headers appear
Frame 30-220:  Rows stagger in (5 rows × 22 frames)
Frame 220-390: Hold
```
- Grid: `1fr 200px 1fr` — left (them), center (label), right (you)
- Left column: muted, potentially line-through on first row
- Right column: accent color on differentiated values
- Strikethrough first row: `textDecoration: "line-through"`, color `BRAND.white50`

### Substack Hero (1456×816) — still
```
Single frame render. No animation.
```
- Top-left: edition label — mono, `13px`, `BRAND.white20`, tracking `0.15em`
- Main text: left-aligned, `60–72px`, weight `800`, max-width `900px`
- Accent line: `64px` wide, `3px` tall, accent color, below headline
- Bottom-right: "by Yonis — Toronto" in mono, `13px`, `BRAND.white20`
- Export: `npx remotion still SubstackHero out/cover.png`

### LinkedIn Launch (1200×628)
```
Frame 0:       Spring entrance of full composition
Frame 0-60:    Category label fades
Frame 0-70:    Name/headline slides up
Frame 20-100:  Tagline body copy fades
Frame 40-150:  Pill tags stagger
Frame 60-200:  URL appears
Frame 200-300: Hold
```
- Category: mono, `13px`, accent color, tracking `0.12em`, all-caps
- Name: `52–60px`, weight `800`, tracking `-2px`
- Body: `20–24px`, weight `400`, `BRAND.white50`, max-width `560px`
- Pills: `borderRadius: 100`, `background: BRAND.bgCard`, `border: BRAND.border`

---

## What to Never Write in Remotion

- `transition: "all 0.3s ease"` — this is CSS, not Remotion. It does nothing.
- `animation: keyframes(...)` — use spring + interpolate. Never CSS keyframes inside Remotion.
- `Math.sin(frame / 10) * 20` — wiggle math. Looks like a physics demo, not marketing.
- `easing: Easing.linear` — banned. No exceptions.
- Importing `framer-motion` inside Remotion — won't work. Use Remotion spring.
- `useEffect` for animation values — values must be synchronously derived from `frame`.
- `useState` for animation values — same reason.
- Gradient stops with `purple` or `blue` as the primary — the AI gradient is banned.

---

## Output Commands

```bash
# Preview (studio opens at localhost:3000)
npx remotion studio

# Render specific composition
npx remotion render XLaunch out/x-launch.mp4

# Render still (Substack header)
npx remotion still SubstackHero out/substack-hero.png --frame=0

# Render with custom props (override project)
npx remotion render XLaunch out/x-launch-focused.mp4 --props='{"project":"focusedAI"}'

# Convert to GIF for platforms that don't allow MP4
ffmpeg -i out/x-launch.mp4 \
  -vf "fps=15,scale=1080:-1:flags=lanczos,palettegen" /tmp/palette.png && \
ffmpeg -i out/x-launch.mp4 -i /tmp/palette.png \
  -vf "fps=15,scale=1080:-1:flags=lanczos,paletteuse" out/x-launch.gif

# Package for distribution
npx remotion bundle
```

---

## Adding a New Project

1. Add to `brand.ts`:
```typescript
export const PROJECTS = {
  // ... existing
  myProject: {
    name: "My Project",
    tagline: "One line. No buzzwords.",
    accent: "#hex",
    url: "myproject.com",
  },
} as const;
```

2. Add compositions to `Root.tsx`:
```typescript
<Composition id="XLaunch_MyProject" component={XLaunch}
  durationInFrames={450} fps={30} width={1080} height={1080}
  defaultProps={{ project: "myProject" }} />
```

3. Render:
```bash
npx remotion render XLaunch_MyProject out/x-myproject.mp4
```
