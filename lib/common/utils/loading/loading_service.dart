import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

// import 'package:lottie/lottie.dart';

// import '../../widgets/index.dart';
import 'app_loading.dart';

@singleton
class LoadingService {
  static OverlayEntry? _overlayEntry;
  static OverlayState? _overlayState;

  static void _insertOverlay(BuildContext context, {bool? isLandscape}) {
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return AppLoading(isLandscape: isLandscape ?? false);
      },
    );
    _overlayState = Overlay.of(context);
    if (_overlayEntry != null) {
      return _overlayState!.insert(_overlayEntry!);
    }
  }

  static void _dismissOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static bool get isShowing => _overlayEntry != null;

  dynamic showLoading(BuildContext context, {bool? isLandscape}) => _insertOverlay(context, isLandscape: isLandscape);

  dynamic hideLoading() => _dismissOverlay();
}
