import 'package:flutter/material.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/venues_section/venue_card.dart';

class VenuesGridView extends StatelessWidget {
  const VenuesGridView({
    super.key,
    required this.places,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  final List<VenueEntity> places;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: places.length,
      itemBuilder: (_, i) {
        return VenueCard(venue: places[i]);
      },
    );
  }
}
