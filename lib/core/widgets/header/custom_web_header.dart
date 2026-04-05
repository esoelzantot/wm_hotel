import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/header/contact_now_button.dart';
import 'package:wm_hotel/core/widgets/header/header_logo.dart';
import 'package:wm_hotel/core/widgets/header/language_toggle.dart';
import 'package:wm_hotel/core/widgets/header/nav_item.dart';
import 'package:wm_hotel/generated/l10n.dart';

class CustomWebHeader extends StatefulWidget {
  const CustomWebHeader({super.key});

  @override
  State<CustomWebHeader> createState() => _CustomWebHeaderState();
}

class _CustomWebHeaderState extends State<CustomWebHeader> {
  int _hoveredIndex = -1;
  int _activeIndex = 0;

  // ✅ getter بيتقرأ كل مرة build بيحصل — فبيتحدث مع اللغة
  List<String> get _navItems => [
    S.of(context).home_tab,
    S.of(context).places_tab,
    S.of(context).rooms_tab,
    S.of(context).services_tab,
    S.of(context).about_us_tab,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
          HeaderLogo(),
          const SizedBox(width: 32),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              spacing: 0,
              runSpacing: 4,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
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
          LanguageToggle(),
          const SizedBox(width: 20),
          ContactNowButton(),
        ],
      ),
    );
  }
}
