import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/features/about_us/data/content/advantages_data.dart';
import 'package:wm_hotel/features/about_us/data/entities/advantage_entity.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/content_card.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/our_advantages_header.dart';

// ─────────────────────────────────────────────────────────────────────────────
// MAIN WIDGET
// ─────────────────────────────────────────────────────────────────────────────

class MobileOurAdvantagesSection extends StatelessWidget {
  const MobileOurAdvantagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AdvantageEntity> advantages = advantagesData;

    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final bool isArabic = state is ChangeLocalState
            ? state.locale.languageCode == 'ar'
            : true;

        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Section Header (reused from desktop) ───────────────
                OurAdvantagesHeader(),
                const SizedBox(height: 40),

                // ── Single-Column Timeline ──────────────────────────────
                ...List.generate(advantages.length, (index) {
                  final bool isLast = index == advantages.length - 1;
                  return _MobileTimelineItem(
                    advantage: advantages[index],
                    isLast: isLast,
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

// ─────────────────────────────────────────────────────────────────────────────
// MOBILE TIMELINE ITEM
// ─────────────────────────────────────────────────────────────────────────────

class _MobileTimelineItem extends StatelessWidget {
  final AdvantageEntity advantage;
  final bool isLast;
  final bool isArabic;

  const _MobileTimelineItem({
    required this.advantage,
    required this.isLast,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timeline spine (icon + dashed line) ──────────────────────
          _MobileTimelineSpine(icon: advantage.icon, isLast: isLast),

          const SizedBox(width: 16),

          // ── Content card (takes remaining width) ─────────────────────
          Expanded(
            child: ContentCard(
              advantage: advantage,
              isArabic: isArabic,
              alignEnd: false,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TIMELINE SPINE  — icon node + vertical dashed connector
// ─────────────────────────────────────────────────────────────────────────────

class _MobileTimelineSpine extends StatelessWidget {
  final IconData icon;
  final bool isLast;

  const _MobileTimelineSpine({required this.icon, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Green circle node ─────────────────────────────────────────
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor.withValues(alpha: 0.75),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),

        // ── Dashed vertical connector ─────────────────────────────────
        if (!isLast)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CustomPaint(
                painter: _VerticalDashedPainter(),
                child: const SizedBox(width: 2),
              ),
            ),
          ),

        if (!isLast) const SizedBox(height: 8),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// VERTICAL DASHED LINE PAINTER
// ─────────────────────────────────────────────────────────────────────────────

class _VerticalDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashH = 6.0;
    const double gapH = 4.0;

    final paint = Paint()
      ..color = AppColors.secondaryColor.withValues(alpha: 0.4)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, (y + dashH).clamp(0.0, size.height)),
        paint,
      );
      y += dashH + gapH;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
