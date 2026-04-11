// share_booking_dialog.dart

import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

enum ShareMethod { whatsapp, email }

class ShareBookingDialog extends StatefulWidget {
  const ShareBookingDialog({super.key});

  @override
  State<ShareBookingDialog> createState() => _ShareBookingDialogState();
}

class _ShareBookingDialogState extends State<ShareBookingDialog> {
  ShareMethod _selected = ShareMethod.whatsapp;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxWidth: 500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildOption(
              method: ShareMethod.whatsapp,
              icon: Icons.chat_rounded,
              iconBg: const Color(0xFF25D366),
              iconColor: Colors.white,
              title: 'WhatsApp',
              subtitle: S.of(context).share_booking_dialog_whatsapp_option,
              selectedBorder: const Color(0xFF25D366),
              selectedBg: const Color(0xFFF0FDF4),
            ),
            const SizedBox(height: 10),
            _buildOption(
              method: ShareMethod.email,
              icon: Icons.email_outlined,
              iconBg: const Color(0xFFE6F1FB),
              iconColor: const Color(0xFF185FA5),
              title: 'Email',
              subtitle: S.of(context).share_booking_dialog_email_option,
              selectedBorder: const Color(0xFF378ADD),
              selectedBg: const Color(0xFFE6F1FB),
            ),
            const SizedBox(height: 20),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE1F5EE),
          ),
          child: const Icon(
            Icons.send_rounded,
            color: Color(0xFF0F6E56),
            size: 24,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          S.of(context).share_booking_dialog_title,
          style: AppStyles.styleBold22(context),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).share_booking_dialog_subtitle,
          style: AppStyles.styleMedium20(
            context,
          ).copyWith(color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Widget _buildOption({
    required ShareMethod method,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color selectedBorder,
    required Color selectedBg,
  }) {
    final isSelected = _selected == method;

    return GestureDetector(
      onTap: () => setState(() => _selected = method),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? selectedBorder : Colors.grey.shade200,
            width: isSelected ? 2 : 0.8,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(shape: BoxShape.circle, color: iconBg),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.styleSemiBold18(context)),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? selectedBorder : Colors.transparent,
                border: Border.all(
                  color: isSelected ? selectedBorder : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 12)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Text(
              S.of(context).share_booking_dialog_cancel_button,
              style: AppStyles.styleSemiBold20(
                context,
              ).copyWith(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context, _selected),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor.withValues(alpha: 0.8),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Text(
              S.of(context).share_booking_dialog_send_button,
              style: AppStyles.styleSemiBold20(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
