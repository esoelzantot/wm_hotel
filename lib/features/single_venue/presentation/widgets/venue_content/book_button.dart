import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';
import 'package:wm_hotel/generated/l10n.dart';

class BookButton extends StatefulWidget {
  final bool canBook;
  final VenueEntity venue;
  final DateTime? selectedDate;
  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final double totalHours;
  final double hoursTotal;
  final double grandTotal;

  const BookButton({
    super.key,
    required this.canBook,
    required this.venue,
    this.selectedDate,
    this.fromTime,
    this.toTime,
    this.totalHours = 0,
    this.hoursTotal = 0,
    this.grandTotal = 0,
  });

  @override
  State<BookButton> createState() => _BookButtonState();
}

class _BookButtonState extends State<BookButton>
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

  void _onTap() {
    Logger().i(
      "DAY ${widget.selectedDate} || FROM ${widget.fromTime} || TO ${widget.toTime} "
      "|| TOTAL HOURS ${widget.totalHours} || HOURS TOTAL ${widget.hoursTotal} "
      "|| GRAND TOTAL ${widget.grandTotal}",
    );
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
                      color: const Color(0xFF1A56DB).withOpacity(0.35),
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
