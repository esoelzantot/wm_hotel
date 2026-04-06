import 'package:flutter/material.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';

class CustomAnimatedButton extends StatefulWidget {
  final VoidCallback? onTap;

  final String title;
  final Color? textColor;

  final Color backgroundColor;

  final int fontSize;

  const CustomAnimatedButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.backgroundColor,
    this.textColor,
    this.fontSize = 18,
  });

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.backgroundColor.withValues(alpha: 0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: AppStyles.styleSemiBold18(context).copyWith(
                    color: (widget.textColor == null)
                        ? _hovered
                              ? const Color(0xFFFF8C00)
                              : const Color(0xFFFF6B00)
                        : widget.textColor,
                    letterSpacing: _hovered ? 0.5 : 0,
                    fontSize: widget.fontSize.toDouble(),
                  ),
                  child: Text(widget.title),
                ),
                const SizedBox(width: 2),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  offset: _hovered ? const Offset(-0.1, 0) : Offset.zero,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: _hovered ? 1.0 : 0.7,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFFF6B00),
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
