import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class VenueRatingBadge extends StatelessWidget {
  final double rating;
  const VenueRatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: AppStyles.styleSemiBold18(context),
          ),
          const SizedBox(width: 6),
          Icon(Icons.star_rounded, color: const Color(0xFFF5A623), size: 18),
        ],
      ),
    );
  }
}
