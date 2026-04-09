import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_booking_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_info_section.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/hero_section/venue_hero_section.dart';

class RoomViewTabletLayout extends StatelessWidget {
  const RoomViewTabletLayout({super.key});

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
                child: VenueHeroSection(),
              ),

              // Content Section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    RoomInfoSection(
                      paragraphs: [
                        "details 1 details 1 details 1 details 1 details 1 details 1 details 1",
                        "details 1",
                        "details 1",
                        "details 1",
                      ],
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RoomBookingSection(
                        pricePerNight: 100,
                        serviceFee: 15,
                        onBook: () {},
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
