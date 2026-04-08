import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.label,
    required this.isActive,
    required this.isHovered,
    required this.onTapped,
  });

  final String label;
  final bool isActive;
  final bool isHovered;

  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    final highlight = isActive || isHovered;

    return GestureDetector(
      onTap: onTapped,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 180),
            style: AppStyles.styleSemiBold24(context).copyWith(
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: highlight
                  ? const Color(0xFF1A2B5F)
                  : const Color(0xFF5A5A6E),
            ),
            child: Text(label),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            height: 2,
            width: isActive ? 28 : (isHovered ? 14 : 0),
            decoration: BoxDecoration(
              color: const Color(0xFF1A2B5F),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
