import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/widgets/footer/copyright_bar.dart';
import 'package:wm_hotel/core/widgets/footer/footer_brand_column.dart';
import 'package:wm_hotel/core/widgets/footer/footer_contact_column.dart';
import 'package:wm_hotel/core/widgets/footer/footer_links_column.dart';

class CustomHorizontalFooter extends StatelessWidget {
  const CustomHorizontalFooter({super.key});

  // ── Nav Links ──────────────────────────────
  static const List<String> _navLinks = [
    'الرئيسية',
    'الضيافة',
    'الغرف',
    'خدماتنا',
    'من نحن',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(48, 60, 48, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Main Three-Column Row ─────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1 · Brand Column
              Expanded(flex: 3, child: FooterBrandColumn()),
              const SizedBox(width: 48),
              // 2 · Quick Links Column
              Expanded(flex: 1, child: FooterLinksColumn()),
              const SizedBox(width: 48),
              // 3 · Contact Column
              Expanded(flex: 2, child: FooterContactColumn()),
            ],
          ),

          const SizedBox(height: 12),

          // ── Divider ───────────────────────
          const Divider(color: AppColors.divider, thickness: 0.5),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: CopyrightBar()),
        ],
      ),
    );
  }
}
