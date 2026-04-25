import 'package:flutter/material.dart';

class CardData {
  final String arTitle;

  final String enTitle;

  final String arSubtitle;

  final String enSubtitle;

  final String arBody;
  final String enBody;

  final List<Color> gradientColors;
  final Color accentColor;
  final Color lightAccent;
  final CustomPainter iconPainter;
  final CustomPainter headerPainter;

  const CardData({
    required this.arTitle,
    required this.enTitle,
    required this.arSubtitle,
    required this.enSubtitle,
    required this.arBody,
    required this.enBody,
    required this.gradientColors,
    required this.accentColor,
    required this.lightAccent,
    required this.iconPainter,
    required this.headerPainter,
  });
}
