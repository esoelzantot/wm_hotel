import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wm_hotel/core/functions/lanuch_whatsApp.dart';
import 'package:wm_hotel/core/functions/launch_email.dart';
import 'package:wm_hotel/core/helpers/share_booking_dialog.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class RoomBookButton extends StatefulWidget {
  final bool canBook;
  final RoomEntity room;
  final DateTime? fromDate;
  final DateTime? toDate;
  final int totalNights;
  final num nightsTotal;
  final num grandTotal;

  final int guests;

  final int rooms;

  const RoomBookButton({
    super.key,
    required this.canBook,
    required this.room,
    required this.fromDate,
    required this.toDate,
    required this.totalNights,
    required this.nightsTotal,
    required this.grandTotal,
    required this.guests,
    required this.rooms,
  });

  @override
  State<RoomBookButton> createState() => _RoomBookButtonState();
}

class _RoomBookButtonState extends State<RoomBookButton>
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
    required DateTime? fromDay,
    required DateTime? toDay,
    required int totalNights,
    required num nightsTotalCost,
    required num grandTotal,
    required int guestsCount,
    required int roomsCount,
    required num pricePerNight,
    required String roomName,
  }) {
    final from = "${fromDay!.year}-${_pad(fromDay.month)}-${_pad(fromDay.day)}";
    final to = "${toDay!.year}-${_pad(toDay.month)}-${_pad(toDay.day)}";
    final serviceFee = grandTotal - nightsTotalCost;

    return """
━━━━━━━━━━━━━━━━━━━━━━
        تأكيد الحجز ✅
━━━━━━━━━━━━━━━━━━━━━━

🏢 الغرفة : $roomName

🕐 من يوم : $from
🕑 إلى يوم : $to
⏱ إجمالي الليالي : $totalNights ليالي
👥 عدد الضيوف : $guestsCount ضيوف

━━━━━━━━━━━━━━━━━━━━━━
        تفاصيل التكلفة
━━━━━━━━━━━━━━━━━━━━━━

💰 تكلفة الليلة للضيف : ${pricePerNight.toStringAsFixed(0)} ر.س
💰 تكلفة الليالي : ${nightsTotalCost.toStringAsFixed(0)} ر.س
🔧 رسوم الخدمة : ${serviceFee.toStringAsFixed(0)} ر.س
                  ──────────
💵 الإجمالي الكلي : ${grandTotal.toStringAsFixed(0)} ر.س

━━━━━━━━━━━━━━━━━━━━━━
شكراً لحجزك معنا 🙏
نتطلع لاستقبالك!
━━━━━━━━━━━━━━━━━━━━━━
""";
  }

  String _pad(int n) => n.toString().padLeft(2, '0');

  void _onTap() async {
    final message = generateBookingConfirmationMessage(
      fromDay: widget.fromDate,
      toDay: widget.toDate,
      totalNights: widget.totalNights,
      nightsTotalCost: widget.nightsTotal,
      grandTotal: widget.grandTotal,
      guestsCount: widget.guests,
      roomsCount: widget.rooms,
      pricePerNight: widget.room.price,
      roomName: widget.room.name.arName,
    );

    final ShareMethod? method = await showDialog<ShareMethod>(
      context: context,
      builder: (_) => const ShareBookingDialog(),
    );

    if (method == null || !mounted) return;

    switch (method) {
      case ShareMethod.whatsapp:
        openWhatsApp(
          context: context,
          phone: "+201152704324",
          content: message,
        );
        break;
      case ShareMethod.email:
        if (kIsWeb) {
          await sendEmail(
            email: "islamelzantot@gmail.com",
            subject: "مشاركة تأكيد الحجز",
            body: message,
          );
        } else {
          await launchEmail(
            email: "islamelzantot@gmail.com",
            subject: "مشاركة تأكيد الحجز",
            body: message,
          );
        }
    }
  }

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
}
