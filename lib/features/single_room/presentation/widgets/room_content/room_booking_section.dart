import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/single_room/presentation/widgets/room_content/room_book_button.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/breakdown_placeholder.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/guests_field.dart';
import 'package:wm_hotel/generated/l10n.dart';

import 'room_breakdown_content.dart';

class RoomBookingSection extends StatefulWidget {
  final num pricePerNight;
  final num serviceFee;

  final RoomEntity room;

  const RoomBookingSection({
    super.key,
    required this.pricePerNight,
    required this.serviceFee,
    required this.room,
  });

  @override
  State<RoomBookingSection> createState() => _RoomBookingSectionState();
}

class _RoomBookingSectionState extends State<RoomBookingSection>
    with SingleTickerProviderStateMixin {
  DateTime? _fromDate;
  DateTime? _toDate;
  int _guests = 2;
  int _rooms = 1;

  late AnimationController _buttonController;

  // ── Computed ─────────────────────────────────
  int get _totalNights {
    if (_fromDate == null || _toDate == null) return 0;
    final diff = _toDate!.difference(_fromDate!).inDays;
    return diff > 0 ? diff : 0;
  }

  num get _nightsTotal => _totalNights * widget.pricePerNight * _rooms;

  num get _grandTotal =>
      _nightsTotal > 0 ? _nightsTotal + widget.serviceFee : 0;

  bool get _canBook => _fromDate != null && _toDate != null && _totalNights > 0;

  // ── Formatters ────────────────────────────────
  String _formatNights(int n) =>
      '$n ${n == 1 ? S.of(context).night_label : S.of(context).nights_label}';

  String _formatPrice(num v) {
    final s = v.toInt().toString();
    return s.length > 3
        ? '${s.substring(0, s.length - 3)},${s.substring(s.length - 3)}'
        : s;
  }

  String _formatDate(DateTime d) {
    // ── نقرأ اللغة الحالية من LocalCubit ──────────
    final locale = context.watch<LocalCubit>().state is ChangeLocalState
        ? (context.read<LocalCubit>().state as ChangeLocalState).locale
        : const Locale('ar');

    final isAr = locale.languageCode == 'ar';

    // ── Arabic ─────────────────────────────────────
    const arMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'إبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    const arDays = [
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد',
    ];

    // ── English ────────────────────────────────────
    const enMonths = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    const enDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    if (isAr) {
      final dayName = arDays[d.weekday - 1];
      return '$dayName، ${d.day} ${arMonths[d.month - 1]}';
    } else {
      final dayName = enDays[d.weekday - 1];
      return '$dayName, ${enMonths[d.month - 1]} ${d.day}';
    }
  }

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  // ── helper خاص بالـ locale ────────────────────
  Locale get _currentLocale {
    final state = context.read<LocalCubit>().state;
    return state is ChangeLocalState ? state.locale : const Locale('ar');
  }

  // ── Pick date ─────────────────────────────────
  Future<void> _pickDate({required bool isFrom}) async {
    final now = DateTime.now();
    final locale = _currentLocale;
    final isRtl = locale.languageCode == 'ar';

    final picked = await showDatePicker(
      context: context,
      initialDate: isFrom
          ? (_fromDate ?? now)
          : (_toDate ?? (_fromDate?.add(const Duration(days: 1)) ?? now)),
      firstDate: isFrom
          ? now
          : (_fromDate?.add(const Duration(days: 1)) ?? now),
      lastDate: now.add(const Duration(days: 365)),
      locale: locale, // ← ديناميكي
      builder: (ctx, child) => Directionality(
        textDirection:
            isRtl // ← ديناميكي
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Theme(
          data: Theme.of(ctx).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1A56DB),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF1A1A2E),
            ),
            dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1A56DB),
              ),
            ),
          ),
          child: child!,
        ),
      ),
    );

    if (picked != null && mounted) {
      HapticFeedback.lightImpact();
      setState(() {
        if (isFrom) {
          _fromDate = picked;
          if (_toDate != null && !_toDate!.isAfter(picked)) _toDate = null;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  void _showSnackBar({required IconData icon, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Text(message, style: const TextStyle(fontFamily: 'Cairo')),
          ],
        ),
        backgroundColor: const Color(0xFF1A56DB),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _changeGuests(int delta) {
    HapticFeedback.selectionClick();
    setState(() => _guests = (_guests + delta).clamp(1, 99));
  }

  void _changeRooms(int delta) {
    HapticFeedback.selectionClick();
    setState(() => _rooms = (_rooms + delta).clamp(1, 99));
  }

  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A56DB).withValues(alpha: 0.07),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. تاريخ الوصول والمغادرة
                Row(
                  children: [
                    Expanded(
                      child: _buildDateField(
                        isFrom: true,
                        label: S.of(context).check_in_label, // تاريخ الوصول
                        hint: S.of(context).select_date_label,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDateField(
                        isFrom: false,
                        label: S.of(context).check_out_label, // تاريخ المغادرة
                        hint: S.of(context).select_date_label,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // 2. عدد الضيوف
                GuestsField(
                  guests: _guests,
                  onIncrement: () => _changeGuests(1),
                  onDecrement: () => _changeGuests(-1),
                ),
                const SizedBox(height: 12),

                // 3. عدد الغرف  ← جديد
                _buildRoomsField(),
                const SizedBox(height: 20),

                // 4. تفاصيل السعر
                _buildPriceBreakdown(),
                const SizedBox(height: 20),

                // 5. زر الحجز
                RoomBookButton(canBook: _canBook, room: widget.room),
                const SizedBox(height: 12),

                Text(
                  S.of(context).breakdown_guest_info,
                  style: AppStyles.styleMedium14(
                    context,
                  ).copyWith(color: Colors.grey.shade400),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).price_label,
                style: AppStyles.styleSemiBold18(
                  context,
                ).copyWith(color: Colors.grey.shade500),
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    _formatPrice(widget.pricePerNight),
                    style: AppStyles.styleBold36(
                      context,
                    ).copyWith(fontSize: 40, color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    S.of(context).currency_symbol,
                    style: AppStyles.styleSemiBold24(context),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              S.of(context).room_price_quote,
              style: AppStyles.styleSemiBold16(
                context,
              ).copyWith(color: Color(0xFF1A56DB)),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Date field — من / إلى
  // ─────────────────────────────────────────────
  Widget _buildDateField({
    required bool isFrom,
    required String label,
    required String hint,
  }) {
    final date = isFrom ? _fromDate : _toDate;
    final hasValue = date != null;
    // حقل "إلى" يبان disabled لو مفيش "من"
    final isEnabled = isFrom ? true : _fromDate != null;

    return GestureDetector(
      onTap: () => _pickDate(isFrom: isFrom),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: !isEnabled
              ? const Color(0xFFF3F4F6)
              : hasValue
              ? const Color(0xFFEEF2FF)
              : const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: !isEnabled
                ? const Color(0xFFE8E8E8)
                : hasValue
                ? const Color(0xFF1A56DB).withValues(alpha: 0.3)
                : const Color(0xFFE8E8E8),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان
            Text(
              label,
              style: AppStyles.styleSemiBold14(context).copyWith(
                color: !isEnabled
                    ? Colors.grey.shade300
                    : hasValue
                    ? const Color(0xFF1A56DB)
                    : Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: 16,
                  color: !isEnabled
                      ? Colors.grey.shade300
                      : hasValue
                      ? const Color(0xFF1A56DB)
                      : Colors.grey.shade400,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    hasValue ? '${date.day}/${date.month}/${date.year}' : hint,
                    style: AppStyles.styleBold18(context).copyWith(
                      fontSize: 14,
                      color: !isEnabled
                          ? Colors.grey.shade300
                          : hasValue
                          ? const Color(0xFF1A1A2E)
                          : Colors.grey.shade400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            // عرض اسم اليوم تحت التاريخ لو في قيمة
            if (hasValue) ...[
              const SizedBox(height: 2),
              Text(
                _formatDate(date),
                style: AppStyles.styleMedium14(
                  context,
                ).copyWith(fontSize: 11, color: Colors.grey.shade500),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Rooms field  ← جديد، نفس ستايل GuestsField
  // ─────────────────────────────────────────────
  Widget _buildRoomsField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1.5),
      ),
      child: Row(
        children: [
          // أيقونة
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.bed_rounded,
              size: 18,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(width: 12),

          // نص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).rooms_label, // عدد الغرف
                  style: AppStyles.styleSemiBold14(
                    context,
                  ).copyWith(color: Colors.grey.shade500),
                ),
                Text(
                  '$_rooms ${_rooms == 1 ? S.of(context).room_label : S.of(context).rooms_count_label}',
                  style: AppStyles.styleBold18(
                    context,
                  ).copyWith(color: const Color(0xFF1A1A2E)),
                ),
              ],
            ),
          ),

          // أزرار ±
          _CounterButton(
            icon: Icons.remove,
            onTap: _rooms > 1 ? () => _changeRooms(-1) : null,
          ),
          const SizedBox(width: 8),
          Text(
            '$_rooms',
            style: AppStyles.styleBold18(
              context,
            ).copyWith(color: const Color(0xFF1A1A2E)),
          ),
          const SizedBox(width: 8),
          _CounterButton(icon: Icons.add, onTap: () => _changeRooms(1)),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  Widget _buildPriceBreakdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 280),
        sizeCurve: Curves.easeInOutCubic,
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeOut,
        crossFadeState: _totalNights > 0
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: const BreakdownPlaceholder(),
        secondChild: _totalNights > 0
            ? RoomBreakdownContent(
                key: ValueKey(
                  '${_fromDate?.day}${_fromDate?.month}'
                  '_${_toDate?.day}${_toDate?.month}'
                  '_${_rooms}_$_guests',
                ),
                fromDateLabel: _fromDate != null ? _formatDate(_fromDate!) : '',
                toDateLabel: _toDate != null ? _formatDate(_toDate!) : '',
                nightsLabel:
                    '${_formatPrice(widget.pricePerNight)} × '
                    '${_formatNights(_totalNights)} × '
                    '$_rooms ${_rooms == 1 ? S.of(context).room_label : S.of(context).rooms_count_label}',
                nightsValue:
                    '${_formatPrice(_nightsTotal)} ${S.of(context).currency_symbol}',
                feeValue:
                    '${_formatPrice(widget.serviceFee)} ${S.of(context).currency_symbol}',
                totalValue:
                    '${_formatPrice(_grandTotal)} ${S.of(context).currency_symbol}',
                durationLabel:
                    '${S.of(context).period_label}: ${_formatNights(_totalNights)}',
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Counter button مشترك
// ─────────────────────────────────────────────
class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CounterButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final active = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFF1A56DB).withValues(alpha: 0.08)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active
                ? const Color(0xFF1A56DB).withValues(alpha: 0.2)
                : Colors.grey.shade200,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: active ? const Color(0xFF1A56DB) : Colors.grey.shade300,
        ),
      ),
    );
  }
}
