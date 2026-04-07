import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/content/trust_data.dart';
import 'package:wm_hotel/features/home/data/entities/trust_entity.dart';
import 'package:wm_hotel/features/home/presentation/widgets/trust_Section/trust_item.dart';
import 'package:wm_hotel/generated/l10n.dart';

class WhyTrustSection extends StatefulWidget {
  const WhyTrustSection({super.key});

  @override
  State<WhyTrustSection> createState() => _WhyTrustSectionState();
}

class _WhyTrustSectionState extends State<WhyTrustSection> {
  List<TrustEntity> trustInfo = TrustData.trustInfo;

  bool isMobile = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    isMobile = width < SizeConfig.tablet;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Column(
        children: [
          Text(
            S.of(context).home_trust_section_title,
            style: AppStyles.styleSemiBold36(
              context,
            ).copyWith(color: AppColors.secondaryColor, fontSize: 48),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TrustItem(trust: trustInfo[0]),
                    _WavyConnector(flip: false),
                    TrustItem(trust: trustInfo[1]),
                    _WavyConnector(flip: true),
                    TrustItem(trust: trustInfo[2]),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: TrustItem(trust: trustInfo[0])),
                    _WavyConnector(flip: false),
                    Flexible(child: TrustItem(trust: trustInfo[1])),
                    _WavyConnector(flip: true),
                    Flexible(child: TrustItem(trust: trustInfo[2])),
                  ],
                ),
        ],
      ),
    );
  }
}

class _WavyConnector extends StatelessWidget {
  final bool flip;

  const _WavyConnector({required this.flip});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 72,
      child: CustomPaint(painter: _WavyLinePainter(flip: flip)),
    );
  }
}

class _WavyLinePainter extends CustomPainter {
  final bool flip;

  _WavyLinePainter({required this.flip});

  @override
  void paint(Canvas canvas, Size size) {
    final dashPaint = Paint()
      ..color = const Color(0xFFB5D4F4)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final dotPaint = Paint()
      ..color = const Color(0xFF2563EB)
      ..style = PaintingStyle.fill;

    final path = Path();

    final double y1 = flip ? size.height * 0.7 : size.height * 0.3;
    final double y2 = flip ? size.height * 0.3 : size.height * 0.7;

    path.moveTo(0, size.height * 0.5);
    path.cubicTo(
      size.width * 0.25,
      y1,
      size.width * 0.75,
      y2,
      size.width,
      size.height * 0.5,
    );

    _drawDashedPath(canvas, path, dashPaint);

    canvas.drawCircle(Offset(size.width - 3, size.height * 0.5), 3, dotPaint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      const dashLength = 4.0;
      const gapLength = 4.0;
      bool draw = true;

      while (distance < metric.length) {
        final segmentLength = draw ? dashLength : gapLength;
        final next = (distance + segmentLength).clamp(0.0, metric.length);
        if (draw) {
          canvas.drawPath(metric.extractPath(distance, next), paint);
        }
        distance = next;
        draw = !draw;
      }
    }
  }

  @override
  bool shouldRepaint(_WavyLinePainter oldDelegate) => oldDelegate.flip != flip;
}
