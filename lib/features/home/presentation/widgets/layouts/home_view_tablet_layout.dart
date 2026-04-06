import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/home/presentation/widgets/custom_hero_section.dart';
import 'package:wm_hotel/features/home/presentation/widgets/places_section/home_places_section.dart';

class HomeViewTabletLayout extends StatelessWidget {
  const HomeViewTabletLayout({super.key});

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
                child: CustomHeroSection(),
              ),

              // Venues Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: HomePlacesSection(),
                ),
              ),

              // Footer
              CustomHorizontalFooter(),
            ],
          ),
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(top: 0, left: 0, right: 0, child: CustomWebHeader()),
      ],
    );
  }
}
