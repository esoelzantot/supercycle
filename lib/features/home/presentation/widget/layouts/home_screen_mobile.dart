import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/contact_us_mobile.dart';
import 'package:supercycle_site/features/home/presentation/widget/footer/home_footer_mobile.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/custom_drawer.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/home_screen_mobile_header.dart';
import 'package:supercycle_site/features/home/presentation/widget/hero/mobile_hero_section.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_and_mission_mobile.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  bool _isDrawerOpen = false;

  void _openDrawer() => setState(() => _isDrawerOpen = true);
  void _closeDrawer() => setState(() => _isDrawerOpen = false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Main Content ──────────────────────────────────────
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MobileHeroSection(paddingTop: 90)),
            SliverToBoxAdapter(child: SizedBox(height: 56)),
            SliverToBoxAdapter(child: VisionAndMissionMobile()),
            SliverToBoxAdapter(child: SizedBox(height: 56)),
            SliverToBoxAdapter(child: ContactUsMobile()),
            SliverToBoxAdapter(child: SizedBox(height: 56)),
            SliverToBoxAdapter(child: HomeFooterMobile()),
          ],
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HomeScreenMobileHeader(onMenuTap: _openDrawer),
        ),

        // ── Scrim (backdrop) ─────────────────────────────────
        if (_isDrawerOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDrawer,
              child: AnimatedOpacity(
                opacity: _isDrawerOpen ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(color: Colors.black.withAlpha(140)),
              ),
            ),
          ),

        // ── Drawer Panel ──────────────────────────────────────
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: 0,
          bottom: 0,
          left: _isDrawerOpen ? 0 : -300,
          width: 290,
          child: CustomDrawer(onClose: _closeDrawer),
        ),
      ],
    );
  }
}
