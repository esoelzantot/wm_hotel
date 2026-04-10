import 'package:wm_hotel/features/home/data/entities/room_entity.dart';

class RoomsData {
  static const List<RoomEntity> roomsList = [
    // 1. جناح وايت مون الملكي (مستوحى من room_1)
    RoomEntity(
      name: RoomName(
        arName: "جناح وايت مون الملكي",
        enName: "White Moon Royal Suite",
      ),
      brief: RoomBrief(
        arBrief: "قمة الفخامة والرفاهية لتجربة إقامة لا تُنسى.",
        enBrief:
            "The pinnacle of luxury and comfort for an unforgettable stay.",
      ),
      images: ["assets/images/rooms/room_1.jpg"],
      rating: 5.0,
      price: 2400,
      serviceFee: 150,
      details: [
        RoomDetails(
          arDetails: "سرير كينج ملكي بتصميم عصري",
          enDetails: "Modern King-size royal bed",
        ),
        RoomDetails(
          arDetails: "منطقة جلوس مستقلة ومفروشة بالكامل",
          enDetails: "Independent fully furnished living area",
        ),
        RoomDetails(
          arDetails: "إطلالة بانورامية ساحرة على المدينة",
          enDetails: "Stunning panoramic city view",
        ),
        RoomDetails(
          arDetails: "حمام رخامي مجهز بأحدث وسائل الراحة",
          enDetails: "Marble bathroom with premium amenities",
        ),
        RoomDetails(
          arDetails: "نظام إضاءة ذكي للتحكم في الأجواء",
          enDetails: "Smart lighting system for ambiance control",
        ),
        RoomDetails(
          arDetails: "خدمة المساعد الشخصي على مدار 24 ساعة",
          enDetails: "24-hour personal butler service",
        ),
      ],
    ),

    // 2. الغرفة التنفيذية (مستوحى من room_2)
    RoomEntity(
      name: RoomName(
        arName: "الغرفة التنفيذية الفاخرة",
        enName: "Luxury Executive Room",
      ),
      brief: RoomBrief(
        arBrief: "مزيج مثالي بين الأناقة والعملية لرجال الأعمال.",
        enBrief:
            "A perfect blend of elegance and functionality for professionals.",
      ),
      images: ["assets/images/rooms/room_2.jpg"],
      rating: 4.9,
      price: 1200,
      serviceFee: 80,
      details: [
        RoomDetails(
          arDetails: "مكتب عمل واسع ومقعد مريح",
          enDetails: "Spacious desk and ergonomic chair",
        ),
        RoomDetails(
          arDetails: "إنترنت فائق السرعة مخصص للأعمال",
          enDetails: "Dedicated high-speed business Wi-Fi",
        ),
        RoomDetails(
          arDetails: "ماكينة قهوة إسبريسو خاصة",
          enDetails: "Private espresso coffee machine",
        ),
        RoomDetails(
          arDetails: "خزانة أمان إلكترونية بحجم اللابتوب",
          enDetails: "Laptop-sized electronic safe box",
        ),
        RoomDetails(
          arDetails: "شاشة تلفزيون ذكية بنظام صوتي محيطي",
          enDetails: "Smart TV with surround sound system",
        ),
        RoomDetails(
          arDetails: "خدمة كي الملابس السريعة مجاناً",
          enDetails: "Complimentary express ironing service",
        ),
      ],
    ),

    // 3. جناح العائلات (مستوحى من room_3)
    RoomEntity(
      name: RoomName(
        arName: "جناح العائلات الفسيح",
        enName: "Spacious Family Suite",
      ),
      brief: RoomBrief(
        arBrief: "مساحة رحبة تضمن الخصوصية والراحة لجميع أفراد الأسرة.",
        enBrief:
            "A grand space ensuring privacy and comfort for the whole family.",
      ),
      images: ["assets/images/rooms/room_3.jpg"],
      rating: 4.8,
      price: 1800,
      serviceFee: 120,
      details: [
        RoomDetails(
          arDetails: "غرفتان متصلتان بباب داخلي",
          enDetails: "Two interconnected rooms",
        ),
        RoomDetails(
          arDetails: "منطقة لتناول الطعام مجهزة بأناقة",
          enDetails: "Elegantly equipped dining area",
        ),
        RoomDetails(
          arDetails: "قنوات تلفزيونية مخصصة للأطفال",
          enDetails: "Dedicated kids' TV channels",
        ),
        RoomDetails(
          arDetails: "ميني بار متنوع ومجاني يومياً",
          enDetails: "Complimentary daily diverse mini-bar",
        ),
        RoomDetails(
          arDetails: "شرفة واسعة بإطلالة خلابة",
          enDetails: "Large balcony with breathtaking views",
        ),
        RoomDetails(
          arDetails: "مستلزمات استحمام عضوية للعائلة",
          enDetails: "Organic family bath amenities",
        ),
      ],
    ),

    // 4. غرفة ديلوكس المزدوجة (مستوحى من room_4)
    RoomEntity(
      name: RoomName(
        arName: "غرفة ديلوكس مزدوجة",
        enName: "Deluxe Double Room",
      ),
      brief: RoomBrief(
        arBrief: "تصميم عصري وجلسات مريحة لإقامة استثنائية.",
        enBrief: "Modern design and cozy seating for an exceptional stay.",
      ),
      images: ["assets/images/rooms/room_4.jpg"],
      rating: 4.7,
      price: 850,
      serviceFee: 50,
      details: [
        RoomDetails(
          arDetails: "سرير مزدوج فاخر بمفروشات قطنية",
          enDetails: "Luxury double bed with cotton linens",
        ),
        RoomDetails(
          arDetails: "ستائر عازلة تماماً للضوء والضجيج",
          enDetails: "Full blackout and soundproof curtains",
        ),
        RoomDetails(
          arDetails: "تكييف هواء بتحكم فردي دقيق",
          enDetails: "Individually controlled air conditioning",
        ),
        RoomDetails(
          arDetails: "مساحة تخزين واسعة للملابس",
          enDetails: "Ample wardrobe storage space",
        ),
        RoomDetails(
          arDetails: "دش مطري عصري في الحمام",
          enDetails: "Modern rainfall shower in the bathroom",
        ),
        RoomDetails(
          arDetails: "خدمة الغرف متاحة على مدار الساعة",
          enDetails: "24/7 room service available",
        ),
      ],
    ),

    // 5. غرفة بريميوم الفردية (مستوحى من room_5)
    RoomEntity(
      name: RoomName(
        arName: "غرفة بريميوم فردية",
        enName: "Premium Single Room",
      ),
      brief: RoomBrief(
        arBrief: "الملاذ الهادئ للمسافرين المنفردين الباحثين عن التميز.",
        enBrief: "A quiet sanctuary for solo travelers seeking excellence.",
      ),
      images: ["assets/images/rooms/room_5.jpg"],
      rating: 4.6,
      price: 600,
      serviceFee: 40,
      details: [
        RoomDetails(
          arDetails: "سرير كبير مريح لراحة تامة",
          enDetails: "Comfortable Queen-size bed",
        ),
        RoomDetails(
          arDetails: "إضاءة ليلية هادئة للقراءة",
          enDetails: "Soothing night reading lights",
        ),
        RoomDetails(
          arDetails: "روب استحمام وشبشب فندقي فاخر",
          enDetails: "Luxury hotel bathrobe and slippers",
        ),
        RoomDetails(
          arDetails: "غلاية كهربائية مع تشكيلة شاي فاخرة",
          enDetails: "Electric kettle with premium tea selection",
        ),
        RoomDetails(
          arDetails: "خدمة تنظيف الغرف مرتين يومياً",
          enDetails: "Twice-daily housekeeping service",
        ),
        RoomDetails(
          arDetails: "مجموعة أدوات عناية شخصية متكاملة",
          enDetails: "Full personal care kit",
        ),
      ],
    ),

    // 6. جناح جونيور المطل (مستوحى من room_6)
    RoomEntity(
      name: RoomName(arName: "جناح جونيور المطل", enName: "Junior View Suite"),
      brief: RoomBrief(
        arBrief: "إطلالة فريدة ومساحة أنيقة تمنحك شعوراً بالحرية.",
        enBrief: "Unique views and elegant space giving a sense of freedom.",
      ),
      images: ["assets/images/rooms/room_6.jpg"],
      rating: 4.8,
      price: 1100,
      serviceFee: 70,
      details: [
        RoomDetails(
          arDetails: "تصميم داخلي مستوحى من الطبيعة",
          enDetails: "Nature-inspired interior design",
        ),
        RoomDetails(
          arDetails: "نوافذ ممتدة من الأرض إلى السقف",
          enDetails: "Floor-to-ceiling windows",
        ),
        RoomDetails(
          arDetails: "ركن قهوة مجهز بالكامل",
          enDetails: "Fully equipped coffee corner",
        ),
        RoomDetails(
          arDetails: "أرضيات خشبية دافئة وعصرية",
          enDetails: "Warm and modern wooden floors",
        ),
        RoomDetails(
          arDetails: "نظام عزل صوتي متطور",
          enDetails: "Advanced soundproofing system",
        ),
        RoomDetails(
          arDetails: "دخول مجاني للمركز الصحي",
          enDetails: "Complimentary access to wellness center",
        ),
      ],
    ),

    // 7. جناح الرؤساء (مستوحى من room_7)
    RoomEntity(
      name: RoomName(
        arName: "جناح الرؤساء (Presidential)",
        enName: "Presidential Suite",
      ),
      brief: RoomBrief(
        arBrief: "رفاهية بلا حدود لأصحاب الذوق الرفيع.",
        enBrief: "Limitless luxury for those with refined taste.",
      ),
      images: ["assets/images/rooms/room_7.jpg"],
      rating: 5.0,
      price: 3500,
      serviceFee: 200,
      details: [
        RoomDetails(
          arDetails: "قاعة اجتماعات خاصة داخل الجناح",
          enDetails: "Private boardroom within the suite",
        ),
        RoomDetails(
          arDetails: "جاكوزي خاص بإطلالة مباشرة",
          enDetails: "Private jacuzzi with a direct view",
        ),
        RoomDetails(
          arDetails: "مطبخ متكامل بخدمات طاهٍ خاص",
          enDetails: "Full kitchen with private chef services",
        ),
        RoomDetails(
          arDetails: "مدخل خاص وسري للجناح",
          enDetails: "Secret private entrance to the suite",
        ),
        RoomDetails(
          arDetails: "أثاث من أرقى الماركات العالمية",
          enDetails: "Furniture from elite global brands",
        ),
        RoomDetails(
          arDetails: "نظام أمان متطور وكاميرات عند الطلب",
          enDetails: "Advanced security and on-demand cameras",
        ),
      ],
    ),

    // 8. الغرفة البانورامية (مستوحى من room_8)
    RoomEntity(
      name: RoomName(
        arName: "الغرفة البانورامية الحديثة",
        enName: "Modern Panoramic Room",
      ),
      brief: RoomBrief(
        arBrief: "استيقظ على أجمل مناظر المدينة في تصميم عصري.",
        enBrief: "Wake up to the city's finest views in a modern design.",
      ),
      images: ["assets/images/rooms/room_8.jpg"],
      rating: 4.9,
      price: 1300,
      serviceFee: 90,
      details: [
        RoomDetails(
          arDetails: "إطلالة بزاوية 180 درجة",
          enDetails: "180-degree panoramic view",
        ),
        RoomDetails(
          arDetails: "نظام تحكم ذكي عبر التابلت",
          enDetails: "Smart control system via tablet",
        ),
        RoomDetails(
          arDetails: "مساحة جلوس مدمجة وأنيقة",
          enDetails: "Sleek and integrated seating area",
        ),
        RoomDetails(
          arDetails: "مكبرات صوت بلوتوث مخفية",
          enDetails: "Hidden Bluetooth speakers",
        ),
        RoomDetails(
          arDetails: "إفطار فاخر يُقدم داخل الغرفة",
          enDetails: "Luxury breakfast served in-room",
        ),
        RoomDetails(
          arDetails: "خيار تسجيل الخروج المتأخر مجاناً",
          enDetails: "Complimentary late check-out option",
        ),
      ],
    ),
  ];
}
