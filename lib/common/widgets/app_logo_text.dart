import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdl_mobile/common/app_theme/index.dart';

import '../../gen/assets.gen.dart';

class AppLogoText extends StatelessWidget {
  const AppLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.svg.appLogo.svg(height: 44.h, width: 44.w),
        SizedBox(
          width: 10.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SỞ DU LỊCH',
              style: AppStyles.s12w6o.copyWith(color: AppColors.c00997F),
            ),
            Text(
              'THÀNH PHỐ HÀ NỘI',
              style: AppStyles.s12w6o.copyWith(color: AppColors.c00997F),
            )
          ],
        ),
      ],
    );
  }
}
