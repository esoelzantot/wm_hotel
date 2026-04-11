import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/functions/lanuch_whatsApp.dart';
import 'package:wm_hotel/core/functions/launch_email.dart';
import 'package:wm_hotel/core/functions/launch_url.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/core/widgets/footer/footer_col_title.dart';
import 'package:wm_hotel/features/home/data/content/contact_us_data.dart';
import 'package:wm_hotel/features/home/data/entities/contact_us_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class FooterContactColumn extends StatelessWidget {
  const FooterContactColumn({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUsEntity contact = contactData;
    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        // ── Resolve current locale ─────────────
        final String langCode = state is ChangeLocalState
            ? state.locale.languageCode
            : Localizations.localeOf(context).languageCode;

        final String displayAddress = langCode == 'ar'
            ? contact.address.arAddress
            : contact.address.enAddress;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FooterColTitle(label: S.of(context).footer_contact_us_column),
            const SizedBox(height: 8),

            // ── Address ───────────────────────
            _ContactItem(
              icon: Icons.location_on_outlined,
              text: displayAddress,
              onPressed: () => launchUrlFunc(contact.map),
            ),
            const SizedBox(height: 20),

            // ── Phone ─────────────────────────
            _ContactItem(
              icon: Icons.phone_outlined,
              text: contact.phone,
              onPressed: () => openWhatsApp(
                context: context,
                content: "مرحباً",
                phone: contact.phone,
              ),
            ),
            const SizedBox(height: 20),

            // ── Email ─────────────────────────
            _ContactItem(
              icon: Icons.mail_outline_rounded,
              text: contact.email,
              onPressed: () async {
                if (kIsWeb) {
                  await sendEmail(
                    email: "islamelzantot@gmail.com",
                    subject: "مرحباً",
                    body: "احتاج الى مساعدة",
                  );
                } else {
                  await launchEmail(
                    email: "islamelzantot@gmail.com",
                    subject: "مرحباً",
                    body: "احتاج الى مساعدة",
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
//  Contact Row: icon + text
// ─────────────────────────────────────────────

class _ContactItem extends StatefulWidget {
  const _ContactItem({required this.icon, required this.text, this.onPressed});

  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 20, color: AppColors.primaryColor),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                widget.text,
                style: AppStyles.styleMedium20(context).copyWith(
                  color: _hovered && widget.onPressed != null
                      ? AppColors.primaryColor
                      : AppColors.subTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
