class RoomEntity {
  final String roomId;
  final RoomName name;
  final RoomBrief brief;
  final List<String> images;
  final double rating;
  final num price;
  final num serviceFee;

  final List<RoomDetails> details;

  const RoomEntity({
    required this.roomId,
    required this.name,
    required this.brief,
    required this.images,
    required this.rating,
    required this.price,
    required this.details,
    required this.serviceFee,
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
