import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wm_hotel/core/helpers/custom_snack_bar.dart';

Future<void> openWhatsApp({
  required BuildContext context,
  required String phone,
  required String content,
}) async {
  final message = Uri.encodeComponent(content);

  final whatsappUrl = Uri.parse("whatsapp://send?phone=$phone&text=$message");
  final fallbackUrl = Uri.parse("https://wa.me/$phone?text=$message");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else if (await canLaunchUrl(fallbackUrl)) {
    await launchUrl(fallbackUrl, mode: LaunchMode.externalApplication);
  } else {
    CustomSnackBar.showWarning(context, "من فضلك ثبّت واتساب على جهازك");
  }
}
