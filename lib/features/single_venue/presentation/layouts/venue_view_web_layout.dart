import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/hero_section/venue_hero_section.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/venue_booking_section.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/venue_info_section.dart';

class VenueViewWebLayout extends StatelessWidget {
  final VenueEntity venue;
  const VenueViewWebLayout({super.key, required this.venue});

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
                child: VenueHeroSection(venue: venue),
              ),

              // Content Section
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
                      child: VenueInfoSection(details: venue.details),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: VenueBookingSection(
                          pricePerHour: venue.price,
                          serviceFee: venue.serviceFee,
                          venue: venue,
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
          child: CustomWebHeader(activeIndex: 1),
        ),
      ],
    );
  }
}
