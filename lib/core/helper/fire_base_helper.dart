import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/logger.dart';
import 'package:di/di.dart';
import 'package:domain/features/auth/use_case/register_fcm_token_use_case.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rahtk_mobile/core/helper/injector.dart';

class FirebaseNotifications {
  final _firebaseMessaging = FirebaseMessaging.instance;
  static var notificationStreamController = StreamController<int>.broadcast();
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notification',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
  );
  final _localNotification = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future<void> initLocalNotification() async {
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(
      android: android,
    );

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      sound: true,
      alert: true,
      badge: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger.D("Title: ${message.notification?.title ?? 'No Title'}");
      Logger.D("Body: ${message.notification?.body ?? 'No Body'}");
      notificationStreamController.sink.add(1);
      if (message.notification != null) {
        _localNotification.show(
          message.notification!.hashCode,
          message.notification!.title ?? 'No Title',
          message.notification!.body ?? 'No Body',
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@mipmap/ic_launcher',
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      }
    });
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _firebaseMessaging.getToken().then((token) async {
          Logger.D("fcm token $token");
          IUserLocal userLocal = getIt<IUserLocal>();
          userLocal.setFcmToken(token ?? "");
          RegisterFcmTokenUseCase registerFcmTokenUseCase = diInjector<RegisterFcmTokenUseCase>();
          await registerFcmTokenUseCase.call();
          await initPushNotification();
          await initLocalNotification();
        }).catchError((error) {
          Logger.D("error$error");
        });
      } else {
        Logger.D("not connected");
      }
    } on SocketException catch (e) {
      Logger.D("not connected ${e.message}");
    }
  }
}

Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  if (message != null && message.notification != null) {
    Logger.D("Title: ${message.notification!.title ?? 'No Title'}");
    Logger.D("Body: ${message.notification!.body ?? 'No Body'}");
  }
}