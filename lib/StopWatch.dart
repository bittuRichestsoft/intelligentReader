
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StopWatch extends StatefulWidget {

  @override
  _stopWatchState createState() => _stopWatchState();

}

class _stopWatchState extends State<StopWatch>  with SingleTickerProviderStateMixin {

  Duration _elapsed = Duration.zero;
  // 2. declare Ticker
  late final Ticker _ticker;


  late int _totalNotifications;


  @override
  void initState() {
    super.initState();
    // 3. initialize Ticker
    _ticker = this.createTicker((elapsed) {
      // 4. update state
      setState(() {
        _elapsed = elapsed;
      });
    });
    // 5. start ticker
    _ticker.start();


    _totalNotifications = 0;
    registerNotification();
    print("Notification register done $_totalNotifications");


  }

  @override
  void dispose() {
    // 6. don't forget to dispose it
    _ticker.dispose();
    super.dispose();
  }
stopTicker(){
setState((){
  _ticker.stop();
});
}
  @override
  Widget build(BuildContext context) {
    // 7. pass the elapsed time to a widget
    // that shows the formatted text as mm:ss:hh
    return Column(
      children: [
        Text(""+_elapsed.toString()),
      const SizedBox(height: 30,),
      TextButton(
        onPressed: (){
          _ticker.stop(); }, child: const Text("stop",
      ),
      ),
        TextButton(
          onPressed: (){
            _ticker.start();
          }, child: const Text("Start",
        ),
        ),

      ],
    );
  }

  void registerNotification() async {
    Firebase.initializeApp().whenComplete(() {
      print("Firebase.initializeApp() completed");
      getToken();
      setState(() {});
    });
    await Firebase.initializeApp();

    var messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission 1');
    } else {
      print('User declined or has not accepted permission');
    }
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission 2');

    } else {
      print('User declined or has not accepted permission');
    }


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      print('User granted permission 3 message=${message.data.toString()}');
      setState(() {

        _totalNotifications++;
      });
    });

  }
  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint("token= $token");
  }

}

class PushNotification{
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
