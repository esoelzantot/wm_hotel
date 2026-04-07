import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_outlined_button.dart';
import 'package:wm_hotel/features/home/presentation/widgets/rooms_section/rooms_list_view.dart';
import 'package:wm_hotel/generated/l10n.dart';

class HomeRoomsSection extends StatefulWidget {
  const HomeRoomsSection({super.key});

  @override
  State<HomeRoomsSection> createState() => _HomeRoomsSectionState();
}

class _HomeRoomsSectionState extends State<HomeRoomsSection> {
  bool isMobile = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    isMobile = width < SizeConfig.tablet;
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LocalCubit>().state is ChangeLocalState
        ? (context.watch<LocalCubit>().state as ChangeLocalState)
                  .locale
                  .languageCode ==
              'ar'
        : false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          RoomsListView(isArabic: isArabic),
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
                    S.of(context).home_rooms_section_title,
                    style: AppStyles.styleBold32(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomOutlinedButton(
                  onPress: () {},
                  title: S.of(context).show_all_rooms_button,
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
                    S.of(context).home_rooms_section_title,
                    style: AppStyles.styleBold32(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                CustomOutlinedButton(
                  onPress: () {},
                  title: S.of(context).show_all_rooms_button,
                  textColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                ),
              ],
            ),
    );
  }
}
