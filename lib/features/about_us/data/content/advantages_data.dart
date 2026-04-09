import 'package:flutter/material.dart';
import 'package:wm_hotel/features/about_us/data/entities/advantage_entity.dart';

final List<AdvantageEntity> advantagesData = [
  AdvantageEntity(
    arTitle: 'موقع استراتيجي متميز',
    enTitle: 'Prime Strategic Location',
    arDescription:
        'نقع في قلب المدينة، مما يوفر لك سهولة الوصول إلى مراكز الأعمال وأهم المعالم السياحية بكل يسر وسهولة',
    enDescription:
        'Situated in the heart of the city, providing seamless access to major business hubs and key attractions',
    icon: Icons.location_on_outlined,
  ),
  AdvantageEntity(
    arTitle: 'فخامة عصرية وهدوء مطلق',
    enTitle: 'Modern Luxury & Absolute Tranquility',
    arDescription:
        'غرف وأجنحة مصممة بعناية فائقة لتكون ملاذك الخاص للسكينة، حيث تجتمع الأناقة مع أحدث وسائل الراحة العالمية',
    enDescription:
        'Exquisitely designed rooms and suites serving as your private sanctuary, where elegance meets world-class modern amenities',
    icon: Icons.home_work_outlined,
  ),
  AdvantageEntity(
    arTitle: 'ضيافة شخصية استثنائية',
    enTitle: 'Exceptional Personalized Hospitality',
    arDescription:
        'فريق عملنا متواجد لخدمتكم على مدار الساعة، ملتزمون بتقديم خدمة شخصية تتجاوز توقعاتكم وتحتفي بأصول الضيافة العربية',
    enDescription: 'Exceptional Personalized Hospitality',
    icon: Icons.people_alt_outlined,
  ),
  AdvantageEntity(
    arTitle: 'مرافق متكاملة بمعايير عالمية',
    enTitle: 'World-Class Integrated Facilities',
    arDescription:
        'من الإنترنت فائق السرعة إلى مرافق الضيافة الراقية، نوفر كافة المتطلبات التي تضمن إقامة مثالية لرجال الأعمال والعائلات',
    enDescription:
        'From high-speed internet to premium hospitality venues, we provide everything needed for a perfect stay for both business and leisure travelers',
    icon: Icons.handshake_outlined,
  ),
];
