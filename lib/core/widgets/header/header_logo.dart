import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Moon icon
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [const Color(0xFF1A2B5F), const Color(0xFF2E4EA1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(
              Icons.nightlight_round,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'White Moon',
            style: AppStyles.styleBold28(
              context,
            ).copyWith(color: Color(0xFF1A2B5F)),
          ),
        ],
      ),
    );
  }
}
