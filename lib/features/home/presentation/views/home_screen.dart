import 'package:flutter/material.dart';
import 'package:supercycle_site/core/layouts/adaptive_layout.dart';
import 'package:supercycle_site/features/home/presentation/widget/layouts/home_screen_mobile.dart';
import 'package:supercycle_site/features/home/presentation/widget/layouts/home_screen_tablet.dart';
import 'package:supercycle_site/features/home/presentation/widget/layouts/home_screen_web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => HomeScreenMobile(),
      tabletLayout: (context) => HomeScreenTablet(),
      desktopLayout: (context) => HomeScreenWeb(),
    );
  }
}
