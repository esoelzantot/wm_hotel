import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/utils/app_assets.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class RoomsHeroSection extends StatefulWidget {
  const RoomsHeroSection({super.key});

  @override
  State<RoomsHeroSection> createState() => _RoomsHeroSectionState();
}

class _RoomsHeroSectionState extends State<RoomsHeroSection> {
  late double width;
  late double h_padding;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    h_padding = (width < SizeConfig.tablet) ? 12.0 : 36.0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.roomsImg),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: h_padding, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Text(
                S.of(context).rooms_hero_title,
                style: AppStyles.styleBold32(
                  context,
                ).copyWith(fontSize: 48, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: width * 0.6,
                child: Text(
                  S.of(context).rooms_hero_content,
                  style: AppStyles.styleSemiBold30(
                    context,
                  ).copyWith(color: Colors.white.withValues(alpha: 0.9)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
