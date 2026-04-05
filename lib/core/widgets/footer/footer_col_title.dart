import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class FooterColTitle extends StatelessWidget {
  const FooterColTitle({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(label, style: AppStyles.styleSemiBold24(context)),
    );
  }
}
