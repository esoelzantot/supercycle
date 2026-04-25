import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercycle_site/core/cubits/local_cubit.dart';
import 'package:supercycle_site/features/home/data/entities/card_data.dart';

class CardHeader extends StatelessWidget {
  final CardData data;
  const CardHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // ✅ قراءة الـ locale من LocalCubit
    final state = context.watch<LocalCubit>().state;
    final bool isArabic = state is ChangeLocalState
        ? state.locale.languageCode == 'ar'
        : false;
    return SizedBox(
      height: 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: data.gradientColors,
              ),
            ),
          ),
          // Decorative circles
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            left: -20,
            bottom: -40,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: -20,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          // Central illustrated icon
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CustomPaint(painter: data.headerPainter),
            ),
          ),
          // Subtitle tag bottom-left
          Positioned(
            left: 16,
            bottom: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 0.5,
                ),
              ),
              child: Text(
                isArabic ? data.arSubtitle : data.enSubtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
