import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/routing/end_points.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_animated_button.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

import 'venue_rating_badge.dart';

class VenueCard extends StatefulWidget {
  final VenueEntity venue;

  const VenueCard({super.key, required this.venue});

  @override
  State<VenueCard> createState() => _VenueCardState();
}

class _VenueCardState extends State<VenueCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.025,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hovered) {
    if (hovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 450,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(scale: _scaleAnimation.value, child: child);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildImageSection()),
                _buildInfoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: Image.network(
              widget.venue.images.first,
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

          // Gradient overlay
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

          // Favorite button
          Positioned(
            top: 12,
            right: 12,
            child: VenueRatingBadge(rating: widget.venue.rating),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    final String currentLang =
        context.watch<LocalCubit>().state is ChangeLocalState
        ? (context.watch<LocalCubit>().state as ChangeLocalState)
              .locale
              .languageCode
        : 'en';

    final bool isArabic = currentLang == 'ar';

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            isArabic ? widget.venue.name.arName : widget.venue.name.enName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleBold22(
              context,
            ).copyWith(color: const Color(0xFF1A1A2E)),
          ),
          const SizedBox(height: 4),

          // Brief
          Text(
            isArabic ? widget.venue.brief.arBrief : widget.venue.brief.enBrief,
            style: AppStyles.styleSemiBold18(
              context,
            ).copyWith(color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),

          // Action Button
          CustomAnimatedButton(
            onTap: () => GoRouter.of(
              context,
            ).push(EndPoints.singleVenueView, extra: widget.venue),
            title: S.of(context).details_button,
            backgroundColor: const Color(0xFFFF6B00),
          ),
        ],
      ),
    );
  }
}
