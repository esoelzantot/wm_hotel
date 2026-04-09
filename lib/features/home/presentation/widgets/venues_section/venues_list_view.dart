import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';

import 'venue_card.dart';

class VenuesListView extends StatefulWidget {
  final List<VenueEntity> venues;
  final ScrollController scrollController;
  final double height;

  // ─── Auto-scroll config ───────────────────────────────────
  final bool enableAutoScroll;
  final Duration scrollInterval;
  final double autoScrollStep;

  const VenuesListView({
    super.key,
    required this.venues,
    required this.scrollController,
    this.height = 380,
    this.enableAutoScroll = true,
    this.scrollInterval = const Duration(milliseconds: 30),
    this.autoScrollStep = 1,
  });

  @override
  State<VenuesListView> createState() => _VenuesListViewState();
}

class _VenuesListViewState extends State<VenuesListView> {
  Timer? _autoScrollTimer;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    if (widget.enableAutoScroll) _startAutoScroll();
  }

  // ─── Auto-scroll ──────────────────────────────────────────
  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(widget.scrollInterval, (_) {
      if (_isHovered || !widget.scrollController.hasClients) return;

      final maxScroll = widget.scrollController.position.maxScrollExtent;
      final current = widget.scrollController.offset;

      if (current >= maxScroll) {
        widget.scrollController.jumpTo(0);
      } else {
        widget.scrollController.jumpTo(current + widget.autoScrollStep);
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: SizedBox(
        height: widget.height,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: ListView.separated(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: widget.venues.length,
            separatorBuilder: (_, __) => SizedBox(width: 4),
            itemBuilder: (context, index) {
              final place = widget.venues[index];
              return _AnimatedCardEntry(
                index: index,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10,
                  ),
                  child: VenueCard(venue: place),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// Staggered entrance animation per card
// ─────────────────────────────────────────
class _AnimatedCardEntry extends StatefulWidget {
  final int index;
  final Widget child;

  const _AnimatedCardEntry({required this.index, required this.child});

  @override
  State<_AnimatedCardEntry> createState() => _AnimatedCardEntryState();
}

class _AnimatedCardEntryState extends State<_AnimatedCardEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: widget.index * 80), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(position: _slideAnim, child: widget.child),
    );
  }
}
