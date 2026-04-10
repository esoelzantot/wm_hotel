import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';

class HeroTextContent extends StatefulWidget {
  final VenueEntity venue;

  static const _navy = Color(0xFF1A2B5F);
  static const _subtitleGrey = Color(0xFF8A94A6);

  const HeroTextContent({super.key, required this.venue});

  @override
  State<HeroTextContent> createState() => _HeroTextContentState();
}

class _HeroTextContentState extends State<HeroTextContent> {
  static const _stats = [
    _StatItem(Icons.luggage_outlined, '2500', 'Users'),
    _StatItem(Icons.camera_alt_outlined, '200', 'treasure'),
    _StatItem(Icons.location_on_outlined, '100', 'cities'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final bool isArabic = state is ChangeLocalState
            ? state.locale.languageCode == 'ar'
            : true;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Headline ──
            Text(
              isArabic ? widget.venue.name.arName : widget.venue.name.enName,
              style: AppStyles.styleBold36(
                context,
              ).copyWith(color: HeroTextContent._navy, fontSize: 40),
            ),
            const SizedBox(height: 18),

            // ── Subtitle ──
            Text(
              isArabic
                  ? widget.venue.brief.arBrief
                  : widget.venue.brief.enBrief,
              style: AppStyles.styleMedium28(
                context,
              ).copyWith(color: HeroTextContent._subtitleGrey),
            ),
            const SizedBox(height: 32),

            // ── Stats row ──
            Row(
              children: _stats
                  .map(
                    (s) => Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: _StatWidget(item: s),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
//  STAT WIDGET
// ─────────────────────────────────────────────

class _StatItem {
  final IconData icon;
  final String value;
  final String label;
  const _StatItem(this.icon, this.value, this.label);
}

class _StatWidget extends StatelessWidget {
  final _StatItem item;
  static const _accent = Color(0xFF2563EB);
  static const _subtitleGrey = Color(0xFF8A94A6);

  const _StatWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: _accent.withValues(alpha: 0.35),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(item.icon, color: _accent, size: 20),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              item.label,
              style: AppStyles.styleMedium22(
                context,
              ).copyWith(color: _subtitleGrey),
            ),
          ],
        ),
      ],
    );
  }
}
