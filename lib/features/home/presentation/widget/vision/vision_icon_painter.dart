import 'package:flutter/material.dart';

class VisionIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Eye oval
    paint.color = const Color(0xFF185FA5);
    paint.strokeWidth = 1.5;
    final rect = Rect.fromCenter(
      center: Offset(cx, cy),
      width: size.width * 0.82,
      height: size.height * 0.5,
    );
    canvas.drawOval(rect, paint);

    // Iris
    paint.color = const Color(0xFF378ADD);
    canvas.drawCircle(Offset(cx, cy), size.width * 0.2, paint);

    // Pupil
    canvas.drawCircle(
      Offset(cx, cy),
      size.width * 0.08,
      Paint()..color = const Color(0xFF185FA5),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
