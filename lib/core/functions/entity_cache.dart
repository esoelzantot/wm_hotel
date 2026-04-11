// lib/core/cache/entity_cache.dart

import 'package:wm_hotel/features/home/data/entities/room_entity.dart';
import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';

class VenueCache {
  static final Map<String, VenueEntity> _cache = {};

  static void set(VenueEntity venue) {
    _cache[venue.venueId] = venue;
  }

  static VenueEntity? get(String id) => _cache[id];
}

class RoomCache {
  static final Map<String, RoomEntity> _cache = {};

  static void set(RoomEntity room) {
    _cache[room.roomId] = room;
  }

  static RoomEntity? get(String id) => _cache[id];
}
