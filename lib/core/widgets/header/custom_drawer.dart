import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wm_hotel/core/routing/end_points.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/buttons/custom_elevated_button.dart';
import 'package:wm_hotel/core/widgets/header/language_toggle.dart';

class CustomDrawer extends StatefulWidget {
  final VoidCallback? onClose;

  const CustomDrawer({super.key, this.onClose});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final Set<String> _expanded = {};

  final List<_DrawerItem> _items = const [
    _DrawerItem(label: 'الرئيسية', icon: Icons.home_rounded, hasArrow: false),
    _DrawerItem(
      label: 'الضيافة',
      icon: Icons.restaurant_menu_rounded,
      hasArrow: false,
    ),
    _DrawerItem(label: 'الغرف', icon: Icons.bed_rounded, hasArrow: false),
    _DrawerItem(
      label: 'خدماتنا',
      icon: Icons.room_service_rounded,
      hasArrow: false,
    ),
    _DrawerItem(
      label: 'من نحن',
      icon: Icons.info_outline_rounded,
      hasArrow: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ── Drawer Header ──
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Row(
              children: [
                /// Logo + Brand
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'White Moon',
                        style: AppStyles.styleBold30(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                    Text(
                      'Hotel',
                      style: AppStyles.styleSemiBold20(
                        context,
                      ).copyWith(color: AppColors.subTextColor),
                    ),
                  ],
                ),

                const Spacer(),

                /// Close Button
                GestureDetector(
                  onTap: widget.onClose,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// ── Nav Items ──
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final isExpanded = _expanded.contains(item.label);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      _handleNavigation(index);
                      if (item.hasArrow) {
                        setState(() {
                          isExpanded
                              ? _expanded.remove(item.label)
                              : _expanded.add(item.label);
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Color(0xFF007BFF).withAlpha(25),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          /// Icon Box
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.75,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              item.icon,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),

                          const SizedBox(width: 14),

                          /// Label
                          Text(
                            item.label,
                            style: AppStyles.styleSemiBold20(context),
                          ),

                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                onPress: () {},
                title: "تواصل الأن",
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
              const SizedBox(width: 10),

              LanguageToggle(),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ── Navigation Handle ───────────────────────────────────────────────────────────────
  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).push(EndPoints.homeView);
        break;
      // case 1:
      //   GoRouter.of(context).push(EndPoints.askyView);
      //   break;
      // case 2:
      //   GoRouter.of(context).push(EndPoints.articlesView);
      //   break;
      // case 3:
      //   GoRouter.of(context).push(EndPoints.libraryView);
      //   break;
      default:
    }
  }
}

/// ─────────────────────────────────────────
///  Drawer Item Model
/// ─────────────────────────────────────────

class _DrawerItem {
  final String label;
  final IconData icon;
  final bool hasArrow;

  const _DrawerItem({
    required this.label,
    required this.icon,
    required this.hasArrow,
  });
}
