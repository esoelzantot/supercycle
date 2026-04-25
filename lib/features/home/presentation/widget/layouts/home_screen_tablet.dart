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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenHeader(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MobileHeroSection()),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
          SliverToBoxAdapter(child: VisionAndMissionWeb()),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
          SliverToBoxAdapter(child: ContactUsWeb()),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
          SliverToBoxAdapter(child: HomeFooterWeb()),
        ],
      ),
    );
  }
}
