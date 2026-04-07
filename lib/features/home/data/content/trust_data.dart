import 'package:flutter/material.dart';
import 'package:wm_hotel/features/home/data/entities/trust_entity.dart';

class TrustData {
  static const List<TrustEntity> trustInfo = [
    TrustEntity(
      icon: Icons.access_time_rounded,
      title: TrustInfo(arInfo: "لا توجد رسوم خفية", enInfo: "No Hidden Fees"),
      subTitle: TrustInfo(
        arInfo: "استمتع بأسعار شفافة تماماً دون أي تكاليف إضافية غير معلنة",
        enInfo:
            "Enjoy transparent pricing with absolutely no hidden or unexpected costs",
      ),
    ),

    TrustEntity(
      icon: Icons.verified_user_rounded,
      title: TrustInfo(arInfo: "حجز فوري ومؤكد", enInfo: "Instant Booking"),
      subTitle: TrustInfo(
        arInfo: "احصل على تأكيد حجزك مباشرة وبكل سهولة فور إتمام العملية",
        enInfo:
            "Get your booking confirmation instantly right after you complete your reservation",
      ),
    ),

    TrustEntity(
      icon: Icons.calendar_today_rounded,
      title: TrustInfo(
        arInfo: "مرونة تامة في الاختيار",
        enInfo: "Total Flexibility",
      ),
      subTitle: TrustInfo(
        arInfo:
            "خيارات مرنة تشمل الإلغاء المجاني للعديد من خيارات الإقامة المتاحة",
        enInfo:
            "Stay flexible with free cancellation options available on many of our listings",
      ),
    ),
  ];
}
