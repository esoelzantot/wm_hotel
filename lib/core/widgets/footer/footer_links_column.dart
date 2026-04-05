import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/footer/footer_col_title.dart';
import 'package:wm_hotel/generated/l10n.dart';

class FooterLinksColumn extends StatefulWidget {
  const FooterLinksColumn({super.key});

  @override
  State<FooterLinksColumn> createState() => _FooterLinksColumnState();
}

class _FooterLinksColumnState extends State<FooterLinksColumn> {
  List<String> get _navLinks => [
    S.of(context).home_tab,
    S.of(context).places_tab,
    S.of(context).rooms_tab,
    S.of(context).services_tab,
    S.of(context).about_us_tab,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FooterColTitle(label: S.of(context).footer_quick_links_column),
        const SizedBox(height: 4),
        ..._navLinks.map((label) => _NavLinkItem(label: label)),
      ],
    );
  }
}

/// Animated quick-link row item
class _NavLinkItem extends StatefulWidget {
  const _NavLinkItem({required this.label});
  final String label;

  @override
  State<_NavLinkItem> createState() => _NavLinkItemState();
}

class _NavLinkItemState extends State<_NavLinkItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: AppStyles.styleSemiBold18(context).copyWith(
                  color: _hovered
                      ? AppColors.primaryColor
                      : AppColors.subTextColor,
                ),
              ),
              const SizedBox(width: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _hovered ? 6 : 0,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
