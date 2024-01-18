import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
// import 'package:lottie/lottie.dart';
// import 'package:easy_localization/easy_localization.dart';

// import '../../gen/assets.gen.dart';

class AppLoading extends StatelessWidget {
  final Color? backgroundColor;
  const AppLoading({
    Key? key,
    this.backgroundColor,
    this.isLandscape = false,
  }) : super(key: key);
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Colors.transparent,
      child: RotatedBox(
        quarterTurns: isLandscape ? 1 : 0,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: isLandscape ? (1.sh / 2 - 100.w) : (1.sw / 2 - 100.w), // container width = 240.w
            vertical: isLandscape ? (1.sw / 2 - 60.w) : (1.sh / 2 - 60.w), // container height = 160.w
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.r),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0x1F090D34).withOpacity(0.05),
                offset: const Offset(0, -4),
                spreadRadius: 0,
                blurRadius: 16.r,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                Assets.lotties.loading,
                height: 120.w,
                width: 120.w,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 90.w,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'isProcessing'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
