import 'package:flutter/material.dart';

class MissionIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Outer circle
    paint.color = const Color(0xFF0F6E56);
    paint.strokeWidth = 1.5;
    canvas.drawCircle(Offset(cx, cy), size.width * 0.38, paint);

    // Mid circle
    paint.color = const Color(0xFF1D9E75);
    canvas.drawCircle(Offset(cx, cy), size.width * 0.22, paint);

    // Center dot
    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.07,
      Paint()..color = const Color(0xFF0F6E56),
    );

    // Cross lines
    paint.color = const Color(0xFF0F6E56);
    paint.strokeWidth = 1.5;
    canvas.drawLine(
      Offset(cx, cy - size.height * 0.45),
      Offset(cx, cy - size.height * 0.28),
      paint,
    );
    canvas.drawLine(
      Offset(cx, cy + size.height * 0.28),
      Offset(cx, cy + size.height * 0.45),
      paint,
    );
    canvas.drawLine(
      Offset(cx - size.width * 0.45, cy),
      Offset(cx - size.width * 0.28, cy),
      paint,
    );
    canvas.drawLine(
      Offset(cx + size.width * 0.28, cy),
      Offset(cx + size.width * 0.45, cy),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
