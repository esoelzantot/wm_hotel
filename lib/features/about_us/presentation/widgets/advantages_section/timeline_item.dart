import 'package:flutter/material.dart';
import 'package:wm_hotel/features/about_us/data/entities/advantage_entity.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/content_card.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/timeline_column.dart';

class TimelineItem extends StatelessWidget {
  final AdvantageEntity advantage;
  final int index;
  final bool isLast;
  final bool isEven;
  final bool isArabic;

  const TimelineItem({
    super.key,
    required this.advantage,
    required this.index,
    required this.isLast,
    required this.isEven,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Left content (even) or spacer (odd) ─────────────────────
          Expanded(
            child: isEven
                ? ContentCard(
                    advantage: advantage,
                    isArabic: isArabic,
                    alignEnd: true,
                  )
                : const SizedBox.shrink(),
          ),

          const SizedBox(width: 16),

          // ── Center timeline column ───────────────────────────────────
          TimelineColumn(
            icon: advantage.icon,
            isLast: isLast,
            stepNumber: index + 1,
          ),

          const SizedBox(width: 16),

          // ── Right content (odd) or spacer (even) ─────────────────────
          Expanded(
            child: !isEven
                ? ContentCard(
                    advantage: advantage,
                    isArabic: isArabic,
                    alignEnd: false,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
