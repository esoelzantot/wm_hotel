import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wm_hotel/features/home/data/content/rooms_data.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/rooms_section/room_card.dart';

class RoomsListView extends StatefulWidget {
  final bool isArabic;

  const RoomsListView({super.key, required this.isArabic});

  @override
  State<RoomsListView> createState() => _RoomsListViewState();
}

class _RoomsListViewState extends State<RoomsListView> {
  final List<RoomEntity> _rooms = RoomsData.featuredRooms;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          itemCount: _rooms.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: RoomCard(room: _rooms[index]),
            );
          },
        ),
      ),
    );
  }
}
