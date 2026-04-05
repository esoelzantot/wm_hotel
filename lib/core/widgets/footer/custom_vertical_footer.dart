import 'package:flutter/material.dart';
import 'package:wm_hotel/core/widgets/footer/copyright_bar.dart';
import 'package:wm_hotel/core/widgets/footer/footer_brand_column.dart';
import 'package:wm_hotel/core/widgets/footer/footer_contact_column.dart';
import 'package:wm_hotel/core/widgets/footer/footer_links_column.dart';

class CustomVerticalFooter extends StatelessWidget {
  const CustomVerticalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // ── Top Nav Bar ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo + Brand
                FooterBrandColumn(),
                SizedBox(height: 12),

                // Quick Links
                FooterLinksColumn(),
                SizedBox(height: 12),

                // Contact Us
                FooterContactColumn(),
                SizedBox(height: 12),
              ],
            ),
          ),

          // ── Divider ──
          SizedBox(height: 10),
          Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffFFFFFF).withValues(alpha: 0.025),
          ),

          // ── Copyright Bar ──
          CopyrightBar(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
