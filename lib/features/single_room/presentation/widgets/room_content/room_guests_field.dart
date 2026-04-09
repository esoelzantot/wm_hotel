import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class RoomGuestsField extends StatelessWidget {
  final int guests;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const RoomGuestsField({
    super.key,
    required this.guests,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1.5),
      ),
      child: Row(
        children: [
          _GuestButton(
            icon: Icons.remove_rounded,
            onTap: onDecrement,
            enabled: guests > 1,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).guests_label,
                  style: AppStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Colors.grey.shade500),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      size: 15,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$guests ${guests == 1 ? S.of(context).person_label : S.of(context).people_label}',
                      style: AppStyles.styleBold18(
                        context,
                      ).copyWith(color: Color(0xFF1A1A2E)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _GuestButton(
            icon: Icons.add_rounded,
            onTap: onIncrement,
            enabled: true,
          ),
        ],
      ),
    );
  }
}

class _GuestButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;

  const _GuestButton({
    required this.icon,
    required this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: enabled
              ? const Color(0xFF1A56DB).withOpacity(0.1)
              : const Color(0xFFF0F0F0),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? const Color(0xFF1A56DB) : Colors.grey.shade400,
        ),
      ),
    );
  }
}
