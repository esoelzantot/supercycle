import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/data/content/vision_mission_data.dart';
import 'package:supercycle_site/features/home/data/entities/card_data.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/card_content.dart';

// ─────────────────────────────────────────────
//  MAIN WIDGET
// ─────────────────────────────────────────────
class VisionAndMissionWeb extends StatelessWidget {
  const VisionAndMissionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cards
            .asMap()
            .entries
            .map(
              (e) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: e.key == 1 ? 10 : 20,
                    right: e.key == 0 ? 10 : 20,
                  ),
                  child: _AnimatedCard(
                    data: e.value,
                    delay: Duration(milliseconds: e.key * 150),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  DATA MODEL
// ─────────────────────────────────────────────

// ─────────────────────────────────────────────
//  ANIMATED CARD WRAPPER
// ─────────────────────────────────────────────
class _AnimatedCard extends StatefulWidget {
  final CardData data;
  final Duration delay;

  const _AnimatedCard({required this.data, required this.delay});

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<_AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
            child: CardContent(data: widget.data),
          ),
        ),
      ),
    );
  }
}
