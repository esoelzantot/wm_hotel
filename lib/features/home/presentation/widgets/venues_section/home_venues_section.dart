import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/routing/end_points.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_outlined_button.dart';
import 'package:wm_hotel/features/home/data/content/places_data.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/venues_section/venues_list_view.dart';
import 'package:wm_hotel/generated/l10n.dart';

class HomeVenuesSection extends StatefulWidget {
  const HomeVenuesSection({super.key});

  @override
  State<HomeVenuesSection> createState() => _HomeVenuesSectionState();
}

class _HomeVenuesSectionState extends State<HomeVenuesSection> {
  late final ScrollController _scrollController;
  late List<VenueEntity> _venues;
  bool isMobile = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _venues = List.from(PlacesData.featuredPlaces);
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
          VenuesListView(venues: _venues, scrollController: _scrollController),
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
                    S.of(context).home_venues_section_title,
                    style: AppStyles.styleBold32(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomOutlinedButton(
                  onPress: () =>
                      GoRouter.of(context).push(EndPoints.venuesView),
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
                    S.of(context).home_venues_section_title,
                    style: AppStyles.styleBold32(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                CustomOutlinedButton(
                  onPress: () =>
                      GoRouter.of(context).push(EndPoints.venuesView),
                  title: S.of(context).show_all_venues_button,
                  textColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                ),
              ],
            ),
    );
  }
}
