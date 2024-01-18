import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'common/index.dart';
import 'di/di_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await dotenv.load(
    fileName: 'assets/env/.env_dev',
  );
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  // await getIt<PushNotificationHelper>().initialize();
  // await getIt<LocalNotificationHelper>().init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: LocalizationConstants.availableLocales,
          startLocale: LocalizationConstants.viLocale,
          path: LocalizationConstants.path,
          fallbackLocale: LocalizationConstants.viLocale,
          child: MyApp(),
        );
      },
    ),
  );
}
