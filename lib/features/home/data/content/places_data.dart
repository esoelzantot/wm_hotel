import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';

class PlacesData {
  static const List<VenueEntity> featuredPlaces = [
    VenueEntity(
      name: VenueName(arName: "ضيافة 1", enName: "Place 1"),
      brief: VenueBrief(arBrief: "وصف 1", enBrief: "Brief 1"),
      imageUrl:
          'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=600&q=80',
      rating: 5.0,
    ),
    VenueEntity(
      name: VenueName(arName: "ضيافة 2", enName: "Place 2"),
      brief: VenueBrief(arBrief: "وصف 2", enBrief: "Brief 2"),
      imageUrl:
          'https://images.unsplash.com/photo-1613977257363-707ba9348227?w=600&q=80',
      rating: 5.0,
    ),
    VenueEntity(
      name: VenueName(arName: "ضيافة 3", enName: "Place 3"),
      brief: VenueBrief(arBrief: "وصف 3", enBrief: "Brief 3"),
      imageUrl:
          'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?w=600&q=80',
      rating: 4.8,
    ),
    VenueEntity(
      name: VenueName(arName: "ضيافة 4", enName: "Place 4"),
      brief: VenueBrief(arBrief: "وصف 4", enBrief: "Brief 4"),
      imageUrl:
          'https://images.unsplash.com/photo-1615880484746-a134be9a6ecf?w=600&q=80',
      rating: 5.0,
    ),
    VenueEntity(
      name: VenueName(arName: "ضيافة 5", enName: "Place 5"),
      brief: VenueBrief(arBrief: "وصف 5", enBrief: "Brief 5"),
      imageUrl:
          'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=600&q=80',
      rating: 5.0,
    ),
    VenueEntity(
      name: VenueName(arName: "ضيافة 6", enName: "Place 6"),
      brief: VenueBrief(arBrief: "وصف 6", enBrief: "Brief 6"),
      imageUrl:
          'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=600&q=80',
      rating: 4.9,
    ),
  ];
}
