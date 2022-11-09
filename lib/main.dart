// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelligent_reader_app/FS/EnterMobileNumber.dart';
import 'package:intelligent_reader_app/FS/HomeFlash.dart';
import 'package:intelligent_reader_app/StopWatch.dart';
import 'package:intelligent_reader_app/firebase_notification/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utilities/PreferenceUtils.dart';


void main() async {

  if (!kIsWeb) _setTargetPlatformForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

void _setTargetPlatformForDesktop() {
  TargetPlatform? targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  String firebaseToken = "";
  String sessionId = "";
  String TAG="_MyAppState ";
  @override
  void initState() {
    getPhone();
      FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
      _firebaseMessaging.getToken().then((token){
        print("token is $token");
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        FirebaseServiceClass().checkNotification(message);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
      FirebaseMessaging.onBackgroundMessage(
          FirebaseServiceClass().firebaseMessagingBackgroundHandler);
      debugPrint("firebase token ${_firebaseMessaging.getToken().toString()}");

    //getSessionId();
     }


  Future<void> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String patientSession = await /*added */ prefs.getString('session_id').toString();
    print(TAG+"patientSession="+patientSession.toString());

    setState(() => sessionId =  patientSession.toString());
  }

  getSessionId() async{
    PreferenceUtils preferenceUtils =   PreferenceUtils();
    String      strSession= await  preferenceUtils.getSessionId().toString();
    debugPrint(TAG+"session_id in main=$strSession");

    setState(() {
      sessionId=strSession;

    });
  }




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: /*HomeFlash(0)*/
      StopWatch()
     /* (sessionId == null || sessionId == "" ||  sessionId.toLowerCase() == "null"  )
          ? EnterMobileNumber()
          : HomeFlash(0),
      debugShowCheckedModeBanner: false,*/
      );
  }

//background




}

