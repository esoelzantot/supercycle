import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/contact_us_mobile.dart';
import 'package:supercycle_site/features/home/presentation/widget/footer/home_footer_mobile.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/home_screen_mobile_header.dart';
import 'package:supercycle_site/features/home/presentation/widget/hero/mobile_hero_section.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_and_mission_mobile.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final _scrollController = ScrollController();
  final _contactKey = GlobalKey();

  void _scrollToContact() {
    final ctx = _contactKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Main Content ──────────────────────────────────────
        CustomScrollView(
          slivers: [SliverToBoxAdapter(child: MobileHeroSection(paddingTop: 90, onContactTap: _scrollToContact)),

            SliverToBoxAdapter(child: SizedBox(height: 56)),
            SliverToBoxAdapter(child: VisionAndMissionMobile()),
            SliverToBoxAdapter(child: SizedBox(height: 56)),
            SliverToBoxAdapter(child: ContactUsMobile(key: _contactKey,)),
            SliverToBoxAdapter(child: SizedBox(height: 56)),
            SliverToBoxAdapter(child: HomeFooterMobile()),
          ],
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(top: 0, left: 0, right: 0, child: HomeScreenMobileHeader()),
      ],
    );
  }
}
