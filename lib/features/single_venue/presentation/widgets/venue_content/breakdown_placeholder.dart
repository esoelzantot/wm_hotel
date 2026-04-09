import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class BreakdownPlaceholder extends StatelessWidget {
  const BreakdownPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.info_outline_rounded, size: 15, color: Colors.grey.shade400),
        const SizedBox(width: 6),
        Text(
          S.of(context).breakdown_place_holder,
          style: AppStyles.styleMedium16(
            context,
          ).copyWith(color: Colors.grey.shade400),
        ),
      ],
    );
  }
}
