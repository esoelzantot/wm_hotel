import 'package:flutter/foundation.dart';
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
    if (kIsWeb) {
      /// 🌐 Web Behavior
      /// نحاول mailto الأول (يفتح app لو متاح)
      if (await canLaunchUrl(mailtoUri)) {
        await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      } else {
        /// fallback → Gmail Web
        await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
      }
    } else {
      /// 📱 Mobile / Desktop Apps
      await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    throw Exception('Could not launch email client: $e');
  }
}
