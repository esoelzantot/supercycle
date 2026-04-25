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
        'أن نكون المنصة الرقمية الرائدة التي تقود التحول الذكي في قطاع إعادة التدوير، معززين قيمة الموارد المهدرة لنبني معاً مستقبلاً بيئياً واقتصادياً مستداماً.',
    enBody:
        'To be the leading digital catalyst driving the smart transformation of the recycling industry, maximizing the value of scrap materials to build a sustainable green economy for future generations.',
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
        "تمكين مجتمع تجارة 'الدشت' من خلال حلول تقنية مبتكرة تربط الموردين والتجار والمناديب في بيئة عمل شفافة وعادلة، لضمان سرعة التنفيذ، زيادة الأرباح، ودعم الاقتصاد الأخضر بأعلى معايير الكفاءة.",
    enBody:
        'To empower the recycling trade community through innovative tech solutions that seamlessly connect suppliers, traders, and delegates. We are committed to ensuring transparency, maximizing profitability, and streamlining operations for a cleaner environment and a more efficient market.',
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
