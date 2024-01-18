// import 'dart:developer';

// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';


// class FirebaseModule {
//   static Future<RemoteConfig> setupRemoteConfig() async {
//     final RemoteConfig remoteConfig = RemoteConfig.instance;

//     // await remoteConfig.setDefaults(<String, dynamic>{'baseUrl': ''});
//     RemoteConfigValue(null, ValueSource.valueStatic);
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//       fetchTimeout: const Duration(seconds: 60),
//       minimumFetchInterval: Duration.zero,
//     ));
//     await remoteConfig.fetchAndActivate();

//     return remoteConfig;
//   }

//   static Future sendAnalytics({
//     String? name,
//     String? screen,
//     String? message,
//     String? error,
//     String? stackTrace,
//   }) async {
//     await FirebaseAnalytics.instance.logEvent(name: name ??= 'Constant.stackTraceError', parameters: {
//       'screen': screen ?? '',
//       'message': message ?? '',
//       'error': error ?? '',
//       'stackTrace': stackTrace ?? ''
//     }).then((value) => log('Gửi stack trace thành công'));
//   }
// }