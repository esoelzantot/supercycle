import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_colors.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';

class GhostButton extends StatefulWidget {
  const GhostButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: _hovering ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.label,
          style: AppStyles.styleSemiBold18(
            context,
          ).copyWith(color: AppColors.primary),
        ),
      ),
    ),
  );
}
