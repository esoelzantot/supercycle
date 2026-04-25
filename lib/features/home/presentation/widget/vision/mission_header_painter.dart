import 'dart:math' as math;

import 'package:flutter/material.dart';

class MissionHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    // Outer ring
    strokePaint.color = Colors.white.withValues(alpha: 0.5);
    canvas.drawCircle(Offset(cx, cy), size.width * 0.46, strokePaint);

    // Mid ring
    strokePaint.color = Colors.white.withValues(alpha: 0.35);
    canvas.drawCircle(Offset(cx, cy), size.width * 0.30, strokePaint);

    // Clock hands
    strokePaint.color = Colors.white;
    strokePaint.strokeWidth = 2.5;
    // hour hand
    canvas.drawLine(
      Offset(cx, cy),
      Offset(cx, cy - size.height * 0.28),
      strokePaint,
    );
    // minute hand
    canvas.drawLine(
      Offset(cx, cy),
      Offset(cx + size.width * 0.22, cy + size.height * 0.1),
      strokePaint,
    );

    // Center circle
    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.07,
      Paint()..color = Colors.white,
    );

    // Small dots on ring
    final dotPaint = Paint()..color = Colors.white.withValues(alpha: 0.7);
    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi;
      final dx = cx + math.cos(angle) * size.width * 0.46;
      final dy = cy + math.sin(angle) * size.height * 0.46;
      canvas.drawCircle(Offset(dx, dy), 2.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
