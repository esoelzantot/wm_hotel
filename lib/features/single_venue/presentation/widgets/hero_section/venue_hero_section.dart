import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/hero_section/gallery_card.dart';
import 'package:wm_hotel/features/single_venue/presentation/widgets/hero_section/hero_text_content.dart';

// ─────────────────────────────────────────────
//  VENUE HERO SECTION
// ─────────────────────────────────────────────
class VenueHeroSection extends StatefulWidget {
  final List<String> imageUrls;

  const VenueHeroSection({
    super.key,
    this.imageUrls = const [
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
      'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
      'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
    ],
  });

  @override
  State<VenueHeroSection> createState() => _VenueHeroSectionState();
}

class _VenueHeroSectionState extends State<VenueHeroSection>
    with TickerProviderStateMixin {
  // ── gallery state ──
  int _currentIndex = 0;
  late final PageController _pageController;
  Timer? _autoplayTimer;

  // ── entrance animation ──
  late final AnimationController _entranceCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _entranceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(-0.06, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOut));

    _entranceCtrl.forward();

    // ✅ FIX: delay autoplay until after first frame so PageController
    //         is guaranteed to be attached to the PageView.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _startAutoplay();
    });
  }

  void _startAutoplay() {
    _autoplayTimer?.cancel();
    _autoplayTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      // ✅ FIX: guard with mounted + hasClients before calling animateToPage
      if (!mounted) return;
      if (!_pageController.hasClients) return;

      final next = (_currentIndex + 1) % widget.imageUrls.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    _autoplayTimer = null;
    _pageController.dispose();
    _entranceCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────
  //  BUILD
  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= SizeConfig.tablet;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 48 : 16,
            vertical: isWide ? 48 : 24,
          ),
          child: _WideLayout(
            fadeAnim: _fadeAnim,
            slideAnim: _slideAnim,
            imageUrls: widget.imageUrls,
            pageController: _pageController,
            currentIndex: _currentIndex,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            onDotTap: _goToPage,
          ),
        );
      },
    );
  }

  void _goToPage(int index) {
    // ✅ FIX: guard here too
    if (!_pageController.hasClients) return;

    _autoplayTimer?.cancel();
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _startAutoplay();
  }
}

// ─────────────────────────────────────────────
//  WIDE LAYOUT  (side-by-side)
// ─────────────────────────────────────────────
class _WideLayout extends StatefulWidget {
  final Animation<double> fadeAnim;
  final Animation<Offset> slideAnim;
  final List<String> imageUrls;
  final PageController pageController;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onDotTap;

  const _WideLayout({
    required this.fadeAnim,
    required this.slideAnim,
    required this.imageUrls,
    required this.pageController,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onDotTap,
  });

  @override
  State<_WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<_WideLayout> {
  bool isMobile = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    isMobile = width < SizeConfig.tablet;
  }

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: widget.fadeAnim,
                child: GalleryCard(
                  imageUrls: widget.imageUrls,
                  currentIndex: widget.currentIndex,
                  onPageChanged: widget.onPageChanged,
                ),
              ),
              const SizedBox(height: 36),
              FadeTransition(
                opacity: widget.fadeAnim,
                child: SlideTransition(
                  position: widget.slideAnim,
                  child: HeroTextContent(),
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: FadeTransition(
                  opacity: widget.fadeAnim,
                  child: SlideTransition(
                    position: widget.slideAnim,
                    child: HeroTextContent(),
                  ),
                ),
              ),
              const SizedBox(width: 36),
              Expanded(
                flex: 2,
                child: FadeTransition(
                  opacity: widget.fadeAnim,
                  child: GalleryCard(
                    imageUrls: widget.imageUrls,
                    currentIndex: widget.currentIndex,
                    onPageChanged: widget.onPageChanged,
                  ),
                ),
              ),
            ],
          );
  }
}
