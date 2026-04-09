import 'package:flutter/material.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/vision_mission/mission_section.dart';
import 'package:wm_hotel/features/about_us/presentation/widgets/vision_mission/vision_section.dart';

class VisionMissionSection extends StatelessWidget {
  const VisionMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(children: const [VisionSection(), MissionSection()]),
      ),
    );
  }
}
