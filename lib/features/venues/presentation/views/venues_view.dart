import 'package:flutter/material.dart';
import 'package:wm_hotel/core/layouts/adaptive_layout.dart';
import 'package:wm_hotel/features/venues/presentation/layouts/venues_view_mobile_layout.dart';
import 'package:wm_hotel/features/venues/presentation/layouts/venues_view_tablet_layout.dart';
import 'package:wm_hotel/features/venues/presentation/layouts/venues_view_web_layout.dart';

class VenuesView extends StatefulWidget {
  const VenuesView({super.key});

  @override
  State<VenuesView> createState() => _VenuesViewState();
}

class _VenuesViewState extends State<VenuesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => VenuesViewMobileLayout(),
        tabletLayout: (context) => VenuesViewTabletLayout(),
        desktopLayout: (context) => VenuesViewWebLayout(),
      ),
    );
  }
}
