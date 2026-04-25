import 'package:flutter/material.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/form_side.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/info_side.dart';

class ContactUsWeb extends StatelessWidget {
  const ContactUsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xff194C3B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // shadow رئيسي عميق
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 40,
              spreadRadius: 0,
              offset: const Offset(0, 16),
            ),
            // shadow ثانوي للعمق
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 16,
              spreadRadius: -4,
              offset: const Offset(0, 6),
            ),
            // highlight علوي خفيف
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.8),
              blurRadius: 0,
              spreadRadius: 0,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              Expanded(flex: 3, child: InfoSide()),
              Expanded(flex: 3, child: FormSide()),
            ],
          ),
        ),
      ),
    );
  }
}
