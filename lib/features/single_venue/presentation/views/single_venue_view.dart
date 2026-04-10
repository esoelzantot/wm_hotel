import 'package:flutter/material.dart';
import 'package:wm_hotel/core/layouts/adaptive_layout.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/features/single_venue/presentation/layouts/venue_view_mobile_layout.dart';
import 'package:wm_hotel/features/single_venue/presentation/layouts/venue_view_tablet_layout.dart';
import 'package:wm_hotel/features/single_venue/presentation/layouts/venue_view_web_layout.dart';

class SingleVenueView extends StatefulWidget {
  final VenueEntity venue;
  const SingleVenueView({super.key, required this.venue});

  @override
  State<SingleVenueView> createState() => _SingleVenueViewState();
}

class _SingleVenueViewState extends State<SingleVenueView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => VenueViewMobileLayout(venue: widget.venue),
        tabletLayout: (context) => VenueViewTabletLayout(venue: widget.venue),
        desktopLayout: (context) => VenueViewWebLayout(venue: widget.venue),
      ),
    );
  }
}
