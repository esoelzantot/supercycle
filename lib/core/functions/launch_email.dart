import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendMail({
  required String email,
  required String subject,
  required String body,
  required BuildContext context,
}) async {
  final String encodedEmail = Uri.encodeComponent(email);
  final String encodedSubject = Uri.encodeComponent(subject);
  final String encodedBody = Uri.encodeComponent(body);

  if (kIsWeb) {
    // ✅ لو بيفتح على موبايل browser - يجرب يفتح Gmail App الأول
    final Uri gmailAppUri = Uri.parse(
      'googlegmail://co?to=$encodedEmail&subject=$encodedSubject&body=$encodedBody',
    );

    // Fallback - Gmail Web compose مباشرةً مش inbox
    final Uri gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1&to=$encodedEmail&su=$encodedSubject&body=$encodedBody',
    );

    if (await canLaunchUrl(gmailAppUri)) {
      await launchUrl(gmailAppUri);
    } else {
      await launchUrl(gmailWebUri, webOnlyWindowName: '_blank');
    }
    return;
  }

  if (Platform.isAndroid) {
    // ✅ Android - يجرب Gmail App الأول
    final Uri gmailAppUri = Uri.parse(
      'googlegmail://co?to=$encodedEmail&subject=$encodedSubject&body=$encodedBody',
    );

    final Uri mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject, 'body': body},
    );

    if (await canLaunchUrl(gmailAppUri)) {
      await launchUrl(gmailAppUri, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(mailtoUri)) {
      await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('No email client found');
    }
    return;
  }

  if (Platform.isIOS) {
    // ✅ iOS - يجرب Gmail App الأول
    final Uri gmailAppUri = Uri.parse(
      'googlegmail://co?to=$encodedEmail&subject=$encodedSubject&body=$encodedBody',
    );

    final Uri mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject, 'body': body},
    );

    if (await canLaunchUrl(gmailAppUri)) {
      await launchUrl(gmailAppUri, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(mailtoUri)) {
      await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('No email client found');
    }
    return;
  }

  throw UnsupportedError('Platform not supported');
}
