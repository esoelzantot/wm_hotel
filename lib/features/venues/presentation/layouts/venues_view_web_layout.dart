import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/venues/presentation/widgets/venues_grid/venues_grid.dart';
import 'package:wm_hotel/features/venues/presentation/widgets/venues_hero_section.dart';

class VenuesViewWebLayout extends StatelessWidget {
  const VenuesViewWebLayout({super.key});

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
                child: VenuesHeroSection(),
              ),

              // Venues Grid
              Padding(padding: const EdgeInsets.all(24), child: VenuesGrid()),

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
