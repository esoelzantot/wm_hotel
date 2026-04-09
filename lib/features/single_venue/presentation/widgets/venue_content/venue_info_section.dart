import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class VenueInfoSection extends StatelessWidget {
  final String title;
  final List<String> paragraphs;
  final IconData bulletIcon;

  const VenueInfoSection({
    super.key,
    this.title = 'About the place',
    required this.paragraphs,
    this.bulletIcon = Icons.fiber_manual_record,
  });

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
          ...paragraphs.asMap().entries.map(
            (entry) => _ParagraphItem(
              text: entry.value,
              index: entry.key,
              isLast: entry.key == paragraphs.length - 1,
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
  final String text;
  final int index;
  final bool isLast;

  const _ParagraphItem({
    required this.text,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
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
                  // Icon circle
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2D4F).withValues(alpha: 0.07),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.format_quote_rounded,
                      size: 16,
                      color: Color(0xFF1B2D4F),
                    ),
                  ),

                  // Connecting line (hidden for last item)
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
                  style: AppStyles.styleMedium24(
                    context,
                  ).copyWith(color: Color(0xFF6B7280)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
