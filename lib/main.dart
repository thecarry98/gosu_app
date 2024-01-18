// import 'dart:developer';

// import 'package:device_preview/device_preview.dart';
// import 'package:easy_localization/easy_localization.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'common/index.dart';
// // import 'common/notification/local_notification_helper.dart';
// // import 'common/notification/push_notification_helper.dart';
// import 'di/di_setup.dart';
// // import 'firebase_options.dart';
// import 'gen/fonts.gen.dart';
// import 'routes/app_pages.dart';

// String envConfig(String flavor) {
//   switch (flavor) {
//     case 'dev':
//       return 'assets/env/.env_dev';
//     case 'staging':
//       return 'assets/env/.env_staging';
//     case 'production':
//       return 'assets/env/.env_production';
//     default:
//       return 'assets/env/.env_dev';
//   }
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
//   const flavor = String.fromEnvironment('flavor', defaultValue: 'x');
//   log("flavor: $flavor");
//   await dotenv.load(
//     fileName: envConfig(flavor),
//   );
//   await EasyLocalization.ensureInitialized();
//   configureDependencies();
//   // await getIt<PushNotificationHelper>().initialize();
//   // await getIt<LocalNotificationHelper>().init();
//   runApp(
//     DevicePreview(
//       enabled: false,
//       builder: (context) {
//         return EasyLocalization(
//           supportedLocales: LocalizationConstants.availableLocales,
//           startLocale: LocalizationConstants.viLocale,
//           path: LocalizationConstants.path,
//           fallbackLocale: LocalizationConstants.viLocale,
//           child: MyApp(),
//         );
//       },
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final _appRoute = getIt<AppRouter>();

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(
//           ScreenUtilsConfig.designWidth,
//           ScreenUtilsConfig.designHeight,
//         ),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return MaterialApp.router(
//             localizationsDelegates: context.localizationDelegates,
//             supportedLocales: context.supportedLocales,
//             locale: context.locale,
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               useMaterial3: true,
//               primaryColor: AppColors.primaryColor[600],
//               fontFamily: FontFamily.raleway,
//               textTheme: Theme.of(context).textTheme.apply(
//                     bodyColor: AppColors.primaryColor[600],
//                     displayColor: AppColors.primaryColor[600],
//                     fontFamily: FontFamily.raleway,
//                   ),
//               tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
//                     labelStyle: Theme.of(context).tabBarTheme.labelStyle?.copyWith(
//                           fontFamily: FontFamily.raleway,
//                         ),
//                   ),
//             ),
//             routerDelegate: _appRoute.delegate(),
//             routeInformationParser: _appRoute.defaultRouteParser(),
//           );
//         });
//   }
// }
