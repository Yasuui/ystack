# Motion Skills

## Skill: Premium Spring Transitions

Use these spring configurations as the foundation for all motion in the project. Never invent new spring values — pull from this file.

### Spring Configs

```typescript
// Snappy — UI feedback, small elements, button presses
{ type: "spring", stiffness: 400, damping: 28 }

// Smooth — standard enters/exits, cards, panels
{ type: "spring", stiffness: 220, damping: 24 }

// Gentle — page-level, background shifts, large containers
{ type: "spring", stiffness: 140, damping: 20 }

// Bouncy — icons, checkmarks, success states ONLY
{ type: "spring", stiffness: 300, damping: 12, overshootClamping: false }
```

### Stagger Pattern

```tsx
const container = {
  hidden: {},
  show: { transition: { staggerChildren: 0.06 } },
};

const item = {
  hidden: { opacity: 0, y: 14 },
  show: {
    opacity: 1,
    y: 0,
    transition: { type: "spring", stiffness: 220, damping: 24 },
  },
};
```

### Rules

- Lists always stagger. 0.05–0.08s between items.
- Enter and exit are mirror images unless there's a narrative reason they're not.
- No linear. No ease-in-out. Springs only.

---

## Skill: Status Indicator Glow

Use this exact pattern for any component that communicates a state: pending, loading, error, success, active, idle.

### Implementation

```tsx
const statusVariants = {
  pending: {
    scale: 1,
    opacity: 0.7,
    boxShadow: "0 0 12px 2px rgba(250,204,21,0.4)",
  },
  error: {
    scale: 1.04,
    opacity: 1,
    boxShadow: "0 0 20px 4px rgba(239,68,68,0.5)",
  },
  success: {
    scale: 1,
    opacity: 1,
    boxShadow: "0 0 16px 3px rgba(34,197,94,0.45)",
  },
  idle: {
    scale: 1,
    opacity: 0.4,
    boxShadow: "none",
  },
};

<motion.div
  animate={status}
  variants={statusVariants}
  transition={{ type: "spring", stiffness: 220, damping: 24 }}
>
  {children}
</motion.div>
```

### Glow color reference

| State    | Color     | Hex       |
|----------|-----------|-----------|
| Pending  | Yellow    | `#facc15` |
| Error    | Red       | `#ef4444` |
| Success  | Green     | `#22c55e` |
| Active   | Teal      | `#00d4aa` |
| Idle     | None      | —         |

### Rules

- Glow is on `boxShadow` only. Never on `background` directly.
- Always pair with `AnimatePresence` if the component conditionally mounts.
- Success state should briefly overshoot on scale before settling — `overshootClamping: false`.

---

## Skill: Consistent Easing Tokens

Single source of truth for all animation timing. Add this file to the project if it doesn't exist.

### File: `tokens/animation.ts`

```typescript
export const motion = {
  // Duration in ms (use these with CSS transitions only — not Framer spring)
  fast:   240,
  medium: 320,
  slow:   420,

  // Springs (use with Framer Motion's `transition` prop)
  spring: {
    snappy: { type: "spring" as const, stiffness: 400, damping: 28 },
    smooth: { type: "spring" as const, stiffness: 220, damping: 24 },
    gentle: { type: "spring" as const, stiffness: 140, damping: 20 },
    bouncy: { type: "spring" as const, stiffness: 300, damping: 12 },
  },

  // Micro-interaction scale bounds
  scale: {
    hover:   1.03,
    tap:     0.97,
    success: 1.08,  // only for icons/checkmarks
    max:     1.04,  // hard cap for UI elements
  },

  // Glow colors for status states
  glow: {
    pending: "rgba(250,204,21,0.4)",
    error:   "rgba(239,68,68,0.5)",
    success: "rgba(34,197,94,0.45)",
    active:  "rgba(0,212,170,0.35)",
  },
} as const;
```

### Usage

```tsx
import { motion as motionTokens } from "@/tokens/animation";

<motion.button
  whileHover={{ scale: motionTokens.scale.hover }}
  whileTap={{ scale: motionTokens.scale.tap }}
  transition={motionTokens.spring.snappy}
>
  Save
</motion.button>
```

### Rule

If a value is not in `tokens/animation.ts`, it does not get used. No one-off magic numbers in component files.
