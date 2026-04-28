import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/data/entities/card_data.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/mission_header_painter.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/mission_icon_painter.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_header_painter.dart';
import 'package:supercycle_site/features/home/presentation/widget/vision/vision_icon_painter.dart';

final List<CardData> cards = [
  CardData(
    enTitle: 'Our Vision',
    arTitle: 'رؤيتنا',
    enSubtitle: 'Smart Connectivity',
    arSubtitle: 'ربط ذكي وكفاءة',
    arBody:
        'أن نكون المحرك الرقمي الأول لتجارة الكرتون والورق في المنطقة، من خلال قيادة التحول الذكي في هذا القطاع لتعظيم قيمة الموارد المهدورة وبناء مستقبل اقتصادي وبيئي مستدام',
    enBody:
        'To be the leading digital driver for the cardboard and paper trade in the region, by spearheading smart transformation in the sector to maximize resource value and build a sustainable economic and environmental future.',
    gradientColors: const [
      Color(0xFF185FA5),
      Color(0xFF378ADD),
      Color(0xFF85B7EB),
    ],
    accentColor: const Color(0xFF185FA5),
    lightAccent: const Color(0xFFE6F1FB),
    iconPainter: VisionIconPainter(),
    headerPainter: VisionHeaderPainter(),
  ),
  CardData(
    enTitle: 'Our Mission',
    arTitle: 'رسالتنا',
    enSubtitle: 'Digital Leadership',
    arSubtitle: 'ريادة رقمية',
    arBody:
        "تمكين موردي وتجار الكرتون والورق عبر تطبيق مبتكر يوفر حلولاً تقنية متكاملة تضمن الشفافية، العدالة، وسرعة التنفيذ؛ لرفع كفاءة التوريد وتحقيق أقصى عوائد ربحية لمستخدمينا.",
    enBody:
        "To empower cardboard and paper suppliers and traders through an innovative app that provides integrated technical solutions ensuring transparency, fairness, and swift execution; enhancing supply efficiency and maximizing users' profit",
    gradientColors: const [
      Color(0xFF0F6E56),
      Color(0xFF1D9E75),
      Color(0xFF5DCAA5),
    ],
    accentColor: const Color(0xFF0F6E56),
    lightAccent: const Color(0xFFE1F5EE),
    iconPainter: MissionIconPainter(),
    headerPainter: MissionHeaderPainter(),
  ),
];
