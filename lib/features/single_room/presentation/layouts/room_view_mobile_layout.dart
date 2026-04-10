import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_vertical_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_drawer.dart';
import 'package:wm_hotel/core/widgets/header/custom_mobile_header.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/hero_section/room_hero_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_booking_section.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_info_section.dart';

class RoomViewMobileLayout extends StatefulWidget {
  const RoomViewMobileLayout({super.key});

  @override
  State<RoomViewMobileLayout> createState() => _RoomViewMobileLayoutState();
}

class _RoomViewMobileLayoutState extends State<RoomViewMobileLayout> {
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
                child: RoomHeroSection(),
              ),
            ),

            SliverToBoxAdapter(
              child: // Content Section
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
