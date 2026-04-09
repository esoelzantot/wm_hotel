import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_vertical_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_drawer.dart';
import 'package:wm_hotel/core/widgets/header/custom_mobile_header.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/about_us_hero_section.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/advantages_section/mobile_our_advantages_section.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/vision_mission/vision_mission_section.dart';

class AboutUsViewMobileLayout extends StatefulWidget {
  const AboutUsViewMobileLayout({super.key});

  @override
  State<AboutUsViewMobileLayout> createState() =>
      _AboutUsViewMobileLayoutState();
}

class _AboutUsViewMobileLayoutState extends State<AboutUsViewMobileLayout> {
  bool _isDrawerOpen = false;

  void _openDrawer() => setState(() => _isDrawerOpen = true);
  void _closeDrawer() => setState(() => _isDrawerOpen = false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Main Content ──────────────────────────────────────
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 90)),

            // Hero Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AboutUsHeroSection(),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 36,
                ),
                child: VisionMissionSection(),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: MobileOurAdvantagesSection(),
              ),
            ),

            SliverToBoxAdapter(child: CustomVerticalFooter()),
          ],
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomMobileHeader(onMenuTap: _openDrawer),
        ),

        // ── Scrim (backdrop) ─────────────────────────────────
        if (_isDrawerOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDrawer,
              child: AnimatedOpacity(
                opacity: _isDrawerOpen ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(color: Colors.black.withAlpha(140)),
              ),
            ),
          ),

        // ── Drawer Panel ──────────────────────────────────────
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: 0,
          bottom: 0,
          left: _isDrawerOpen ? 0 : -300,
          width: 290,
          child: CustomDrawer(onClose: _closeDrawer),
        ),
      ],
    );
  }
}
