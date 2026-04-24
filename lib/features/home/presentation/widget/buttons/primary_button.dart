import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_colors.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovering = true),
    onExit: (_) => setState(() => _hovering = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _hovering
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: _hovering ? 10 : 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          widget.label,
          style: AppStyles.styleSemiBold18(
            context,
          ).copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
