import 'package:flutter/material.dart';
import 'package:wm_hotel/core/layouts/adaptive_layout.dart';
import 'package:wm_hotel/features/single_venue/presentation/layouts/venue_view_mobile_layout.dart';
import 'package:wm_hotel/features/single_venue/presentation/layouts/venue_view_tablet_layout.dart';
import 'package:wm_hotel/features/single_venue/presentation/layouts/venue_view_web_layout.dart';

class SingleVenueView extends StatefulWidget {
  const SingleVenueView({super.key});

  @override
  State<SingleVenueView> createState() => _SingleVenueViewState();
}

class _SingleVenueViewState extends State<SingleVenueView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => VenueViewMobileLayout(),
        tabletLayout: (context) => VenueViewTabletLayout(),
        desktopLayout: (context) => VenueViewWebLayout(),
      ),
    );
  }
}
