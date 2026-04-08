import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/core/utils/app_colors.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/content/rooms_data.dart';
import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/rooms/presentation/widgets/rooms_grid/rooms_grid_view.dart';
import 'package:wm_hotel/generated/l10n.dart';

import 'rooms_pagination.dart';

class RoomsGrid extends StatefulWidget {
  const RoomsGrid({super.key});

  @override
  State<RoomsGrid> createState() => _RoomsGridState();
}

class _RoomsGridState extends State<RoomsGrid> {
  int _currentPage = 1;
  static const int _itemsPerPage = 10;
  int crossAxisCount = 3;
  double childAspectRatio = 1.0;

  List<RoomEntity> get _rooms => RoomsData.featuredRooms;

  int get _totalPages {
    return (_rooms.length / _itemsPerPage).ceil().clamp(1, 999);
  }

  // ✅ استخراج الـ items بناءً على الـ current page
  List<RoomEntity> get _currentPageItems {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage).clamp(0, _rooms.length);
    return _rooms.sublist(startIndex, endIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.sizeOf(context).width;
    if (width <= SizeConfig.tablet) {
      setState(() {
        crossAxisCount = 1;
        childAspectRatio = 0.75;
      });
    } else if (width <= SizeConfig.desktop) {
      setState(() {
        crossAxisCount = 2;
        childAspectRatio = 0.8;
      });
    } else {
      setState(() {
        crossAxisCount = 3;
        childAspectRatio = 0.9;
      });
    }
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        RoomsGridView(
          rooms: _currentPageItems,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        ),
        const SizedBox(height: 24),
        VenuesPagination(
          currentPage: _currentPage,
          totalPages: _totalPages,
          onPageChanged: _onPageChanged,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          S.of(context).home_rooms_section_title,
          style: AppStyles.styleBold32(context).copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
