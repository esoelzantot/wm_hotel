import 'package:flutter/material.dart';
import 'package:wm_hotel/core/constants/design_constants.dart';
import 'package:wm_hotel/core/widgets/header/header_logo.dart';

class CustomMobileHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;

  const CustomMobileHeader({super.key, this.onMenuTap});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffc2c2c2).withAlpha(25),
        borderRadius: BorderRadius.circular(
          DesignConstants.defaultBorderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            /// ── Drawer Icon Button ──
            GestureDetector(
              onTap: onMenuTap, // ✅ بدل Scaffold.of(context).openDrawer()
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),

            const Spacer(),

            /// ── Logo Icon ──
            HeaderLogo(),
          ],
        ),
      ),
    );
  }
}
