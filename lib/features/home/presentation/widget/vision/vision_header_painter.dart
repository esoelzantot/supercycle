import 'dart:math' as math;

import 'package:flutter/material.dart';

class VisionHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    // Outer eye shape
    final path1 = Path();
    path1.moveTo(size.width * 0.05, cy);
    path1.quadraticBezierTo(cx, size.height * 0.15, size.width * 0.95, cy);
    path1.quadraticBezierTo(cx, size.height * 0.85, size.width * 0.05, cy);
    strokePaint.color = Colors.white.withValues(alpha: 0.6);
    canvas.drawPath(path1, strokePaint);

    // Iris ring
    strokePaint.color = Colors.white.withValues(alpha: 0.8);
    strokePaint.strokeWidth = 2;
    canvas.drawCircle(Offset(cx, cy), size.width * 0.22, strokePaint);

    // Pupil fill
    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.12,
      Paint()..color = Colors.white.withValues(alpha: 0.9),
    );

    // Highlight
    canvas.drawCircle(
      Offset(cx - size.width * 0.06, cy - size.height * 0.06),
      size.width * 0.04,
      Paint()..color = Colors.white.withValues(alpha: 0.5),
    );

    // Lashes - top
    strokePaint.color = Colors.white.withValues(alpha: 0.4);
    strokePaint.strokeWidth = 1.5;
    for (int i = 0; i < 5; i++) {
      final t = 0.2 + i * 0.15;
      final bx = size.width * t;
      final by =
          size.height * 0.15 +
          (size.height * 0.08 * math.sin((t - 0.5) * math.pi * 2.5).abs());
      canvas.drawLine(Offset(bx, by), Offset(bx, by - 8), strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
