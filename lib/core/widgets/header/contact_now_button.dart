import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class ContactNowButton extends StatefulWidget {
  const ContactNowButton({super.key});

  @override
  State<ContactNowButton> createState() => ContactNowButtonState();
}

class ContactNowButtonState extends State<ContactNowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _hovered
                  ? [const Color(0xFF2E4EA1), const Color(0xFF1A2B5F)]
                  : [const Color(0xFF1A2B5F), const Color(0xFF2E4EA1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF1A2B5F).withValues(alpha: 0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: const Color(0xFF1A2B5F).withValues(alpha: 0.18),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 200),
            offset: _hovered ? const Offset(0, -0.05) : Offset.zero,
            child: Text(
              'تواصل الآن',
              style: AppStyles.styleSemiBold20(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
