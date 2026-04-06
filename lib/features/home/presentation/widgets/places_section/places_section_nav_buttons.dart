import 'package:flutter/material.dart';

class PlacesSectionNavButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool canGoPrevious;
  final bool canGoNext;

  const PlacesSectionNavButtons({
    super.key,
    required this.onPrevious,
    required this.onNext,
    this.canGoPrevious = true,
    this.canGoNext = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: canGoPrevious ? onPrevious : null,
          isEnabled: canGoPrevious,
        ),
        const SizedBox(width: 10),
        _NavButton(
          icon: Icons.arrow_forward_ios_rounded,
          onTap: canGoNext ? onNext : null,
          isEnabled: canGoNext,
        ),
      ],
    );
  }
}

class _NavButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isEnabled;

  const _NavButton({
    required this.icon,
    required this.onTap,
    required this.isEnabled,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered && widget.isEnabled ? Colors.black : Colors.white,
            border: Border.all(
              color: widget.isEnabled
                  ? Colors.grey.shade300
                  : Colors.grey.shade200,
              width: 1.5,
            ),
            boxShadow: _isHovered && widget.isEnabled
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Icon(
            widget.icon,
            size: 14,
            color: _isHovered && widget.isEnabled
                ? Colors.white
                : widget.isEnabled
                ? Colors.black87
                : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
