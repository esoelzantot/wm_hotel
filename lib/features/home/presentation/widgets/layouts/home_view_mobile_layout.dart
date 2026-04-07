import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_vertical_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_drawer.dart';
import 'package:wm_hotel/core/widgets/header/custom_mobile_header.dart';
import 'package:wm_hotel/features/home/presentation/widgets/custom_hero_section.dart';
import 'package:wm_hotel/features/home/presentation/widgets/places_section/home_places_section.dart';
import 'package:wm_hotel/features/home/presentation/widgets/rooms_section/home_rooms_section.dart';

class HomeViewMobileLayout extends StatefulWidget {
  const HomeViewMobileLayout({super.key});

  @override
  State<HomeViewMobileLayout> createState() => _HomeViewMobileLayoutState();
}

class _HomeViewMobileLayoutState extends State<HomeViewMobileLayout> {
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
            SliverToBoxAdapter(child: SizedBox(height: 80)),

            // Hero Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: CustomHeroSection(),
              ),
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

            // Rooms Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: HomeRoomsSection(),
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
