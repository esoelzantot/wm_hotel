import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_hotel/core/cubits/local_cubit/local_cubit.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/features/home/data/entities/trust_entity.dart';

class TrustItem extends StatelessWidget {
  final TrustEntity trust;

  const TrustItem({super.key, required this.trust});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, LocalState>(
      builder: (context, state) {
        final isAr = state is ChangeLocalState
            ? state.locale.languageCode == 'ar'
            : false;

        final title = isAr ? trust.title.arInfo : trust.title.enInfo;
        final description = isAr
            ? trust.subTitle.arInfo
            : trust.subTitle.enInfo;

        return Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F1FB),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(trust.icon, size: 30, color: const Color(0xFF2563EB)),
            ),
            const SizedBox(height: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: AppStyles.styleSemiBold24(context),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: AppStyles.styleMedium20(
                context,
              ).copyWith(color: Color(0xFF6B7280)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
