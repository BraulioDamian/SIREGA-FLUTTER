---
name: Sirega Micro-Interactions & Animations
description: Standardized animation system for the Sirega App. Philosophy - Natural & Funcional, designed for ranchers working in the field.
---

# Sirega Animation System — "Natural & Funcional"

## Design Philosophy
Sirega is used by **ganaderos** — people working outdoors, often with dirty hands, gloves, under the sun, in a hurry. Every animation must have a **clear purpose**: confirm a touch, guide attention, or smooth a context change. Nothing flashy, nothing slow, nothing that blocks workflow.

> **Golden Rule**: If an animation doesn't help the user understand what happened or what's coming next, remove it.

## Animation Tokens (Constants)
Use these exact values everywhere. Do NOT invent new durations or curves.

| Token | Value | Use Case |
|---|---|---|
| `durationFast` | `100ms` | Touch feedback (scale, opacity) |
| `durationNormal` | `250ms` | Content entry, state changes |
| `durationNavigation` | `300ms` | Page transitions |
| `durationConfirmation` | `400ms` | Success/error feedback icons |
| `curveDefault` | `Curves.easeOutCubic` | General movement — smooth deceleration |
| `curveTouch` | `Curves.easeOut` | Touch response — fast start, gentle stop |
| `scalePressed` | `0.97` | Touch scale-down (subtle, not dramatic) |

---

## 1. Touch Response (Respuesta Táctil) — 100ms
When the user taps a card, button, or interactive element, they must **instantly feel** the app responded.

### Implementation
- Convert to `StatefulWidget` with a `_isPressed` boolean.
- Use `GestureDetector` with `onTapDown`, `onTapUp`, `onTapCancel`.
- Wrap in `AnimatedScale(scale: _isPressed ? 0.97 : 1.0, duration: 100ms, curve: Curves.easeOut)`.
- Change the border opacity with `AnimatedContainer(duration: 200ms)`:
  - **Default**: `border: Border.all(color: accentColor.withOpacity(0.2), width: 1.5)`
  - **Pressed**: `border: Border.all(color: accentColor.withOpacity(0.6), width: 2.0)`
- Keep the shadow **static** — do NOT animate shadows (expensive on older devices).

### What NOT to do
- ❌ Scale below `0.95` (feels like a toy, not a tool)
- ❌ Animate shadow blur/spread (causes jank on budget phones)
- ❌ Use `Curves.elasticOut` or `Curves.bounceOut` (too playful for a work tool)
- ❌ Add color tint to the background on press (distracting)

---

## 2. Content Entry (Entrada de Contenido) — 250ms
When a screen loads, its content should fade in gently from below — not pop in suddenly.

### Staggered List/Grid Entry
For lists or grids of items (e.g., Event Type selection cards):
```dart
TweenAnimationBuilder<double>(
  duration: Duration(milliseconds: 300 + (index * 80)),
  curve: Curves.easeOutCubic,
  tween: Tween(begin: 0.0, end: 1.0),
  builder: (context, value, child) {
    return Transform.translate(
      offset: Offset(0, 30 * (1 - value)),
      child: Opacity(opacity: value, child: child),
    );
  },
  child: MyCardWidget(),
)
```

### Key parameters
- **Offset distance**: `30px` max (subtle, not dramatic)
- **Stagger delay**: `80ms` per item (fast cascade, not slow waterfall)
- **Base duration**: `300ms`

### What NOT to do
- ❌ Slide distance > 50px (feels sluggish and "atascado")
- ❌ Stagger delay > 150ms per item (too slow for practical users)
- ❌ Animate the header/title text — only animate the interactive elements

---

## 3. Page Transitions (Transiciones entre Pantallas) — 300ms
When navigating from one screen to another, use a clean, fast combination.

### Implementation
```dart
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) => DestinationScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.03, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        ),
      );
    },
  ),
);
```

### Key parameters
- **Slide offset**: `Offset(0.03, 0)` — barely visible horizontal slide, mostly fade
- **Reverse** is 50ms faster than forward (feels responsive when going back)

### What NOT to do
- ❌ Use Hero transitions between screens (they warp elements in an ugly way)
- ❌ Vertical slide transitions (feels like a mobile game, not a work tool)
- ❌ Duration > 400ms (feels like the app is slow)
- ❌ Default `MaterialPageRoute` (fine for now, but upgrade when polishing)

---

## 4. Success/Error Feedback — 400ms
After completing an important action (e.g., registering an event), give clear visual confirmation.

### Implementation
- Use a `ScaleTransition` with `Curves.easeOutBack` for the success icon
- Scale from `0.0` to `1.0` over `400ms`
- Pair with `HapticFeedback.mediumImpact()` on success
- Pair with `HapticFeedback.heavyImpact()` on error

### What NOT to do
- ❌ Confetti, particles, or over-the-top celebrations
- ❌ Auto-dismiss success screens (let the user decide when to leave)

---

## 5. Loading States (Shimmer Skeletons)
When waiting for data, show structural placeholders with a shimmer effect.

- Use `SiregaShimmer` from `lib/core/widgets/sirega_shimmer.dart`
- Match the skeleton layout to the real content structure
- Transition from skeleton to real content with `AnimatedSwitcher(duration: 250ms)`

### What NOT to do
- ❌ Use `CircularProgressIndicator` when you know the content shape
- ❌ Use spinners for inline loads (only for overlay/blocking loads)

---

## 6. Scroll Behavior
- Use `BouncingScrollPhysics()` on iOS for natural feel
- Allow overscroll — do NOT use `ClampingScrollPhysics`
- No parallax effects — they add complexity without improving usability for this audience

---

## Summary: Quick Reference

| Interaction | Duration | Curve | Effect |
|---|---|---|---|
| Touch press | 100ms | `easeOut` | Scale to 0.97, border brightens |
| Touch release | 100ms | `easeOut` | Scale back to 1.0 |
| Card entry (grid) | 300ms + (i × 80ms) | `easeOutCubic` | Fade + slide up 30px |
| Page transition | 300ms | `easeOutCubic` | Fade + tiny slide right |
| Page back | 250ms | `easeOutCubic` | Reverse of above |
| Success icon | 400ms | `easeOutBack` | Scale from 0 to 1 |
| Skeleton → Content | 250ms | `easeOut` | Crossfade |

**Remember**: These users are busy ranchers. The app should feel alive and responsive, but never theatrical. Think of it like a well-oiled gate — it opens smoothly and closes firmly, without creaking or bouncing.
