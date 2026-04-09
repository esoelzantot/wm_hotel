import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/hero_section/room_hero_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_booking_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_info_section.dart';

class RoomViewWebLayout extends StatelessWidget {
  const RoomViewWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Scrollable Content ────────────────────────────────
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90), // Space for the fixed header
              // Hero Section
              Padding(
                padding: const EdgeInsets.all(24),
                child: RoomHeroSection(),
              ),

              // Hero Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: RoomInfoSection(
                        paragraphs: [
                          "details 1 ",
                          "details 1",
                          "details 1",
                          "details 1",
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: RoomBookingSection(
                          pricePerNight: 100,
                          serviceFee: 15,
                          onBook: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              SizedBox(height: 32),
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
