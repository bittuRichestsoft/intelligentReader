import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelligent_reader_app/View/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/HomeScreen.dart';
import 'Utilities/PreferenceUtils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
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
      home: (sessionId == null || sessionId == "" ||  sessionId.toLowerCase() == "null"  )
          ? LoginScreen( )
          : HomeScreen(),
      debugShowCheckedModeBanner: false,
      /*builder: (context, child1) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width ,
          decoration: const BoxDecoration(
            image:   DecorationImage(
              image:   AssetImage("images/png/splash.png"),
              fit: BoxFit.fill,
            )
          ),
        );
      },*/);
  }

//background




}

