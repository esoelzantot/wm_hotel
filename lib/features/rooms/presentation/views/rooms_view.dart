import 'package:flutter/material.dart';
import 'package:wm_hotel/core/layouts/adaptive_layout.dart';
import 'package:wm_hotel/features/rooms/presentation/layouts/rooms_view_mobile_layout.dart';
import 'package:wm_hotel/features/rooms/presentation/layouts/rooms_view_tablet_layout.dart';
import 'package:wm_hotel/features/rooms/presentation/layouts/rooms_view_web_layout.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({super.key});

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => RoomsViewMobileLayout(),
        tabletLayout: (context) => RoomsViewTabletLayout(),
        desktopLayout: (context) => RoomsViewWebLayout(),
      ),
    );
  }
}
