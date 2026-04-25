import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/brand_logo.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/contact_action_btn.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/lang_action_btn.dart';

class HomeScreenMobileHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeScreenMobileHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF).withValues(alpha: 0.3),
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

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LangActionBtn(showLabel: false, iconSize: 22),
                ContactActionBtn(showLabel: false, iconSize: 22),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
