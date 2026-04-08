import 'package:flutter/material.dart';
import 'package:wm_hotel/core/config/size_config.dart';
import 'package:wm_hotel/features/home/data/content/places_data.dart';
import 'package:wm_hotel/features/home/data/entities/place_entity.dart';
import 'package:wm_hotel/features/venues/presentation/widgets/venues_grid/venues_grid_view.dart';

import 'venues_pagination.dart';

class VenuesGrid extends StatefulWidget {
  const VenuesGrid({super.key});

  @override
  State<VenuesGrid> createState() => _VenuesGridState();
}

class _VenuesGridState extends State<VenuesGrid> {
  int _currentPage = 1;
  static const int _itemsPerPage = 10;
  int crossAxisCount = 3;
  double childAspectRatio = 1.0;

  List<PlaceEntity> get _places => PlacesData.featuredPlaces;

  int get _totalPages {
    return (_places.length / _itemsPerPage).ceil().clamp(1, 999);
  }

  // ✅ استخراج الـ items بناءً على الـ current page
  List<PlaceEntity> get _currentPageItems {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage).clamp(0, _places.length);
    return _places.sublist(startIndex, endIndex);
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
        crossAxisCount = 4;
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
        VenuesGridView(
          places: _currentPageItems,
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
}
