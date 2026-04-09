import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_assets.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/about_us/data/content/mission_data.dart';
import 'package:wm_hotel/features/about_us/data/entities/mission_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 48),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Illustration side (left in RTL = appears on left visually)
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        AppAssets.missionImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Text side
                    Expanded(flex: 3, child: _MissionText()),
                  ],
                )
              : Column(
                  children: [
                    _MissionText(),
                    const SizedBox(height: 32),
                    Image.asset(AppAssets.missionImg, fit: BoxFit.contain),
                  ],
                );
        },
      ),
    );
  }
}

class _MissionText extends StatelessWidget {
  MissionEntity mission = missionData;

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
            isArabic ? mission.arMission : mission.enMission,
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
          S.of(context).mission_title,
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
