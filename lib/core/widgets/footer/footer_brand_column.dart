import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class FooterBrandColumn extends StatelessWidget {
  const FooterBrandColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand name – LTR serif feel
        Text(
          S.of(context).hotel_name,
          style: AppStyles.styleSemiBold36(
            context,
          ).copyWith(color: AppColors.primaryColor),
        ),

        const SizedBox(height: 3),
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              S.of(context).footer_hotel_brief_title,
              style: AppStyles.styleSemiBold24(
                context,
              ).copyWith(color: AppColors.subTextColor),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Gold accent line
        Container(width: 100, height: 1.5, color: AppColors.divider),

        const SizedBox(height: 16),

        Text(
          S.of(context).footer_hotel_brief_content,
          style: AppStyles.styleMedium22(context),
        ),

        const SizedBox(height: 28),

        // Social Icons Row
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: const [
        //     _SocialButton(icon: _SocialIcon.instagram),
        //     SizedBox(width: 12),
        //     _SocialButton(icon: _SocialIcon.twitter),
        //     SizedBox(width: 12),
        //     _SocialButton(icon: _SocialIcon.facebook),
        //   ],
        // ),
      ],
    );
  }
}

enum _SocialIcon { instagram, twitter, facebook }

class _SocialButton extends StatefulWidget {
  const _SocialButton({required this.icon});
  final _SocialIcon icon;

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  IconData get _iconData => switch (widget.icon) {
    _SocialIcon.instagram => Icons.camera_alt_outlined,
    _SocialIcon.twitter => Icons.alternate_email,
    _SocialIcon.facebook => Icons.facebook_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _hovered
              ? Colors.orangeAccent.withOpacity(0.08)
              : Colors.transparent,
          border: Border.all(
            color: _hovered
                ? Colors.orangeAccent
                : Colors.orangeAccent.withOpacity(0.35),
            width: 0.5,
          ),
        ),
        child: Icon(_iconData, size: 15, color: Colors.orangeAccent),
      ),
    );
  }
}
