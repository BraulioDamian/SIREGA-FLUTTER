---
name: Sirega UI/UX Design System
description: Core principles, color palettes, and component rules for the Sirega App Frontend.
---

# Sirega UI/UX Design System Skill
You are an expert Flutter Developer. When building or refactoring UI code in the Sirega App, you MUST strictly adhere to these design principles to guarantee a "Premium Agri-Tech" frontend.

## 1. Unified Color Palette (`AppColors`)
**NEVER use hardcoded native colors (like `Colors.red`, `Colors.grey[300]`). ALWAYS use `AppColors`.**
- **Primary & Backgrounds**:
  - `AppColors.background`: Base application background.
  - `AppColors.surface`: Card and dialog backgrounds.
  - `Theme.of(context).primaryColor`: For main branding elements and buttons.
- **Semantic Colors**:
  - `AppColors.success`: Positive actions, "Healthy" status, successful checkmarks.
  - `AppColors.error`: Deletions, "Critical" health, destructive actions.
  - `AppColors.warning`: "Sick" status, warnings, yellow flags.
  - `AppColors.info`: Standard statuses, non-critical alerts.
- **Text & UI Details**:
  - `AppColors.textPrimary`: Main titles and high-contrast text.
  - `AppColors.textSecondary`: Subtitles and body text.
  - `AppColors.textHint`: Search bars, placeholders.
  - `AppColors.divider`: Subtle line separations.

## 2. Opacity and Transparencies
- **DEPRECATED**: `color.withOpacity(0.5)` or `color.withAlpha(50)`.
- **STANDARD**: Use `color.withValues(alpha: 0.5)` for all opacity and alpha channeling.

## 3. Shapes and Elevations
- **Borders**: Standard corner radius for Cards, Dialogs, and TextFields is `12.0` or `16.0`. Avoid sharp corners or overly pill-shaped containers unless it's a chip.
- **Shadows**: Keep shadows extremely soft. Use `color.withValues(alpha: 0.1)` or `0.05` for shadow colors, with a high `blurRadius` (e.g., `8` to `12`) and subtle `offset` (e.g., `Offset(0, 4)`). Avoid harsh native material defaults.

## 4. Core UI Components
When creating new views, re-use existing generic components first:
- **Inputs**: Use `SiregaTextField` and `NativeDropdown` for all form entry fields instead of raw `TextFormField` to maintain visual consistency.
- **Containers**: Use `SiregaCard` for standard content boxing or `AnimalCard` for list rendering.
- **Loaders**: Do NOT use `CircularProgressIndicator` for full-page data loading. Use a skeleton loader implementation (like `AnimalCardSkeleton`) and wrap it in `SiregaShimmer`.

## 5. View Structure Conventions
- Favor `Scaffold` > `CustomScrollView` / `NestedScrollView` with `SliverAppBar` for high-impact screens (like Details) to enable premium scrolling header effects.
- Extract complex UI components into small modular files under `presentation/widgets/` instead of polluting screens with 1000 lines of code.

By ensuring every new screen utilizes these instructions, the application will retain a consistent, gorgeous, and modern flow.
