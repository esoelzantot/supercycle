import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail({
  required String email,
  required String subject,
  required String body,
}) async {
  if (email.isEmpty) throw Exception('Email cannot be empty');

  final encodedEmail = Uri.encodeComponent(email);
  final encodedSubject = Uri.encodeComponent(subject);
  final encodedBody = Uri.encodeComponent(body);

  // Gmail Web
  final Uri gmailWebUri = Uri.parse(
    'https://mail.google.com/mail/?view=cm'
    '&to=$encodedEmail'
    '&su=$encodedSubject'
    '&body=$encodedBody',
  );

  // Gmail App (Mobile)
  final Uri gmailAppUri = Uri.parse(
    'googlegmail://co?to=$encodedEmail'
    '&subject=$encodedSubject'
    '&body=$encodedBody',
  );

  // Mailto (Fallback قوي جدًا)
  final Uri mailtoUri = Uri.parse(
    'mailto:$encodedEmail?subject=$encodedSubject&body=$encodedBody',
  );

  try {
    if (kIsWeb) {
      // 🔥 Web → نفرق Mobile vs Desktop
      final isMobileWeb =
          defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android;

      if (isMobileWeb) {
        // 👉 موبايل → يفتح Gmail App لو موجود
        if (await canLaunchUrl(gmailAppUri)) {
          await launchUrl(gmailAppUri, mode: LaunchMode.externalApplication);
          return;
        }
      }

      // 👉 Desktop Web (أو fallback)
      await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
    } else {
      // 📱 Native Mobile
      if (await canLaunchUrl(gmailAppUri)) {
        await launchUrl(gmailAppUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(mailtoUri)) {
        await launchUrl(mailtoUri);
      } else {
        await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
      }
    }
  } catch (e) {
    throw Exception('Failed to send email: $e');
  }
}
