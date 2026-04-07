import 'package:wm_hotel/features/home/data/entities/room_entity.dart';

class RoomsData {
  static const List<RoomEntity> featuredRooms = [
    RoomEntity(
      name: RoomName(arName: 'غرفة ديلوكس', enName: 'Deluxe Room'),
      brief: RoomBrief(
        arBrief: 'غرفة أنيقة بإطلالة رائعة وتجهيزات فاخرة',
        enBrief: 'Elegant room with stunning views and luxury amenities',
      ),
      imageUrl:
          'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&q=80',
      price: 850,
      stars: 4,
      details: [
        RoomDetails(arDetails: 'سرير كينج سايز', enDetails: 'King-size bed'),
        RoomDetails(arDetails: 'واي فاي مجاني', enDetails: 'Free Wi-Fi'),
        RoomDetails(arDetails: 'تلفزيون 55 بوصة', enDetails: '55" Smart TV'),
        RoomDetails(arDetails: 'مكيف هواء', enDetails: 'Air conditioning'),
        RoomDetails(arDetails: 'حمام خاص', enDetails: 'Private bathroom'),
      ],
    ),
    RoomEntity(
      name: RoomName(
        arName: 'جناح "وايت مون" الملكي',
        enName: '"White Moon" Royal Suite',
      ),
      brief: RoomBrief(
        arBrief: 'جناح ملكي فاخر مع خدمات حصرية وإطلالة بانورامية',
        enBrief:
            'Luxurious royal suite with exclusive services and panoramic views',
      ),
      imageUrl:
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80',
      price: 2400,
      stars: 5,
      details: [
        RoomDetails(
          arDetails: 'غرفة معيشة واسعة',
          enDetails: 'Spacious living room',
        ),
        RoomDetails(arDetails: 'جاكوزي خاص', enDetails: 'Private jacuzzi'),
        RoomDetails(
          arDetails: 'خدمة باتلر 24/7',
          enDetails: '24/7 butler service',
        ),
        RoomDetails(arDetails: 'إطلالة بانورامية', enDetails: 'Panoramic view'),
        RoomDetails(
          arDetails: 'مطبخ صغير مجهز',
          enDetails: 'Equipped kitchenette',
        ),
        RoomDetails(
          arDetails: 'غرفة نوم مستقلة',
          enDetails: 'Separate bedroom',
        ),
      ],
    ),
    RoomEntity(
      name: RoomName(arName: 'غرفة بانوراما', enName: 'Panorama Room'),
      brief: RoomBrief(
        arBrief: 'غرفة مميزة بنوافذ زجاجية بانورامية تطل على المدينة',
        enBrief:
            'Distinctive room with panoramic glass windows overlooking the city',
      ),
      imageUrl:
          'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800&q=80',
      price: 1200,
      stars: 4,
      details: [
        RoomDetails(
          arDetails: 'نوافذ من الأرض للسقف',
          enDetails: 'Floor-to-ceiling windows',
        ),
        RoomDetails(arDetails: 'سرير كوين سايز', enDetails: 'Queen-size bed'),
        RoomDetails(arDetails: 'واي فاي مجاني', enDetails: 'Free Wi-Fi'),
        RoomDetails(arDetails: 'منطقة جلوس', enDetails: 'Seating area'),
        RoomDetails(
          arDetails: 'خدمة الغرف 24 ساعة',
          enDetails: '24-hour room service',
        ),
      ],
    ),
    RoomEntity(
      name: RoomName(arName: 'الجناح العائلي', enName: 'Family Suite'),
      brief: RoomBrief(
        arBrief: 'جناح فسيح مثالي للعائلات مع غرفتين وصالة مريحة',
        enBrief:
            'Spacious suite ideal for families with two bedrooms and a cozy lounge',
      ),
      imageUrl:
          'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80',
      price: 1800,
      stars: 5,
      details: [
        RoomDetails(
          arDetails: 'غرفتا نوم مستقلتان',
          enDetails: 'Two separate bedrooms',
        ),
        RoomDetails(arDetails: 'صالة جلوس', enDetails: 'Living lounge'),
        RoomDetails(arDetails: 'حمامان', enDetails: 'Two bathrooms'),
        RoomDetails(
          arDetails: 'ثلاجة ومطبخ صغير',
          enDetails: 'Fridge & kitchenette',
        ),
        RoomDetails(
          arDetails: 'تلفزيون في كل غرفة',
          enDetails: 'TV in every room',
        ),
      ],
    ),
    RoomEntity(
      name: RoomName(arName: 'غرفة إكزيكيوتف', enName: 'Executive Room'),
      brief: RoomBrief(
        arBrief: 'مصممة لرجال الأعمال بمكتب خاص ووصول حصري لصالة الأعمال',
        enBrief:
            'Designed for business travelers with a private desk and exclusive lounge access',
      ),
      imageUrl:
          'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80',
      price: 1400,
      stars: 4,
      details: [
        RoomDetails(arDetails: 'مكتب عمل خاص', enDetails: 'Private work desk'),
        RoomDetails(
          arDetails: 'وصول لصالة الأعمال',
          enDetails: 'Executive lounge access',
        ),
        RoomDetails(
          arDetails: 'طابعة وماسح ضوئي',
          enDetails: 'Printer & scanner',
        ),
        RoomDetails(
          arDetails: 'واي فاي فائق السرعة',
          enDetails: 'High-speed Wi-Fi',
        ),
        RoomDetails(
          arDetails: 'إفطار مجاني',
          enDetails: 'Complimentary breakfast',
        ),
      ],
    ),
  ];
}
