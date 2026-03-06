---
description: Automatically apply UI styling and standardize architecture to a new screen or component.
---

# UI Standardization Workflow
When creating a new screen or refactoring an existing generic one, follow these systematic steps:

1. **Imports Standardization**
   - Import `sirega_app/core/theme/app_colors.dart`.
   - Remove wildcard or hardcoded `Colors.red`, `Colors.grey`, etc.

2. **Refactor Colors & Opacity**
   - Sweep the file for any `.withOpacity(...)` or `.withAlpha(...)`.
   - Replace with `.withValues(alpha: ...)`.
   - Map semantic colors: `AppColors.error` for negatives, `AppColors.success` for positives, `AppColors.surface` for cards, etc.

3. **Check for Legacy Components**
   - Replace standard `TextFormField` with `SiregaTextField` where applicable.
   - Map explicit fonts to `Theme.of(context).textTheme...`

4. **Add Animations (If applicable)**
   - Check if the screen loads data. If it does, ensure there is a Skeleton Loader wrapped in `SiregaShimmer` instead of a spinning ring.
   - If the screen is a detail screen coming from a list, ensure `Hero` tags are properly aligned with the incoming list arguments.

5. **Linting Check**
   - Always run `flutter analyze` after completing the refactor to ensure no deprecated M3 parameters (`surfaceVariant`, `background`) remain.
   
6. **Self-Review against Skills**
   - Re-read `.agent/skills/sirega_ui_ux_system/SKILL.md` to guarantee alignment.
