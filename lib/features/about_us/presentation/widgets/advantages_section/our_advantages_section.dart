import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/features/about_us/data/content/advantages_data.dart';
import 'package:wm_hotel/features/about_us/data/entities/advantage_entity.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/our_advantages_header.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/timeline_item.dart';

class OurAdvantagesSection extends StatelessWidget {
  const OurAdvantagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<AdvantageEntity> advantages = advantagesData;

    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final bool isArabic = state is ChangeLocalState
            ? state.locale.languageCode == 'ar'
            : true;

        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Section Header ──────────────────────────────────────
                OurAdvantagesHeader(),
                const SizedBox(height: 48),

                // ── Timeline List ───────────────────────────────────────
                ...List.generate(advantages.length, (index) {
                  final isLast = index == advantages.length - 1;
                  final isEven = index % 2 == 0;
                  return TimelineItem(
                    advantage: advantages[index],
                    index: index,
                    isLast: isLast,
                    isEven: isEven,
                    isArabic: isArabic,
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
