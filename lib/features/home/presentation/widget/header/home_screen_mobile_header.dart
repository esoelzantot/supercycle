import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_colors.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/brand_logo.dart';

class HomeScreenMobileHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;

  const HomeScreenMobileHeader({super.key, this.onMenuTap});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffc2c2c2).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ── Logo Icon ──
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 8.0,
              ),
              child: BrandLogo(),
            ),

            /// ── Drawer Icon Button ──
            GestureDetector(
              onTap: onMenuTap,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
