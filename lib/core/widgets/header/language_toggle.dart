import 'package:flutter/material.dart';
import 'package:wm_hotel/core/constants/design_constants.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => LanguageToggleState();
}

class LanguageToggleState extends State<LanguageToggle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          horizontal: DesignConstants.defaultButton_HP,
          vertical: DesignConstants.defaultButton_VP * 0.6,
        ),
        decoration: BoxDecoration(
          color: _hovered ? const Color(0xFFF0F2F8) : Color(0xFFF0F2F8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language_rounded, size: 16, color: Color(0xFF5A5A6E)),
              SizedBox(width: 5),
              Text(
                'اللغة',
                style: AppStyles.styleMedium20(
                  context,
                ).copyWith(color: Color(0xFF5A5A6E)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
