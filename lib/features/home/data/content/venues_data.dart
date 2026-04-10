import 'package:wm_hotel/features/home/data/entities/venue_entity.dart';

class PlacesData {
  static const List<VenueEntity> venuesList = [
    // 1. الممر الخارجي المضاء (image_8.png)
    VenueEntity(
      name: VenueName(
        arName: "تراس النخيل الخارجي",
        enName: "Palm Terrace Walkway",
      ),
      brief: VenueBrief(
        arBrief: "ممر خارجي أنيق بظلال خشبية وإضاءة دافئة.",
        enBrief: "Elegant outdoor walkway with wooden shades & warm lighting.",
      ),
      images: ["assets/images/venues/palm_terrace.jpg"],
      rating: 4.8,
      price: 150,
      serviceFee: 15,
      details: [
        VenueDetails(
          arDetails: "أجواء خارجية منعشة",
          enDetails: "Fresh outdoor ambiance",
        ),
        VenueDetails(
          arDetails: "مثالي للقهوة المسائية",
          enDetails: "Perfect for evening coffee",
        ),
      ],
    ),

    // 2. البهو الرئيسي العصري (image_9.png)
    VenueEntity(
      name: VenueName(
        arName: "البهو الرئيسي واللاونج",
        enName: "Main Lobby & Lounge",
      ),
      brief: VenueBrief(
        arBrief: "تصميم عصري يجمع بين الرخام الفاخر والهدوء.",
        enBrief: "Modern design blending luxury marble and tranquility.",
      ),
      images: ["assets/images/venues/main_lobby.jpg"],
      rating: 5.0,
      price: 90,
      serviceFee: 10,
      details: [
        VenueDetails(
          arDetails: "جلسات مريحة وواسعة",
          enDetails: "Comfortable & spacious seating",
        ),
        VenueDetails(
          arDetails: "مناسب لاستقبال الضيوف",
          enDetails: "Ideal for guest reception",
        ),
      ],
    ),

    // 3. منطقة الكافيه والعمل المشترك (image_10.png)
    VenueEntity(
      name: VenueName(
        arName: "ركن القهوة والعمل المشترك",
        enName: "Coffee & Coworking Corner",
      ),
      brief: VenueBrief(
        arBrief: "مساحة هادئة ومضاءة للتركيز أو الاجتماعات السريعة.",
        enBrief: "Quiet, lit space for focus or quick meetings.",
      ),
      images: ["assets/images/venues/coworking_corner.jpg"],
      rating: 4.9,
      price: 50,
      serviceFee: 10,
      details: [
        VenueDetails(
          arDetails: "جلسات مخملية مريحة",
          enDetails: "Cozy velvet seating",
        ),
        VenueDetails(
          arDetails: "إنترنت عالي السرعة",
          enDetails: "High-speed Wi-Fi",
        ),
      ],
    ),

    // 4. ركن المشروبات والحلويات (image_11.png)
    VenueEntity(
      name: VenueName(arName: "وايت مون كافيه", enName: "White Moon Cafe"),
      brief: VenueBrief(
        arBrief: "استمتع بتشكيلة من القهوة المختصة والحلويات الطازجة.",
        enBrief: "Enjoy a selection of specialty coffee & fresh pastries.",
      ),
      images: ["assets/images/venues/cafe_counter.jpg"],
      rating: 4.7,
      price: 35,
      serviceFee: 10,
      details: [
        VenueDetails(arDetails: "بار عصري مفتوح", enDetails: "Modern open bar"),
        VenueDetails(
          arDetails: "تشكيلة حلويات يومية",
          enDetails: "Daily pastry selection",
        ),
      ],
    ),

    // 5. اللاونج الصناعي العصري (image_12.png)
    VenueEntity(
      name: VenueName(
        arName: "اللاونج الصناعي (Industrial)",
        enName: "The Industrial Lounge",
      ),
      brief: VenueBrief(
        arBrief: "أجواء شبابية عصرية بتصميم صناعي وجدران إسمنتية.",
        enBrief:
            "Modern, youthful vibe with industrial design & concrete walls.",
      ),
      images: ["assets/images/venues/industrial_lounge.jpg"],
      rating: 4.9,
      price: 100,
      serviceFee: 10,

      details: [
        VenueDetails(
          arDetails: "مثالي للشباب والعمل المشترك",
          enDetails: "Perfect for youth & coworking",
        ),
        VenueDetails(
          arDetails: "تصميم جريء ومميز",
          enDetails: "Bold & distinct design",
        ),
      ],
    ),

    // 6. التراس الخارجي للفطور (image_13.png)
    VenueEntity(
      name: VenueName(
        arName: "تراس الفطور الشمسي",
        enName: "Sunny Breakfast Terrace",
      ),
      brief: VenueBrief(
        arBrief: "ابدأ يومك بفطور طازج تحت أشعة الشمس.",
        enBrief: "Start your day with fresh breakfast under the sun.",
      ),
      images: ["assets/images/venues/breakfast_terrace.jpg"],
      rating: 4.6,
      price: 75,
      serviceFee: 15,
      details: [
        VenueDetails(
          arDetails: "إطلالة خارجية مريحة",
          enDetails: "Relaxing outdoor view",
        ),
        VenueDetails(
          arDetails: "فطور صحي ومتنوع",
          enDetails: "Healthy & diverse breakfast",
        ),
      ],
    ),

    // 7. منطقة الدخول الفخمة (image_14.png)
    VenueEntity(
      name: VenueName(
        arName: "المدخل الملكي واللاونج",
        enName: "Royal Entrance & Lounge",
      ),
      brief: VenueBrief(
        arBrief: "مدخل فخم يدمج بين الرخام واللمسات الذهبية.",
        enBrief: "Grand entrance blending marble and golden touches.",
      ),
      images: ["assets/images/venues/royal_entrance.jpg"],
      rating: 5.0,
      price: 80,
      serviceFee: 10,
      details: [
        VenueDetails(
          arDetails: "تصميم راقٍ جداً",
          enDetails: "Ultra-luxury design",
        ),
        VenueDetails(
          arDetails: "مثالي لالتقاط الصور",
          enDetails: "Perfect for photo ops",
        ),
      ],
    ),

    // 8. لاونج الرخام والذهبي (image_15.png)
    VenueEntity(
      name: VenueName(
        arName: "لاونج الرخام التنفيذي",
        enName: "Executive Marble Lounge",
      ),
      brief: VenueBrief(
        arBrief: "فخامة كلاسيكية حديثة بلمسات ذهبية ورخامية.",
        enBrief: "Modern classic luxury with marble & gold accents.",
      ),
      images: ["assets/images/venues/marble_lounge.jpg"],
      rating: 4.9,
      price: 200,
      serviceFee: 20,
      details: [
        VenueDetails(
          arDetails: "جلسات مريحة وواسعة",
          enDetails: "Comfortable & spacious seating",
        ),
        VenueDetails(
          arDetails: "مناسب لاجتماعات العمل",
          enDetails: "Ideal for business meetings",
        ),
      ],
    ),
  ];
}
