import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendMail({
  required String email,
  required String subject,
  required String body,
  required BuildContext context,
}) async {
  final encodedSubject = Uri.encodeComponent(subject);
  final encodedBody = Uri.encodeComponent(body);

  final mailto = Uri.parse(
    'mailto:$email?subject=$encodedSubject&body=$encodedBody',
  );

  final gmailApp = Uri.parse(
    'googlegmail://co?to=$email&subject=$encodedSubject&body=$encodedBody',
  );

  final gmailWeb = Uri.parse(
    'https://mail.google.com/mail/?view=cm&to=$email&su=$encodedSubject&body=$encodedBody',
  );

  if (await isMobileBrowser()) {
    await launchUrl(mailto);
  }

  if (await canLaunchUrl(gmailApp)) {
    await launchUrl(gmailApp);
    return;
  }

  if (await canLaunchUrl(gmailWeb)) {
    await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
    return;
  }
}

Future<bool> isMobileBrowser() async {
  final deviceInfo = DeviceInfoPlugin();
  final webInfo = await deviceInfo.webBrowserInfo;

  final userAgent = webInfo.userAgent?.toLowerCase() ?? '';

  return userAgent.contains('android') ||
      userAgent.contains('iphone') ||
      userAgent.contains('mobile');
}
