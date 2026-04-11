import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/functions/entity_cache.dart';
import 'package:wm_hotel/core/routing/end_points.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_animated_button.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/custom_divider.dart';
import 'package:wm_hotel/features/home/presentation/widgets/venues_section/venue_rating_badge.dart';
import 'package:wm_hotel/generated/l10n.dart';

class RoomCard extends StatelessWidget {
  final RoomEntity room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 480 / 450,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: _buildImage()),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                room.images.first,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey.shade100,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.image_outlined,
                    color: Colors.grey.shade400,
                    size: 48,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.15),
                    ],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: VenueRatingBadge(rating: room.rating.toDouble()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    // ✅ قراءة الـ locale من LocalCubit
    final state = context.watch<LocalCubit>().state;
    final bool isArabic = state is ChangeLocalState
        ? state.locale.languageCode == 'ar'
        : false;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic ? room.name.arName : room.name.enName,
                      style: AppStyles.styleBold24(
                        context,
                      ).copyWith(color: const Color(0xFF1A1A2E)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isArabic ? room.brief.arBrief : room.brief.enBrief,
                      style: AppStyles.styleMedium20(
                        context,
                      ).copyWith(color: AppColors.subTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        isArabic ? '${room.price} ر.س ' : '${room.price} SAR ',
                        style: AppStyles.styleBold28(context).copyWith(
                          color: const Color(0xFF1565C0),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      isArabic ? 'لكل ليلة' : 'per night',
                      style: AppStyles.styleSemiBold20(
                        context,
                      ).copyWith(color: AppColors.subTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const CustomDivider(),
          const SizedBox(height: 14),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAnimatedButton(
                onTap: () {
                  RoomCache.set(room); // ✅ save before navigate
                  GoRouter.of(context).push(
                    EndPoints.singleRoomView.replaceAll('id', room.roomId),
                    extra: room,
                  );
                },
                title: S.of(context).details_button,
                backgroundColor: const Color(0xFFFF6B00),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
