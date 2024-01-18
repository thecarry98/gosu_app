import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/index.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? thickness;
  const AppDivider({Key? key, this.color, this.height, this.thickness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.cE0E0E0,
      height: height ?? 1.h,
      thickness: thickness ?? 1.h,
    );
  }
}

class AppDividerTitle extends StatelessWidget {
  const AppDividerTitle({
    super.key,
    this.isPadding = true,
  });

  final bool? isPadding;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isPadding == true
            ? SizedBox(
                width: 20.w,
                child: const AppDivider(),
              )
            : const SizedBox.shrink(),
        SizedBox(
          width: isPadding == true ? 120.w : 150.w,
          child: AppDivider(
            height: 2.h,
            thickness: 2.h,
            color: AppColors.c25BB94,
          ),
        ),
        const Expanded(child: AppDivider()),
      ],
    );
  }
}

class AppDividerVertical extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? thickness;
  const AppDividerVertical({Key? key, this.color, this.width, this.thickness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: color ?? AppColors.primaryColor,
      width: width ?? 1.w,
      thickness: thickness ?? 1.h,
    );
  }
}
