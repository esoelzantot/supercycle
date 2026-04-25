import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/data/entities/nav_item.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/contact_us_web.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/home_screen_web_header.dart';
import 'package:supercycle_site/features/home/presentation/widget/hero/web_hero_section.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_and_mission_web.dart';
import 'package:supercycle_site/generated/l10n.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  int _activeIndex = 0;

  List<NavItem> get _navItems => [
    NavItem(label: S.of(context).vision_tab),
    NavItem(label: S.of(context).mission_tab),
    NavItem(label: S.of(context).story_tab),
    NavItem(label: S.of(context).contact_tab),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenHeader(
        navItems: _navItems,
        activeIndex: _activeIndex,
        onNavItemTapped: (i) => setState(() => _activeIndex = i),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: WebHeroSection()),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverToBoxAdapter(child: VisionAndMissionWeb()),
          SliverToBoxAdapter(child: SizedBox(height: 64)),
          SliverToBoxAdapter(child: ContactUsWeb()),
          SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
