import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_assets.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/generated/l10n.dart';

class AppWaitingDialog extends StatelessWidget {
  const AppWaitingDialog({super.key});

  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'dismiss',
      barrierColor: Colors.black.withValues(alpha: 0.72),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim, _, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
      pageBuilder: (context, _, __) => const AppWaitingDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 360,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF2A2A2A), width: 0.5),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                color: Color(0xff194C3B),
                padding: const EdgeInsets.fromLTRB(32, 36, 32, 28),
                child: Column(
                  children: [
                    _AnimatedIconRing(),
                    const SizedBox(height: 20),
                    _ComingSoonBadge(),
                    const SizedBox(height: 14),
                    Text(
                      S.of(context).app_waiting_dialog_title,
                      textAlign: TextAlign.center,
                      style: AppStyles.styleBold24(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Body
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 24, 32, 28),
                child: Column(
                  children: [
                    Text(
                      S.of(context).app_waiting_dialog_body,
                      textAlign: TextAlign.center,
                      style: AppStyles.styleMedium20(
                        context,
                      ).copyWith(color: Color(0xFF888888)),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Animated Ring ───────────────────────────────────────────
class _AnimatedIconRing extends StatefulWidget {
  @override
  State<_AnimatedIconRing> createState() => _AnimatedIconRingState();
}

class _AnimatedIconRingState extends State<_AnimatedIconRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Rotating dashed ring
          RotationTransition(
            turns: _ctrl,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF333333),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),
          // Inner icon
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF333333), width: 0.5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(AppAssets.logoIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Badge ───────────────────────────────────────────────────
class _ComingSoonBadge extends StatefulWidget {
  @override
  State<_ComingSoonBadge> createState() => _ComingSoonBadgeState();
}

class _ComingSoonBadgeState extends State<_ComingSoonBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _anim = Tween<double>(
      begin: 1,
      end: 0.3,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: const Color(0xFF333333), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _anim,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF00D4AA),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            S.of(context).app_waiting_dialog_badge,
            style: AppStyles.styleSemiBold14(
              context,
            ).copyWith(color: Color(0xFF00D4AA)),
          ),
        ],
      ),
    );
  }
}
