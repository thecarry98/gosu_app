// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class FirebaseUtils {
//   // Khởi tạo module firebase
//   static Future<void> installSDK() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();

//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   // Lấy fcm token
//   static Future<void> getFcmToken() async {
//     String? fcmToken = await FirebaseMessaging.instance.getToken();
//     if (fcmToken != null) {
//       log(fcmToken);
//     }
//   }

//   // Khi app đang mở
//   static Future<void> pushNotification() async {
//     AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.high,
//     );
//     InitializationSettings initSetting = const InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//         iOS: DarwinInitializationSettings());
//     FlutterLocalNotificationsPlugin fltNotification = FlutterLocalNotificationsPlugin();
//     await fltNotification
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     fltNotification.initialize(initSetting,
//        );

//     var generalNotificationDetails = NotificationDetails(
//         android: AndroidNotificationDetails(channel.id, channel.name,
//             channelDescription: channel.description ?? '',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker'),
//         iOS: const DarwinNotificationDetails());

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         fltNotification.show(notification.hashCode, notification.title, notification.body,
//             generalNotificationDetails,
//             payload: jsonEncode(message.data));
//       }
//     });
//   }

//   //Khi app đóng và mở app
//   static void pushNotificationOpenedApp() {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) async {
//       print('Application opened from Notification');
//       onSelectNotificationOpenedApp?.call(message);
//     });
//   }

//   //Khi app đóng và mở app
//   static void initialMessage() {
//     FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
//       if (message != null) {
//         onSelectNotificationOpenedApp?.call(message);
//       }
//     });
//   }

//   static void setBackgroundMessage() {
//     FirebaseMessaging.instance.requestPermission();
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print('Application opened from Notification _firebaseMessagingBackgroundHandler');
//     // WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//   }

//   // Thực hiện một tác vụ nào đó khi app đang mở
//   static Function(String? string)? onSelectNotification;

//   // Thực hiện một tác vụ nào đó khi app từ background
//   static Function(RemoteMessage? message)? onSelectNotificationOpenedApp;

//   // Khởi tạo remote config
//   static Future<RemoteConfig> installRemoteConfig() async {
//     final RemoteConfig remoteConfig = RemoteConfig.instance;
//     RemoteConfigValue(null, ValueSource.valueStatic);
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//         fetchTimeout: const Duration(seconds: 1), minimumFetchInterval: Duration.zero));
//     await remoteConfig.fetchAndActivate();
//     return remoteConfig;
//   }

//   // lấy về data dạng json
//   Future<Map<String, dynamic>> getAllValue() async {
//     final RemoteConfig remoteConfig = await installRemoteConfig();
//     Map<String, dynamic> remoteData = remoteConfig.getAll();
//     log("Remote config all data: " + jsonDecode(remoteData['data'].asString()).toString());
//     return remoteData;
//   }
// }