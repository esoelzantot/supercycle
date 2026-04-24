import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_assets.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/features/home/presentation/widget/buttons/ghost_button.dart';
import 'package:supercycle_site/features/home/presentation/widget/buttons/primary_button.dart';
import 'package:supercycle_site/generated/l10n.dart';

// ─────────────────────────────────────────────
//  THEME TOKENS
// ─────────────────────────────────────────────
class _AppColors {
  static const background = Color(0xFFF7F5FF);
  static const primary = Color(0xFF7C3AED);
  static const primaryLight = Color(0xFFEDE9FE);
  static const teal = Color(0xFF5EEAD4);
  static const lavender = Color(0xFFC4B5FD);
  static const lavenderLight = Color(0xFFDDD6FE);
  static const textDark = Color(0xFF1A1333);
  static const textMuted = Color(0xFF6B6580);
}

// ─────────────────────────────────────────────
//  PUBLIC WIDGET
// ─────────────────────────────────────────────
class WebHeroSection extends StatefulWidget {
  const WebHeroSection({super.key});

  @override
  State<WebHeroSection> createState() => _WebHeroSectionState();
}

class _WebHeroSectionState extends State<WebHeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.9,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.background),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.lighten,
            ),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // ── Decorative blobs ──────────────────
            const _BlobLayer(),

            // ── Main layout ───────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: FadeTransition(
                opacity: _fade,
                child: SlideTransition(
                  position: _slide,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 3, child: _CopyBlock()),
                      const SizedBox(width: 48),
                      _PhoneScreen(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  BLOB LAYER
// ─────────────────────────────────────────────
class _BlobLayer extends StatelessWidget {
  const _BlobLayer();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Positioned.fill(
      child: Stack(
        children: [
          // soft circle — bottom left
          Positioned(
            bottom: -60,
            left: 10,
            child: Opacity(
              opacity: 0.05,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 50,
                      color: Colors.white,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // soft circle — top right
          Positioned(
            top: -60,
            right: 10,
            child: Opacity(
              opacity: 0.05,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 50,
                      color: Colors.white,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  COPY BLOCK (left side)
// ─────────────────────────────────────────────
class _CopyBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Headline
        Text(
          S.of(context).hero_title,
          style: AppStyles.styleBold24(
            context,
          ).copyWith(fontSize: 48, color: Colors.white),
        ),
        const SizedBox(height: 20),

        // Body
        Text(
          S.of(context).hero_desc,
          style: AppStyles.styleSemiBold28(
            context,
          ).copyWith(color: Colors.white.withValues(alpha: 0.5)),
        ),
        const SizedBox(height: 32),

        // CTAs
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PrimaryButton(label: S.of(context).contact_us_btn, onTap: () {}),
            GhostButton(label: S.of(context).download_btn, onTap: () {}),
          ],
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}

class _PhoneScreen extends StatelessWidget {
  const _PhoneScreen();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.mobile, fit: BoxFit.cover);
  }
}
