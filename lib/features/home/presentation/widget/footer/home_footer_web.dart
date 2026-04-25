import 'package:flutter/material.dart';
import 'package:supercycle_site/core/helpers/app_waiting_dialog.dart';
import 'package:supercycle_site/core/theme/app_assets.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/generated/l10n.dart';

class HomeFooterWeb extends StatelessWidget {
  const HomeFooterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xff194C3B),
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 32),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section - Logo + Brief
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo
                    _buildLogo(),
                    const SizedBox(height: 16),
                    // Brief
                    Text(
                      S.of(context).footer_brief,
                      style: AppStyles.styleSemiBold20(
                        context,
                      ).copyWith(color: Color(0xFFCCCCCC)),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 80),

              // Right Section - Get the App
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).footer_download_app,
                    style: AppStyles.styleSemiBold20(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  _AppStoreButton(
                    icon: Icons.apple,
                    topText: 'GET IT ON',
                    bottomText: 'App Store',
                    onTap: () => AppWaitingDialog.show(context),
                  ),
                  const SizedBox(height: 10),
                  _AppStoreButton(
                    icon: Icons.play_arrow_rounded,
                    topText: 'GET IT ON',
                    bottomText: 'Google Play',
                    onTap: () => AppWaitingDialog.show(context),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Copyright
          Text(
            S.of(context).footer_Copyright,
            style: AppStyles.styleMedium18(
              context,
            ).copyWith(color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: 75,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.asset(AppAssets.logoIcon),
          SizedBox(width: 2),
          Image.asset(AppAssets.logoName, color: Colors.white),
        ],
      ),
    );
  }
}

class _AppStoreButton extends StatefulWidget {
  final IconData icon;
  final String topText;
  final String bottomText;
  final VoidCallback onTap;

  const _AppStoreButton({
    required this.icon,
    required this.topText,
    required this.bottomText,
    required this.onTap,
  });

  @override
  State<_AppStoreButton> createState() => _AppStoreButtonState();
}

class _AppStoreButtonState extends State<_AppStoreButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 180,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFF1A1A1A).withValues(alpha: 0.75)
                : Colors.transparent,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.white, size: 24),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.topText,
                    style: AppStyles.styleMedium12(
                      context,
                    ).copyWith(color: Color(0xFFAAAAAA)),
                  ),
                  Text(
                    widget.bottomText,
                    style: AppStyles.styleBold18(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
