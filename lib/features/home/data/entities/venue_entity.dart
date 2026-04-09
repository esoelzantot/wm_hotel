class VenueEntity {
  final VenueName name;
  final VenueBrief brief;
  final String imageUrl;
  final double rating;

  const VenueEntity({
    required this.name,
    required this.brief,
    required this.imageUrl,
    required this.rating,
  });
}

class VenueName {
  final String arName;
  final String enName;

  const VenueName({required this.arName, required this.enName});
}

class VenueBrief {
  final String arBrief;
  final String enBrief;

  const VenueBrief({required this.arBrief, required this.enBrief});
}
