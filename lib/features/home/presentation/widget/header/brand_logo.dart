import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_assets.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(AppAssets.logoIcon, fit: BoxFit.cover),
          // SizedBox(width: 2),
          Image.asset(AppAssets.logoName, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
