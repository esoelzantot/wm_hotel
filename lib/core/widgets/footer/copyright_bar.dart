import 'package:flutter/material.dart';
import 'package:wm_hotel/core/functions/launch_url.dart';
import 'package:wm_hotel/core/utils/app_styles.dart';
import 'package:wm_hotel/generated/l10n.dart';

class CopyrightBar extends StatelessWidget {
  const CopyrightBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              S.of(context).footer_copy_right,
              textAlign: TextAlign.center,
              style: AppStyles.styleMedium24(
                context,
              ).copyWith(color: Colors.grey.shade500),
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  S.of(context).footer_developed_by,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleMedium22(context),
                ),
                TextButton(
                  onPressed: () => launchUrlFunc('https://www.axuraa.com'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).footer_company_name.substring(0, 1),
                        style: AppStyles.styleBold28(
                          context,
                        ).copyWith(color: Color(0xffE07B39)),
                      ),
                      Text(
                        S.of(context).footer_company_name.substring(1, 2),
                        style: AppStyles.styleBold28(context),
                      ),
                      Text(
                        S.of(context).footer_company_name.substring(2),
                        style: AppStyles.styleBold28(
                          context,
                        ).copyWith(color: Color(0xffE07B39)),
                      ),
                    ],
                  ),
                ),
                Text(
                  S.of(context).footer_powered_by,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleMedium22(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
