import 'dart:async';

import 'package:flutter/material.dart';

class GalleryCard extends StatefulWidget {
  final List<String> imageUrls;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const GalleryCard({
    super.key,
    required this.imageUrls,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> with WidgetsBindingObserver {
  static const int _multiplier = 10000;
  static const Duration _autoScrollInterval = Duration(seconds: 3);
  static const Duration _resumeDelay = Duration(seconds: 5);
  static const Duration _animationDuration = Duration(milliseconds: 420);

  late final PageController _loopController;
  late int _realIndex;
  bool _isAttached = false; // ✅ guard flag

  Timer? _autoScrollTimer;
  Timer? _resumeTimer;

  static const _fallbackColors = [
    Color(0xFFD4A574),
    Color(0xFF8BB5C5),
    Color(0xFFA8C5A0),
    Color(0xFFE8C5A0),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _realIndex = widget.currentIndex;

    final initialVirtualPage =
        _multiplier * widget.imageUrls.length + widget.currentIndex;

    _loopController = PageController(initialPage: initialVirtualPage);

    // ✅ نسجل إن الـ controller اتعلق بعد أول frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _isAttached = true;
        _startAutoScroll();
      }
    });
  }

  // ─── Auto Scroll ───────────────────────────

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(_autoScrollInterval, (_) => _next());
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  void _pauseAndResume() {
    _stopAutoScroll();
    _resumeTimer?.cancel();
    _resumeTimer = Timer(_resumeDelay, () {
      if (mounted && _isAttached) _startAutoScroll();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _stopAutoScroll();
    } else if (state == AppLifecycleState.resumed) {
      if (_isAttached) _startAutoScroll();
    }
  }

  // ─── Navigation ────────────────────────────

  /// ✅ Guard قبل أي animate call
  bool get _canAnimate => _isAttached && mounted && _loopController.hasClients;

  void _jumpToIndex(int targetReal) {
    if (!_canAnimate) return; // ✅ الحل الأساسي
    _pauseAndResume();

    final currentVirtual = _loopController.page?.round() ?? 0;
    final currentReal = currentVirtual % widget.imageUrls.length;
    final len = widget.imageUrls.length;
    int diff = targetReal - currentReal;
    if (diff > len ~/ 2) diff -= len;
    if (diff < -(len ~/ 2)) diff += len;

    _loopController.animateToPage(
      currentVirtual + diff,
      duration: _animationDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  void _prev() {
    if (!_canAnimate) return; // ✅
    _pauseAndResume();
    _loopController.previousPage(
      duration: _animationDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  void _next() {
    if (!_canAnimate) return; // ✅
    _loopController.nextPage(
      duration: _animationDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void didUpdateWidget(GalleryCard old) {
    super.didUpdateWidget(old);
    if (widget.currentIndex != old.currentIndex &&
        widget.currentIndex != _realIndex) {
      _jumpToIndex(widget.currentIndex);
    }
  }

  @override
  void dispose() {
    _isAttached = false; // ✅ أول حاجة في dispose
    _autoScrollTimer?.cancel();
    _resumeTimer?.cancel();
    _loopController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // ─── Build ─────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ── Decorative border card ──
        Positioned(
          right: -20,
          bottom: -20,
          left: 10,
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.18),
                width: 1.0,
              ),
            ),
          ),
        ),

        // ── Main card ──
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Stack(
              children: [
                // ── PageView ──
                GestureDetector(
                  onTapDown: (_) => _pauseAndResume(),
                  onHorizontalDragStart: (_) => _stopAutoScroll(),
                  onHorizontalDragEnd: (_) => _pauseAndResume(),
                  child: PageView.builder(
                    controller: _loopController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (virtualPage) {
                      final real = virtualPage % widget.imageUrls.length;
                      setState(() => _realIndex = real);
                      widget.onPageChanged(real);
                    },
                    itemBuilder: (context, virtualPage) {
                      final real = virtualPage % widget.imageUrls.length;
                      return _ImageTile(
                        url: widget.imageUrls[real],
                        fallbackColor:
                            _fallbackColors[real % _fallbackColors.length],
                      );
                    },
                  ),
                ),

                // ── Gradient overlay ──
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.45),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Arrows ──
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ArrowButton(
                        icon: Icons.chevron_left_rounded,
                        onTap: _prev,
                      ),
                      _ArrowButton(
                        icon: Icons.chevron_right_rounded,
                        onTap: _next,
                      ),
                    ],
                  ),
                ),

                // ── Dot indicators ──
                Positioned(
                  bottom: 14,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.imageUrls.length, (i) {
                      final isActive = i == _realIndex;
                      return GestureDetector(
                        onTap: () => _jumpToIndex(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 22 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.45),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  IMAGE TILE
// ─────────────────────────────────────────────
class _ImageTile extends StatelessWidget {
  final String url;
  final Color fallbackColor;

  const _ImageTile({required this.url, required this.fallbackColor});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      cacheWidth: 800,
      errorBuilder: (_, __, ___) => Container(
        color: fallbackColor,
        child: const Icon(
          Icons.image_outlined,
          color: Colors.white54,
          size: 48,
        ),
      ),
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return Container(
          color: fallbackColor,
          child: Center(
            child: CircularProgressIndicator(
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes!
                  : null,
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
//  ARROW BUTTON
// ─────────────────────────────────────────────
class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.30),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
