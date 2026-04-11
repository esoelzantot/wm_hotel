import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail({
  required String email,
  required String subject,
  required String body,
}) async {
  if (email.isEmpty) {
    throw Exception('Email cannot be empty');
  }

  /// Gmail Web (Fallback)
  final Uri gmailWebUri = Uri.parse(
    'https://mail.google.com/mail/?view=cm'
    '&to=$email'
    '&su=${Uri.encodeComponent(subject)}'
    '&body=${Uri.encodeComponent(body)}',
  );

  /// Mailto (Preferred)
  final Uri mailtoUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': subject, 'body': body},
  );

  try {
    await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    throw Exception('Could not launch email client: $e');
  }
}

Future<void> launchEmail({
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
