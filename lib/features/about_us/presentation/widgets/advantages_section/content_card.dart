import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/about_us/data/entities/advantage_entity.dart';

class ContentCard extends StatelessWidget {
  final AdvantageEntity advantage;
  final bool isArabic;
  final bool alignEnd;

  const ContentCard({
    super.key,
    required this.advantage,
    required this.isArabic,
    required this.alignEnd,
  });

  @override
  Widget build(BuildContext context) {
    final title = isArabic ? advantage.arTitle : advantage.enTitle;
    final description = isArabic
        ? advantage.arDescription
        : advantage.enDescription;

    return Align(
      alignment: alignEnd ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 36),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEEEEEE), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    margin: isArabic
                        ? const EdgeInsets.only(left: 8)
                        : const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Flexible(
                    child: Text(title, style: AppStyles.styleBold24(context)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: AppStyles.styleMedium20(
                  context,
                ).copyWith(color: Color(0xFF666666)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
