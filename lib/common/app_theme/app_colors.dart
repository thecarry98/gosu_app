import 'package:flutter/material.dart';

class AppColors {
  // static const Color primaryColor = Color(0xff2e8cc9);
  static const Color cECECEC = Color(0xffECECEC);
  static const Color cf5A717 = Color(0xffF5A717);
  static const Color c00997F = Color(0xff00997F);
  static const Color c12CE9D = Color(0xff12CE9D);
  static const Color cE0E0E0 = Color(0xffE0E0E0);
  static const Color cFFE602 = Color(0xffFFE602);
  static const Color c46AD92 = Color(0xff46AD92);
  static const Color c151517 = Color(0xff151517);
  static const Color c282828 = Color(0xff282828);
  static const Color c25BB94 = Color(0xff25BB94);
  static const Color delBtn = Color(0xfffdebeb);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color c95E1CA = Color(0xFF95E1CA);
  static const Color c737373 = Color(0xFF737373);
  static const MaterialColor primaryColor = MaterialColor(
    0xFF0072BB,
    <int, Color>{
      50: Color(0xFFE4F4FF),
      100: Color(0xFFCDE7F8),
      200: Color(0xFFB6DAF1),
      300: Color(0xFFA0CDEB),
      400: Color(0xFF89C0E4),
      500: Color(0xFF5BA6D6),
      600: Color(0xFF2E8CC9),
      700: Color(0xFF0072BB),
      800: Color(0xFF005B96),
      900: Color(0xFF003B61),
    },
  );

  static const MaterialColor secondaryColor = MaterialColor(0xFFFFB909, <int, Color>{
    50: Color(0xFFFFF8E6),
    100: Color(0xFFFFF1CE),
    200: Color(0xFFFFEAB5),
    300: Color(0xFFFFE39D),
    400: Color(0xFFFFD56B),
    500: Color(0xFFFFC73A),
    600: Color(0xFFFFB909),
    700: Color(0xFFCC9407),
    800: Color(0xFF996F05),
    900: Color(0xFF684B03),
  });

  // State Color.
  static const Color stateSuccessColor = Color(0xFF33B469);
  static const Color stateWarningColor = Color(0xFFEBBC2E);
  static const Color stateInfoColor = Color(0xFF2F80ED);
  static const Color stateErrorColor = Color(0xFFED3A3A);

  // Text Color.
  static const Color colord9d9d9 = Color(0xffd9d9d9);
  static const Color textSuccessColor = Color(0xFF181C32);
  static const Color textSecondaryColor = Color(0xFF3F4254);
  static const Color textTertiaryColor = Color(0xFF8B90A7);
  static const Color textDisableColor = Color(0xFFC1C1CC);

  // Gray Color.
  static const MaterialColor grayColor = MaterialColor(0xFFA6A6B0, <int, Color>{
    5: Color(0xFFFFFFFF),
    10: Color(0xFFF5F5FA),
    20: Color(0xFFEBEBF0),
    30: Color(0xFFDDDDE3),
    40: Color(0xFFC4C4CF),
    50: Color(0xFFA6A6B0),
    60: Color(0xFF808089),
    70: Color(0xFF64646D),
    80: Color(0xFF515158),
    90: Color(0xFF38383D),
    100: Color(0xFF27272A),
    150: Color(0xFF000000),
  });

  static Gradient defaultGradientBackground = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF33A36D),
      Color(0xFF28D481),
    ],
  );

  static Gradient blueGradientBackground = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.primaryColor,
      Color(0xFF0092F0),
    ],
  );

  static Gradient whiteGradientBackground = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(255, 255, 255, 1),
    ],
  );
}
