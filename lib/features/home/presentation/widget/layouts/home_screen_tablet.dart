import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/data/entities/nav_item.dart';
import 'package:supercycle_site/features/home/presentation/widget/header/home_screen_web_header.dart';
import 'package:supercycle_site/generated/l10n.dart';

class HomeScreenTablet extends StatefulWidget {
  const HomeScreenTablet({super.key});

  @override
  State<HomeScreenTablet> createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
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
      body: Center(child: Text("SuperCycle Site Tablet")),
    );
  }
}
