// ignore_for_file: unnecessary_null_comparison, prefer_interpolation_to_compose_strings

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseServiceClass {
  void showNotification(String title, String body) async {
    FlutterLocalNotificationsPlugin fltNotification =
    FlutterLocalNotificationsPlugin();

    var androidInit = const AndroidInitializationSettings('mipmap/ic_launcher');

    var iosInit = const IOSInitializationSettings();

    var initSetting =
    InitializationSettings(android: androidInit, iOS: iosInit);

    fltNotification.initialize(initSetting);

    var androidDetails = const AndroidNotificationDetails('1', 'channelName',
        importance: Importance.high, priority: Priority.high);

    var iosDetails = const IOSNotificationDetails(
        sound: '', presentAlert: true, presentBadge: true, presentSound: true);

    var generalNotificationDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);

    await fltNotification.show(0, title, body, generalNotificationDetails,
        payload: 'Notification');
  }

  checkNotification(RemoteMessage message) {
    debugPrint(' default Message data: ${message.data}');

    if (message.data != null && message.data.isNotEmpty) {
      // in case of backend
      debugPrint(
          'Message data: ${message.data} \n Message title: ' +
              message.data['title'].toString() +
              '\n Message body: ${message.data['body'].toString()}');
      showNotification(
          message.data['title'].toString(), message.data['body'].toString());
    } else {
      // in case of firebase
      debugPrint(
          'Message notification : ${message.notification} \n Message title: ' +
              message.notification!.title! +
              "\n Message body:${message.notification!.body!}");
      showNotification(
          message.notification!.title!, message.notification!.body!);
    }
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    debugPrint("Handling a background message: ${message.messageId}");
    checkNotification(message);
  }
}
