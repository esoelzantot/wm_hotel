import 'package:flutter/material.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/rooms_section/room_card.dart';

class RoomsGridView extends StatelessWidget {
  const RoomsGridView({
    super.key,
    required this.rooms,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  final List<RoomEntity> rooms;
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
      itemCount: rooms.length,
      itemBuilder: (_, i) {
        return RoomCard(room: rooms[i]);
      },
    );
  }
}
