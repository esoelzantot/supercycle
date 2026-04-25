import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercycle_site/core/cubits/local_cubit.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/features/home/data/entities/card_data.dart';

import 'card_header.dart';

class CardContent extends StatelessWidget {
  final CardData data;
  const CardContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // ✅ قراءة الـ locale من LocalCubit
    final state = context.watch<LocalCubit>().state;
    final bool isArabic = state is ChangeLocalState
        ? state.locale.languageCode == 'ar'
        : false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: data.accentColor.withValues(alpha: 0.2),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Illustrated header ──
            CardHeader(data: data),

            // ── Accent bar ──
            Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: data.gradientColors),
              ),
            ),

            // ── Body ──
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: data.lightAccent,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: CustomPaint(painter: data.iconPainter),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        isArabic ? data.arTitle : data.enTitle,
                        style: AppStyles.styleBold24(context).copyWith(
                          fontSize: 30,
                          color: const Color(0xFF1A1A2E),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Divider
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.black.withValues(alpha: 0.1),
                  ),

                  const SizedBox(height: 14),

                  // Body text
                  Text(
                    isArabic ? data.arBody : data.enBody,
                    style: AppStyles.styleMedium20(context).copyWith(
                      color: Colors.black.withValues(alpha: 0.5),
                      decoration: TextDecoration.none,
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
