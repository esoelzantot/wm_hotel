import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/hero_section/room_hero_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_booking_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_info_section.dart';

class RoomViewTabletLayout extends StatelessWidget {
  final RoomEntity room;

  const RoomViewTabletLayout({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Scrollable Content ────────────────────────────────
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90), // Space for the fixed header
              // Hero Section
              Padding(
                padding: const EdgeInsets.all(24),
                child: RoomHeroSection(room: room),
              ),

              // Content Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    RoomInfoSection(details: room.details),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RoomBookingSection(
                        pricePerNight: room.price,
                        serviceFee: room.serviceFee,
                        room: room,
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              CustomHorizontalFooter(),
            ],
          ),
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomWebHeader(activeIndex: 2),
        ),
      ],
    );
  }
}
