import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../index.dart';

enum SnackBarType { success, error, info }

@singleton
class SnackBarHelper {
  //todo: icon & color
  void _show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.success,
    int duration = 1,
    Function()? onTap,
  }) async {
    Widget icon = const Icon(Icons.check);
    Color color = Colors.green;
    // haptic();
    switch (type) {
      case SnackBarType.success:
        icon = const Icon(
          Icons.check,
          color: Colors.white,
        );
        color = Colors.green.withAlpha(150);
        break;
      case SnackBarType.error:
        icon = const Icon(
          Icons.error_outline,
          color: Colors.white,
        );
        color = Colors.red.withAlpha(150);
        break;
      case SnackBarType.info:
        icon = const Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 20,
        );
        color = AppColors.c12CE9D;
        break;
      default:
        icon = const Icon(
          Icons.check,
          color: Colors.white,
          size: 50,
        );
        color = Colors.green.withAlpha(150);
        break;
    }

    showTopSnackBar(
      Overlay.of(context),
      SizedBox(
        height: 50.h,
        child: CustomSnackBar.info(
          // iconPositionTop: 50 / 2,
          iconPositionTop: -25,

          message: message,
          iconRotationAngle: 0,
          iconPositionLeft: 10,
          maxLines: 1,
          textStyle: TextStyle(
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
            fontSize: 15.sp,
          ), //todo:
          backgroundColor: color,
          messagePadding: const EdgeInsets.only(left: 56, right: 16, top: 0, bottom: 0),
          icon: icon,
        ),
      ),
      displayDuration: Duration(seconds: duration),
      onTap: onTap,
    );
  }

  dynamic showSuccess(
    BuildContext context,
    String message, {
    Function()? onTap,
  }) =>
      _show(
        context,
        message,
        onTap: onTap,
      );

  dynamic showInfo(
    BuildContext context,
    String message, {
    Function()? onTap,
  }) =>
      _show(
        context,
        message,
        onTap: onTap,
        type: SnackBarType.info,
      );

  dynamic showError(
    BuildContext context,
    String message,
  ) =>
      _show(
        context,
        message,
        type: SnackBarType.error,
      );
}
