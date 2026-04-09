import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/about_us_hero_section.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/our_advantages_section.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/vision_mission/vision_mission_section.dart';

class AboutUsViewTabletLayout extends StatelessWidget {
  const AboutUsViewTabletLayout({super.key});

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
                child: AboutUsHeroSection(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 36,
                ),
                child: VisionMissionSection(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 36,
                ),
                child: OurAdvantagesSection(),
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
          child: CustomWebHeader(activeIndex: 3),
        ),
      ],
    );
  }
}
