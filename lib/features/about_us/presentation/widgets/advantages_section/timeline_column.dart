import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';

class TimelineColumn extends StatelessWidget {
  final IconData icon;
  final bool isLast;
  final int stepNumber;

  const TimelineColumn({
    super.key,
    required this.icon,
    required this.isLast,
    required this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Icon Node ──────────────────────────────────────────────────
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor.withValues(alpha: 0.75),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.25),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 26),
        ),

        // ── Vertical dashed line ───────────────────────────────────────
        if (!isLast)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CustomPaint(
                painter: _DashedLinePainter(),
                child: const SizedBox(width: 2),
              ),
            ),
          ),

        if (!isLast) const SizedBox(height: 8),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashHeight = 6.0;
    const dashSpace = 4.0;
    final paint = Paint()
      ..color = AppColors.secondaryColor.withValues(alpha: 0.4)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, (startY + dashHeight).clamp(0, size.height)),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
