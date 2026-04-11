import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail({
  required String email,
  required String subject,
  required String body,
}) async {
  if (email.isEmpty) throw 'Email cannot be empty';

  // web على desktop → Gmail website
  // web على موبايل أو native → mailto يفتح Gmail app
  final bool isWebDesktop = kIsWeb && !_isMobileWeb();

  if (isWebDesktop) {
    final Uri gmailUri = Uri(
      scheme: 'https',
      host: 'mail.google.com',
      path: '/mail/',
      queryParameters: {'view': 'cm', 'to': email, 'su': subject, 'body': body},
    );
    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
      return;
    }
  }

  // mobile web أو native → mailto
  final Uri mailtoUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': subject, 'body': body},
  );

  if (await canLaunchUrl(mailtoUri)) {
    await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch email client';
  }
}

bool _isMobileWeb() {
  if (!kIsWeb) return false;
  // بنشيك على الـ userAgent عشان نعرف موبايل ولا لأ
  final userAgent = Uri.base.toString();
  return _getMobileWebFlag();
}

bool _getMobileWebFlag() {
  try {
    // استخدام dart:html بس على web
    // ignore: avoid_web_libraries_in_flutter
    final html = Uri.base.toString();
    return html.contains('mobile') ||
        html.contains('android') ||
        html.contains('iphone');
  } catch (_) {
    return false;
  }
}
