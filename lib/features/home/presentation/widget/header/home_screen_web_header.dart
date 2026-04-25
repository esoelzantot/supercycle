import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/brand_logo.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/contact_action_btn.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/lang_action_btn.dart';

class HomeScreenHeader extends StatefulWidget implements PreferredSizeWidget {
  // ── Appearance ────────────────────────────
  final Color backgroundColor;
  final double height;

  const HomeScreenHeader({
    super.key,
    this.backgroundColor = Colors.white,
    this.height = 80,
  });

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ── Action icons ────────────────
                  LangActionBtn(),

                  // ── Brand logo ─────────────────────────
                  BrandLogo(),

                  // // ── Action icons ────────────────
                  // SocialChannelsRow(),
                  ContactActionBtn(),
                ],
              ),
            ),
          ),

          // Bottom divider
          Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        ],
      ),
    );
  }
}
