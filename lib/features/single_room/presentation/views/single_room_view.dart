import 'package:flutter/material.dart';
import 'package:wm_hotel/core/layouts/adaptive_layout.dart';
import 'package:wm_hotel/features/single_room/presentation/layouts/room_view_mobile_layout.dart';
import 'package:wm_hotel/features/single_room/presentation/layouts/room_view_tablet_layout.dart';
import 'package:wm_hotel/features/single_room/presentation/layouts/room_view_web_layout.dart';

class SingleRoomView extends StatefulWidget {
  const SingleRoomView({super.key});

  @override
  State<SingleRoomView> createState() => _SingleRoomViewState();
}

class _SingleRoomViewState extends State<SingleRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => RoomViewMobileLayout(),
        tabletLayout: (context) => RoomViewTabletLayout(),
        desktopLayout: (context) => RoomViewWebLayout(),
      ),
    );
  }
}
