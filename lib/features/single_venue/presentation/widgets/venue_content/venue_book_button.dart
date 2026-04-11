import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wm_hotel/core/functions/lanuch_whatsApp.dart';
import 'package:wm_hotel/core/functions/launch_email.dart';
import 'package:wm_hotel/core/helpers/share_booking_dialog.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/content/contact_us_data.dart';
import 'package:wm_hotel/features/home/data/entities/contact_us_entity.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class VenueBookButton extends StatefulWidget {
  final bool canBook;
  final VenueEntity venue;
  final DateTime? selectedDate;
  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final double totalHours;
  final double hoursTotal;
  final double grandTotal;

  final int guests;

  const VenueBookButton({
    super.key,
    required this.canBook,
    required this.venue,
    required this.guests,
    required this.selectedDate,
    required this.fromTime,
    required this.toTime,
    required this.totalHours,
    required this.hoursTotal,
    required this.grandTotal,
  });

  @override
  State<VenueBookButton> createState() => _VenueBookButtonState();
}

class _VenueBookButtonState extends State<VenueBookButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _buttonController;
  late final Animation<double> _buttonScale;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.05,
    );
    _buttonScale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  String generateBookingConfirmationMessage({
    required DateTime? bookingDay,
    required TimeOfDay? fromTime,
    required TimeOfDay? toTime,
    required int totalHours,
    required double hoursTotalCost,
    required double grandTotal,
    required int guestsCount,
    required String venueName,
    required num pricePerHour,
  }) {
    final day =
        "${bookingDay!.year}-${_pad(bookingDay.month)}-${_pad(bookingDay.day)}";
    final from = _formatTime(fromTime!);
    final to = _formatTime(toTime!);
    final serviceFee = grandTotal - hoursTotalCost;

    return """
━━━━━━━━━━━━━━━━━━━━━━
        تأكيد الحجز ✅
━━━━━━━━━━━━━━━━━━━━━━

🏢 المكان : $venueName

📅 يوم الحجز : $day
🕐 من الساعة : $from
🕑 إلى الساعة : $to
⏱ إجمالي الساعات : $totalHours ساعة
👥 عدد الضيوف : $guestsCount ضيوف

━━━━━━━━━━━━━━━━━━━━━━
        تفاصيل التكلفة
━━━━━━━━━━━━━━━━━━━━━━

💰 تكلفة الساعة للضيف : ${pricePerHour.toStringAsFixed(0)} ر.س
💰 تكلفة الساعات : ${hoursTotalCost.toStringAsFixed(0)} ر.س
🔧 رسوم الخدمة : ${serviceFee.toStringAsFixed(0)} ر.س
                  ──────────
💵 الإجمالي الكلي : ${grandTotal.toStringAsFixed(0)} ر.س

━━━━━━━━━━━━━━━━━━━━━━
شكراً لحجزك معنا 🙏
نتطلع لاستقبالك!
━━━━━━━━━━━━━━━━━━━━━━
""";
  }

  String _formatTime(TimeOfDay t) =>
      "${_pad(t.hour)}:${_pad(t.minute)} ${t.hour < 12 ? 'ص' : 'م'}";

  String _pad(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _buttonScale,
      child: GestureDetector(
        onTap: _onTap,
        onTapDown: (_) => _buttonController.forward(),
        onTapUp: (_) {
          _buttonController.reverse();
          if (widget.canBook) {
            HapticFeedback.mediumImpact();
          }
        },
        onTapCancel: () => _buttonController.reverse(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 54,
          decoration: BoxDecoration(
            gradient: widget.canBook
                ? const LinearGradient(
                    colors: [Color(0xFF1A56DB), Color(0xFF2B6EFF)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  )
                : null,
            color: widget.canBook ? null : const Color(0xFFCDD5E0),
            borderRadius: BorderRadius.circular(16),
            boxShadow: widget.canBook
                ? [
                    BoxShadow(
                      color: const Color(0xFF1A56DB).withValues(alpha: 0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            S.of(context).book_button,
            style: AppStyles.styleBold24(context).copyWith(
              color: widget.canBook ? Colors.white : Colors.grey.shade500,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() async {
    ContactUsEntity contact = contactData;

    final message = generateBookingConfirmationMessage(
      bookingDay: widget.selectedDate,
      fromTime: widget.fromTime,
      toTime: widget.toTime,
      totalHours: widget.totalHours.toInt(),
      hoursTotalCost: widget.hoursTotal,
      grandTotal: widget.grandTotal,
      guestsCount: widget.guests,
      venueName: widget.venue.name.arName,
      pricePerHour: widget.venue.price,
    );

    final ShareMethod? method = await showDialog<ShareMethod>(
      context: context,
      builder: (_) => const ShareBookingDialog(),
    );

    if (method == null || !mounted) return;

    switch (method) {
      case ShareMethod.whatsapp:
        openWhatsApp(context: context, phone: contact.phone, content: message);
        break;
      case ShareMethod.email:
        if (!kIsWeb) {
          await sendEmail(
            email: contact.email,
            subject: "مشاركة تأكيد الحجز",
            body: message,
          );
        } else {
          await launchEmail(
            email: contact.email,
            subject: "مشاركة تأكيد الحجز",
            body: message,
          );
        }
        break;
    }
  }
}
