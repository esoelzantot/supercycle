import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:supercycle_site/core/helpers/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendMail({
  required String email,
  required String subject,
  required String body,
  required BuildContext context,
}) async {
  if (email.isEmpty) throw Exception('Email cannot be empty');

  if (kIsWeb) {
    CustomSnackBar.showInfo(context, "WEB");

    // على الويب → افتح Gmail Web مباشرة في تاب جديد
    final Uri gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm'
      '&to=${Uri.encodeComponent(email)}'
      '&su=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );

    if (await canLaunchUrl(gmailWebUri)) {
      await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not open Gmail Web');
    }
  } else {
    // على الموبايل → جرب Gmail App الأول، لو مش موجود افتح Gmail Web
    CustomSnackBar.showInfo(context, "MOBILE");
    final Uri gmailAppUri = Uri.parse(
      'googlegmail://co?to=${Uri.encodeComponent(email)}'
      '&subject=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );

    final Uri gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm'
      '&to=${Uri.encodeComponent(email)}'
      '&su=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );

    if (await canLaunchUrl(gmailAppUri)) {
      await launchUrl(gmailAppUri, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
    }
  }
}
