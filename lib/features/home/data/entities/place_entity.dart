class PlaceEntity {
  final PlaceNameEntity name;
  final PlaceBriefEntity brief;
  final String imageUrl;
  final double rating;

  const PlaceEntity({
    required this.name,
    required this.brief,
    required this.imageUrl,
    required this.rating,
  });
}

class PlaceNameEntity {
  final String arName;
  final String enName;

  const PlaceNameEntity({required this.arName, required this.enName});
}

class PlaceBriefEntity {
  final String arBrief;
  final String enBrief;

  const PlaceBriefEntity({required this.arBrief, required this.enBrief});
}
