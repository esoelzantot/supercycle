import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/contact_us_web.dart';
import 'package:supercycle_site/features/home/presentation/widget/footer/home_footer_web.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/home_screen_web_header.dart';
import 'package:supercycle_site/features/home/presentation/widget/hero/mobile_hero_section.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_and_mission_web.dart';

class HomeScreenTablet extends StatefulWidget {
  const HomeScreenTablet({super.key});

  @override
  State<HomeScreenTablet> createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
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
    return Scaffold(
      appBar: HomeScreenHeader(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MobileHeroSection(onContactTap: _scrollToContact)),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
          SliverToBoxAdapter(child: VisionAndMissionWeb()),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
          SliverToBoxAdapter(child: ContactUsWeb(key: _contactKey)),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
          SliverToBoxAdapter(child: HomeFooterWeb()),
        ],
      ),
    );
  }
}
