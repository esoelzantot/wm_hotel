import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/utils/app_assets.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_animated_button.dart';
import 'package:wm_hotel/generated/l10n.dart';

class CustomHeroSection extends StatefulWidget {
  const CustomHeroSection({super.key});

  @override
  State<CustomHeroSection> createState() => _CustomHeroSectionState();
}

class _CustomHeroSectionState extends State<CustomHeroSection> {
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
            image: AssetImage(AppAssets.heroImage),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Text(
                S.of(context).home_hero_title,
                style: AppStyles.styleBold32(
                  context,
                ).copyWith(fontSize: 48, color: Colors.white),
              ),
              SizedBox(height: 6),
              SizedBox(
                width: width * 0.6,
                child: Text(
                  S.of(context).home_hero_content,
                  style: AppStyles.styleSemiBold30(
                    context,
                  ).copyWith(color: Colors.white.withValues(alpha: 0.9)),
                ),
              ),

              const SizedBox(height: 32),

              // Button
              CustomAnimatedButton(
                onTap: () {},
                title: S.of(context).home_hero_button,
                fontSize: 24,
                textColor: const Color(0xFFFF6B00),
                backgroundColor: Colors.white.withValues(alpha: 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
