import 'package:flutter/material.dart';
import 'package:supercycle_site/core/theme/app_styles.dart';
import 'package:supercycle_site/features/home/data/content/social_channels_data.dart';
import 'package:supercycle_site/features/home/presentation/widget/contact/social_channels_row.dart';
import 'package:supercycle_site/generated/l10n.dart';

class InfoSide extends StatelessWidget {
  const InfoSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff194C3B).withValues(alpha: 0.9), Color(0xff194C3B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).contact_us_title,
            style: AppStyles.styleBold28(
              context,
            ).copyWith(color: Colors.white, fontSize: 36),
          ),
          const SizedBox(height: 12),
          Text(
            S.of(context).contact_us_desc,
            textAlign: TextAlign.right,
            style: AppStyles.styleMedium20(
              context,
            ).copyWith(color: Color(0xBFFFFFFF)),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.white.withValues(alpha: 0.15), thickness: 1),
          const SizedBox(height: 20),
          _buildContactItem(
            Icons.phone_rounded,
            S.of(context).contact_us_phone,
            Channels.whatsapp,
            context,
          ),
          const SizedBox(height: 10),
          _buildContactItem(
            Icons.email_rounded,
            S.of(context).contact_us_email,
            Channels.email,
            context,
          ),
          const SizedBox(height: 20),
          SocialChannelsRow(),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFFa8f0c8), size: 20),
            ),
            const SizedBox(width: 12),

            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppStyles.styleSemiBold18(
                      context,
                    ).copyWith(color: Color(0x80FFFFFF)),
                  ),
                  const SizedBox(height: 4),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value,
                        style: AppStyles.styleSemiBold24(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
