import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/custom_horizontal_footer.dart';
import 'package:wm_hotel/core/widgets/header/custom_web_header.dart';

class HomeViewWebLayout extends StatelessWidget {
  const HomeViewWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Scrollable Content ────────────────────────────────
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90), // Space for the fixed header
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
