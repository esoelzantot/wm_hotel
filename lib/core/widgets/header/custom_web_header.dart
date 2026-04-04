import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/header/contact_now_button.dart';
import 'package:wm_hotel/core/widgets/header/header_logo.dart';
import 'package:wm_hotel/core/widgets/header/language_toggle.dart';
import 'package:wm_hotel/core/widgets/header/nav_item.dart';

class CustomWebHeader extends StatefulWidget {
  const CustomWebHeader({super.key});

  @override
  State<CustomWebHeader> createState() => _CustomWebHeaderState();
}

class _CustomWebHeaderState extends State<CustomWebHeader> {
  int _hoveredIndex = -1;
  int _activeIndex = 0;

  final List<String> _navItems = [
    'الرئيسية',
    'الضيافة',
    'الغرف',
    'خدماتنا',
    'من نحن',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 16,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            // ── Logo ──────────────────────────────────────────────
            HeaderLogo(),

            const SizedBox(width: 48),

            // ── Nav Items ─────────────────────────────────────────
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(_navItems.length, (i) {
                  final isActive = _activeIndex == i;
                  final isHovered = _hoveredIndex == i;

                  return MouseRegion(
                    onEnter: (_) => setState(() => _hoveredIndex = i),
                    onExit: (_) => setState(() => _hoveredIndex = -1),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => setState(() => _activeIndex = i),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: NavItem(
                          label: _navItems[i],
                          isActive: isActive,
                          isHovered: isHovered,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(width: 32),

            // ── Language Toggle ───────────────────────────────────
            LanguageToggle(),

            const SizedBox(width: 20),

            // ── CTA Button ────────────────────────────────────────
            ContactNowButton(),
          ],
        ),
      ),
    );
  }
}
