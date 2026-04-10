class VenueEntity {
  final VenueName name;
  final VenueBrief brief;
  final List<String> images;
  final double rating;
  final num price;
  final num serviceFee;

  final List<VenueDetails> details;

  const VenueEntity({
    required this.name,
    required this.brief,
    required this.images,
    required this.rating,
    required this.price,
    required this.details,
    required this.serviceFee,
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

class VenueDetails {
  final String arDetails;
  final String enDetails;

  const VenueDetails({required this.arDetails, required this.enDetails});
}
