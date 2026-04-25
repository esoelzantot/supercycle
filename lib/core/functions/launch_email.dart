import 'dart:io' show Platform;

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
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': subject, 'body': body},
  );

  if (kIsWeb) {
    // ✅ Web - يفتح في نفس الـ tab
    await launchMail(email: email, body: body, subject: subject);
    return;
  }

  if (Platform.isAndroid || Platform.isIOS) {
    // ✅ Android & iOS
    CustomSnackBar.showInfo(context, "MOBILE");
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('No email client found on this device');
    }
    return;
  }

  throw UnsupportedError('Platform not supported');
}

Future<void> launchMail({
  required String email,
  required String subject,
  required String body,
}) async {
  if (email.isEmpty) {
    throw 'Email cannot be empty';
  }

  final Uri gmailUri = Uri(
    scheme: 'https',
    host: 'mail.google.com',
    path: '/mail/',
    queryParameters: {'view': 'cm', 'to': email, 'su': subject, 'body': body},
  );

  if (await canLaunchUrl(gmailUri)) {
    await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open Gmail';
  }
}
