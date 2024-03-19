import 'dart:io';

import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/appointment_chat_screen/appointment_chat_screen_controller.dart';
import 'package:doctor_flutter/screen/message_chat_screen/message_chat_screen_controller.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  PrefService prefService = PrefService();
  String languageCode = Platform.localeName.split('_')[0];

  @override
  void onInit() {
    fetchSettingData();
    FlutterAppBadger.removeBadge();
    saveTokenUpdate();
    // amrFcm();
    super.onInit();
  }

  void fetchSettingData() {
    ApiService.instance.fetchGlobalSettings().then((value) {
      dollar = value.data?.currency == null || value.data!.currency!.isEmpty
          ? '\$'
          : (value.data?.currency ?? '\$');
    });
  }

  void saveTokenUpdate() async {
    await firebaseMessaging.subscribeToTopic(ConstRes.subscribeTopic);

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions();

    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      androidChannelId, // id
      S.current.doctor, // title
      playSound: true,
      enableLights: true,
      enableVibration: true,
      importance: Importance.max,
    );

    /// Required to display a heads up notification (For iOS)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        const AndroidInitializationSettings initializationSettingsAndroid =
            AndroidInitializationSettings('@mipmap/flutter_luancher');
        const DarwinInitializationSettings initializationSettingsIOS =
            DarwinInitializationSettings(
                requestAlertPermission: false,
                requestSoundPermission: false,
                requestBadgePermission: false);

        const InitializationSettings initializationSettings =
            InitializationSettings(
                android: initializationSettingsAndroid,
                iOS: initializationSettingsIOS);

        flutterLocalNotificationsPlugin.initialize(initializationSettings);
        RemoteNotification? notification = message.notification;
        // if (message.data[nNotificationType] == '0') {
        //   if (message.data[senderId] != MessageChatScreenController.senderId) {
            showNotification(channel: channel, notification: notification);
          // }
        // }
        // if (message.data[nNotificationType] == '1') {
        //   if (message.data[nAppointmentId] !=
        //       AppointmentChatScreenController.appointmentId) {
        //     showNotification(channel: channel, notification: notification);
        //   }
        // }
      },
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  void showNotification(
      {RemoteNotification? notification,
      required AndroidNotificationChannel channel}) {
    flutterLocalNotificationsPlugin.show(
      1,
      notification?.title,
      notification?.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
        ),
        iOS: const DarwinNotificationDetails(
          presentSound: false,
          presentAlert: false,
          presentBadge: false,
        ),
      ),
    );
  }
  // void amrFcm ()async{
  //   await FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //
  //     // Handle FCM messages when the app is resumed from the background
  //     print("onMessageOpenedApp: $message");
  //     // Navigate to a specific screen or update the UI based on the message content
  //   });
  //
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // }
  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   print("Handling a background message: ${message.messageId}");
  //   // You can perform background processing here
  // }
}
