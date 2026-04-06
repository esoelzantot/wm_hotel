import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_outlined_button.dart';
import 'package:wm_hotel/features/home/data/content/places_data.dart';
import 'package:wm_hotel/features/home/data/entities/place_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/places_section/places_list_view.dart';
import 'package:wm_hotel/generated/l10n.dart';

class HomePlacesSection extends StatefulWidget {
  const HomePlacesSection({super.key});

  @override
  State<HomePlacesSection> createState() => _HomePlacesSectionState();
}

class _HomePlacesSectionState extends State<HomePlacesSection> {
  late final ScrollController _scrollController;
  late List<PlaceEntity> _places;
  bool isMobile = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _places = List.from(PlacesData.featuredPlaces);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    isMobile = width < SizeConfig.tablet;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          PlacesListView(places: _places, scrollController: _scrollController),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    S.of(context).home_places_section_title,
                    style: AppStyles.styleBold32(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomOutlinedButton(
                  onPress: () {},
                  title: S.of(context).show_all_venues_button,
                  textColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    S.of(context).home_places_section_title,
                    style: AppStyles.styleBold32(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                CustomOutlinedButton(
                  onPress: () {},
                  title: S.of(context).show_all_venues_button,
                  textColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                ),
              ],
            ),
    );
  }
}
