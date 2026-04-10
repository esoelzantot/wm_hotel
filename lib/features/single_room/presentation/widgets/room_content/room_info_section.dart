import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class RoomInfoSection extends StatelessWidget {
  final List<RoomDetails> details;

  const RoomInfoSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title ──
          Row(
            children: [
              Container(
                width: 4,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2D4F),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                S.of(context).venue_info_title,
                style: AppStyles.styleBold30(
                  context,
                ).copyWith(color: AppColors.secondaryColor),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── Paragraphs list ──
          ...details.asMap().entries.map(
            (entry) => _ParagraphItem(
              details: entry.value,
              index: entry.key,
              isLast: entry.key == details.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  PARAGRAPH ITEM
// ─────────────────────────────────────────────
class _ParagraphItem extends StatelessWidget {
  final RoomDetails details;
  final int index;
  final bool isLast;

  const _ParagraphItem({
    required this.details,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final bool isArabic = state is ChangeLocalState
            ? state.locale.languageCode == 'ar'
            : true;

        // ── اختار النص حسب اللغة ──
        final String text = isArabic ? details.arDetails : details.enDetails;

        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Left: icon + connecting line ──
                SizedBox(
                  width: 36,
                  child: Column(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF1B2D4F,
                          ).withValues(alpha: 0.07),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.format_quote_rounded,
                          size: 16,
                          color: Color(0xFF1B2D4F),
                        ),
                      ),
                      if (!isLast)
                        Expanded(
                          child: Center(
                            child: Container(
                              width: 1.5,
                              color: const Color(
                                0xFF1B2D4F,
                              ).withValues(alpha: 0.10),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // ── Right: text content ──
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 16),
                    child: Text(
                      text,
                      textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      style: AppStyles.styleMedium24(
                        context,
                      ).copyWith(color: const Color(0xFF6B7280)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
