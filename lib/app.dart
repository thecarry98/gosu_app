import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/index.dart';
import 'di/di_setup.dart';
import 'gen/fonts.gen.dart';
import 'routes/app_pages.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRoute = getIt<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
          ScreenUtilsConfig.designWidth,
          ScreenUtilsConfig.designHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primaryColor: AppColors.primaryColor[600],
              fontFamily: FontFamily.raleway,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: AppColors.primaryColor[600],
                    displayColor: AppColors.primaryColor[600],
                    fontFamily: FontFamily.raleway,
                  ),
              tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
                    labelStyle: Theme.of(context).tabBarTheme.labelStyle?.copyWith(
                          fontFamily: FontFamily.raleway,
                        ),
                  ),
            ),
            routerDelegate: _appRoute.delegate(),
            routeInformationParser: _appRoute.defaultRouteParser(),
          );
        });
  }
}
