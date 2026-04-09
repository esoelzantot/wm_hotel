import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/book_button.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/breakdown_content.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/breakdown_placeholder.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/venue_content/guests_field.dart';
import 'package:wm_hotel/generated/l10n.dart';

// ─────────────────────────────────────────────
//  VenueBookingSection
// ─────────────────────────────────────────────
class VenueBookingSection extends StatefulWidget {
  final double pricePerHour;
  final double serviceFee;
  final VoidCallback onBook;

  const VenueBookingSection({
    super.key,
    required this.pricePerHour,
    required this.serviceFee,
    required this.onBook,
  });

  @override
  State<VenueBookingSection> createState() => _VenueBookingSectionState();
}

class _VenueBookingSectionState extends State<VenueBookingSection>
    with SingleTickerProviderStateMixin {
  DateTime? _selectedDate; // ✅ اليوم المختار
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;
  int _guests = 3;

  late AnimationController _buttonController;
  late Animation<double> _buttonScale;

  // ── Computed ─────────────────────────────────
  double get _totalHours {
    if (_fromTime == null || _toTime == null) return 0;
    final from = _fromTime!.hour * 60 + _fromTime!.minute;
    final to = _toTime!.hour * 60 + _toTime!.minute;
    final diff = to - from;
    return diff > 0 ? diff / 60.0 : 0;
  }

  double get _hoursTotal => _totalHours * widget.pricePerHour * _guests;

  double get _grandTotal =>
      _hoursTotal > 0 ? _hoursTotal + widget.serviceFee : 0;

  // ✅ الحجز يتطلب تحديد اليوم + الوقتين + الفرق موجب
  bool get _canBook =>
      _selectedDate != null &&
      _fromTime != null &&
      _toTime != null &&
      _totalHours > 0;

  // ── Formatters ────────────────────────────────
  String _formatTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  String _formatHours(double h) => h == h.truncateToDouble()
      ? '${h.toInt()} ${S.of(context).hour_label}'
      : '${h.toStringAsFixed(1)} ${S.of(context).hour_label}';

  String _formatPrice(double v) {
    final s = v.toInt().toString();
    return s.length > 3
        ? '${s.substring(0, s.length - 3)},${s.substring(s.length - 3)}'
        : s;
  }

  // ✅ تنسيق التاريخ بالعربي
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
    _buttonScale = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  // ── helper ────────────────────────────────────
  Locale get _currentLocale {
    final state = context.read<LocalCubit>().state;
    return state is ChangeLocalState ? state.locale : const Locale('ar');
  }

  // ── Pick date ─────────────────────────────────
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final locale = _currentLocale;
    final isRtl = locale.languageCode == 'ar';

    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: now,
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
      setState(() => _selectedDate = picked);
    }
  }

  // ── Pick time ─────────────────────────────────
  Future<void> _pickTime(bool isFrom) async {
    if (_selectedDate == null) {
      _showSelectDateFirst();
      return;
    }

    final isRtl =
        (context.read<LocalCubit>().state is ChangeLocalState
                ? (context.read<LocalCubit>().state as ChangeLocalState).locale
                : const Locale('ar'))
            .languageCode ==
        'ar';

    final initial = isFrom
        ? (_fromTime ?? const TimeOfDay(hour: 9, minute: 0))
        : (_toTime ?? const TimeOfDay(hour: 11, minute: 0));

    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          timePickerTheme: TimePickerThemeData(
            backgroundColor: Colors.white,
            hourMinuteColor: const Color(0xFF1A56DB).withOpacity(0.08),
            hourMinuteTextColor: const Color(0xFF1A56DB),
            dialHandColor: const Color(0xFF1A56DB),
            dialBackgroundColor: const Color(0xFFEEF2FF),
            entryModeIconColor: const Color(0xFF1A56DB),
            confirmButtonStyle: TextButton.styleFrom(
              foregroundColor: const Color(0xFF1A56DB),
            ),
            cancelButtonStyle: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null && mounted) {
      HapticFeedback.lightImpact();
      setState(() {
        if (isFrom)
          _fromTime = picked;
        else
          _toTime = picked;
      });
    }
  }

  // ✅ SnackBar يطلب من المستخدم اختيار اليوم أولاً
  void _showSelectDateFirst() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.calendar_today_rounded, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text(
              'من فضلك اختر اليوم أولاً',
              style: TextStyle(fontFamily: 'Cairo'),
            ),
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
            color: const Color(0xFF1A56DB).withOpacity(0.07),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
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
                // ✅ 1. اختيار اليوم
                _buildDateField(),
                const SizedBox(height: 12),

                // ✅ 2. اختيار الوقت (من - إلى)
                Row(
                  children: [
                    Expanded(
                      child: _buildTimeField(
                        isFrom: true,
                        label: S.of(context).from_label,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTimeField(
                        isFrom: false,
                        label: S.of(context).to_label,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // 3. عدد الضيوف
                GuestsField(
                  guests: _guests,
                  onIncrement: () => _changeGuests(1),
                  onDecrement: () => _changeGuests(-1),
                ),
                const SizedBox(height: 20),

                // 4. تفاصيل السعر
                _buildPriceBreakdown(),
                const SizedBox(height: 20),

                // 5. زر الحجز
                BookButton(canBook: _canBook, onBook: widget.onBook),
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
                    _formatPrice(widget.pricePerHour),
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
              S.of(context).price_quote,
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
  // ✅ Date field — نفس ستايل الـ time fields
  // ─────────────────────────────────────────────
  Widget _buildDateField() {
    final hasValue = _selectedDate != null;

    return GestureDetector(
      onTap: _pickDate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: hasValue ? const Color(0xFFEEF2FF) : const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasValue
                ? const Color(0xFF1A56DB).withOpacity(0.3)
                : const Color(0xFFE8E8E8),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // أيقونة التقويم
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: hasValue
                    ? const Color(0xFF1A56DB).withValues(alpha: 0.12)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.calendar_month_rounded,
                size: 18,
                color: hasValue
                    ? const Color(0xFF1A56DB)
                    : Colors.grey.shade400,
              ),
            ),
            const SizedBox(width: 12),

            // النص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).day_label,
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: hasValue
                          ? const Color(0xFF1A56DB)
                          : Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    hasValue
                        ? _formatDate(_selectedDate!)
                        : S.of(context).day_select_label,
                    style: AppStyles.styleBold18(context).copyWith(
                      color: hasValue
                          ? const Color(0xFF1A1A2E)
                          : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),

            // سهم
            Icon(
              Icons.chevron_left_rounded,
              size: 20,
              color: hasValue ? const Color(0xFF1A56DB) : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  Widget _buildTimeField({required bool isFrom, required String label}) {
    final time = isFrom ? _fromTime : _toTime;
    final hasValue = time != null;
    // ✅ الـ time fields تبان disabled لو مفيش تاريخ
    final isEnabled = _selectedDate != null;

    return GestureDetector(
      onTap: () => _pickTime(isFrom),
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
                  Icons.access_time_rounded,
                  size: 16,
                  color: !isEnabled
                      ? Colors.grey.shade300
                      : hasValue
                      ? const Color(0xFF1A56DB)
                      : Colors.grey.shade400,
                ),
                const SizedBox(width: 6),
                Text(
                  hasValue ? _formatTime(time!) : '--:--',
                  style: AppStyles.styleBold18(context).copyWith(
                    color: !isEnabled
                        ? Colors.grey.shade300
                        : hasValue
                        ? const Color(0xFF1A1A2E)
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ],
        ),
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
        crossFadeState: _totalHours > 0
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: const BreakdownPlaceholder(),
        secondChild: _totalHours > 0
            ? BreakdownContent(
                key: ValueKey(
                  '${_selectedDate?.day}${_selectedDate?.month}'
                  '_${_fromTime?.hour}${_fromTime?.minute}'
                  '_${_toTime?.hour}${_toTime?.minute}'
                  '_$_guests',
                ),
                dateLabel: _selectedDate != null
                    ? _formatDate(_selectedDate!)
                    : '',
                hoursLabel:
                    '${_formatPrice(widget.pricePerHour)} × '
                    '${_formatHours(_totalHours)} × '
                    '$_guests ${_guests == 1 ? S.of(context).person_label : S.of(context).people_label}',
                hoursValue:
                    '${_formatPrice(_hoursTotal)} ${S.of(context).currency_symbol}',
                feeValue:
                    '${_formatPrice(widget.serviceFee)} ${S.of(context).currency_symbol}',
                totalValue:
                    '${_formatPrice(_grandTotal)} ${S.of(context).currency_symbol}',
                durationLabel:
                    '${S.of(context).period_label}: ${_formatHours(_totalHours)}',
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
