class RoomEntity {
  final RoomName name;
  final RoomBrief brief;
  final String imageUrl;
  final int price;
  final int stars;

  final List<RoomDetails> details;

  const RoomEntity({
    required this.name,
    required this.brief,
    required this.details,
    required this.imageUrl,
    required this.price,
    required this.stars,
  });
}

class RoomName {
  final String arName;
  final String enName;
  const RoomName({required this.arName, required this.enName});
}

class RoomBrief {
  final String arBrief;
  final String enBrief;
  const RoomBrief({required this.arBrief, required this.enBrief});
}

class RoomDetails {
  final String arDetails;
  final String enDetails;

  const RoomDetails({required this.arDetails, required this.enDetails});
}
