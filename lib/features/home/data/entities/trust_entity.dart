import 'package:flutter/cupertino.dart';

class TrustEntity {
  final TrustInfo title;
  final TrustInfo subTitle;

  final IconData icon;

  const TrustEntity({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
}

class TrustInfo {
  final String arInfo;
  final String enInfo;
  const TrustInfo({required this.arInfo, required this.enInfo});
}
