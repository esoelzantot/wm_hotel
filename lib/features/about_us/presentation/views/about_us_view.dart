import 'package:flutter/material.dart';
import 'package:wm_hotel/core/layouts/adaptive_layout.dart';
import 'package:wm_hotel/features/about_us/presentation/layouts/about_us_view_mobile_layout.dart';
import 'package:wm_hotel/features/about_us/presentation/layouts/about_us_view_tablet_layout.dart';
import 'package:wm_hotel/features/about_us/presentation/layouts/about_us_view_web_layout.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => AboutUsViewMobileLayout(),
        tabletLayout: (context) => AboutUsViewTabletLayout(),
        desktopLayout: (context) => AboutUsViewWebLayout(),
      ),
    );
  }
}
