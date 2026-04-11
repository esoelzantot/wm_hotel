import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail({
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

Future<void> launchEmail({
  required String email,
  required String subject,
  required String body,
}) async {
  if (email.isEmpty) throw 'Email cannot be null or empty';

  if (Platform.isAndroid) {
    final Uri gmailIntent = Uri(
      scheme: 'googlegmail',
      path: '/co',
      queryParameters: {'to': email, 'su': subject, 'body': body},
    );

    if (await canLaunchUrl(gmailIntent)) {
      await launchUrl(gmailIntent);
      return;
    }
  }

  // fallback: mailto لو Gmail مش متثبت
  final Uri mailtoUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': subject, 'body': body},
  );

  if (await canLaunchUrl(mailtoUri)) {
    await launchUrl(mailtoUri);
  } else {
    throw 'Could not launch email client';
  }
}
