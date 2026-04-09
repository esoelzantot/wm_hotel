import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class BreakdownContent extends StatefulWidget {
  final String dateLabel;
  final String hoursLabel;
  final String hoursValue;
  final String feeValue;
  final String totalValue;
  final String durationLabel;

  const BreakdownContent({
    super.key,
    required this.dateLabel,
    required this.hoursLabel,
    required this.hoursValue,
    required this.feeValue,
    required this.totalValue,
    required this.durationLabel,
  });

  @override
  State<BreakdownContent> createState() => _BreakdownContentState();
}

class _BreakdownContentState extends State<BreakdownContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Duration pill ─────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A56DB), Color(0xFF2B6EFF)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.durationLabel,
                    style: AppStyles.styleBold18(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ── اليوم المختار ─────────────────────
            if (widget.dateLabel.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 18,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.dateLabel,
                      style: AppStyles.styleMedium18(
                        context,
                      ).copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 10),

            // ── السعر × الساعات × الضيوف ──────────
            _PriceRow(
              label: widget.hoursLabel,
              value: widget.hoursValue,
              isSubtle: true,
            ),
            const SizedBox(height: 8),

            // ── رسوم الخدمة ───────────────────────
            _PriceRow(
              label: S.of(context).fee_label,
              value: widget.feeValue,
              isSubtle: true,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 1, color: Color(0xFFE8E8E8)),
            ),

            // ── الإجمالي ──────────────────────────
            _PriceRow(
              label: S.of(context).total_label,
              value: widget.totalValue,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  final bool isSubtle;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isTotal = false,
    this.isSubtle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: AppStyles.styleSemiBold16(context).copyWith(
              fontSize: isTotal ? 20 : 16,
              color: isTotal
                  ? const Color(0xFF1A1A2E)
                  : isSubtle
                  ? Colors.grey.shade600
                  : const Color(0xFF1A1A2E),
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: AppStyles.styleSemiBold18(context).copyWith(
            fontSize: isTotal ? 24 : 18,
            color: isTotal ? const Color(0xFF1A56DB) : const Color(0xFF1A1A2E),
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
