import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';

class NavItemWidget extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isHovered;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onHover;

  const NavItemWidget({
    super.key,
    required this.label,
    required this.isActive,
    required this.isHovered,
    required this.activeColor,
    required this.inactiveColor,
    this.onTap,
    this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = isActive
        ? activeColor
        : (isHovered ? activeColor.withValues(alpha: 0.75) : inactiveColor);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHover?.call(true),
      onExit: (_) => onHover?.call(false),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppStyles.styleSemiBold20(
                context,
              ).copyWith(color: effectiveColor),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: 2,
              width: isActive ? double.infinity : 0,
              constraints: const BoxConstraints(minWidth: 0, maxWidth: 60),
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
