import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/data/entities/nav_item.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/brand_logo.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/lang_action_btn.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/nav_item_widget.dart';
// ─────────────────────────────────────────────
//  HomeScreenHeader
// ─────────────────────────────────────────────

class HomeScreenHeader extends StatefulWidget implements PreferredSizeWidget {
  /// Navigation items (right-aligned, before the brand).
  final List<NavItem> navItems;

  /// Index of the currently active nav item.
  final int activeIndex;

  /// Called when a nav item is tapped.
  final ValueChanged<int>? onNavItemTapped;

  // ── Appearance ────────────────────────────
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final double height;

  const HomeScreenHeader({
    super.key,
    this.navItems = const [],
    this.activeIndex = 0,
    this.onNavItemTapped,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xFF2E9E7E), // teal-green from design
    this.inactiveColor = const Color(0xFF3D4A5C), // dark slate
    this.height = 72,
  });

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  int? _hoveredIndex;

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
                children: [
                  // ── Brand logo ─────────────────────────
                  BrandLogo(),

                  const SizedBox(width: 32),

                  // ── Right: nav items + brand ───────────
                  ...List.generate(widget.navItems.length, (i) {
                    final item = widget.navItems[i];
                    final isActive = i == widget.activeIndex;
                    final isHovered = i == _hoveredIndex;

                    return Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: NavItemWidget(
                        label: item.label,
                        isActive: isActive,
                        isHovered: isHovered,
                        activeColor: widget.activeColor,
                        inactiveColor: widget.inactiveColor,
                        onTap: () {
                          widget.onNavItemTapped?.call(i);
                          item.onTap?.call();
                        },
                        onHover: (hovering) {
                          setState(() {
                            _hoveredIndex = hovering ? i : null;
                          });
                        },
                      ),
                    );
                  }),

                  Spacer(),

                  // ── Action icons ────────────────
                  LangActionBtn(),
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
