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
  // Ensure email is not empty
  if (email.isEmpty) {
    throw 'Email cannot be null or empty';
  }

  // Create a mailto Uri
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': subject, 'body': body},
  );

  // Check if the email URI can be launched
  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch email client';
  }
}
