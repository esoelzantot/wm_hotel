import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_assets.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/about_us/data/content/vision_data.dart';
import 'package:wm_hotel/features/about_us/data/entities/vision_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text side (right in RTL)
                    Expanded(flex: 3, child: _VisionText()),
                    const SizedBox(width: 40),
                    // Illustration side
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        AppAssets.visionImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _VisionText(),
                    const SizedBox(height: 32),
                    Image.asset(AppAssets.visionImg, fit: BoxFit.cover),
                  ],
                );
        },
      ),
    );
  }
}

class _VisionText extends StatelessWidget {
  VisionEntity vision = visionData;

  @override
  Widget build(BuildContext context) {
    final String currentLang =
        context.watch<LocalCubit>().state is ChangeLocalState
        ? (context.watch<LocalCubit>().state as ChangeLocalState)
              .locale
              .languageCode
        : 'en';

    final bool isArabic = currentLang == 'ar';

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(),
          const SizedBox(height: 20),
          Text(
            isArabic ? vision.arVision : vision.enVision,
            style: AppStyles.styleMedium24(
              context,
            ).copyWith(color: Color(0xFF444444), height: 2.0),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).vision_title,
          style: AppStyles.styleBold36(
            context,
          ).copyWith(color: AppColors.primaryColor, fontSize: 40),
        ),

        Row(
          children: [
            SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
