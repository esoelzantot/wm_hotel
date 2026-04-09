import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class OurAdvantagesHeader extends StatelessWidget {
  const OurAdvantagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).our_advantages_title,
          textAlign: TextAlign.center,
          style: AppStyles.styleBold36(
            context,
          ).copyWith(color: AppColors.primaryColor, fontSize: 40),
        ),
        const SizedBox(height: 8),
        // Centered green accent line — matches VisionAndMission style
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          S.of(context).our_advantages_content,
          textAlign: TextAlign.center,
          style: AppStyles.styleMedium28(
            context,
          ).copyWith(color: Color(0xFF888888)),
        ),
      ],
    );
  }
}
