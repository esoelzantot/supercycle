import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/contact_us_web.dart';
import 'package:supercycle_site/features/home/presentation/widget/footer/home_footer_web.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/home_screen_web_header.dart';
import 'package:supercycle_site/features/home/presentation/widget/hero/web_hero_section.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_and_mission_web.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenHeader(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: WebHeroSection()),
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
