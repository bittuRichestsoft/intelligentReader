import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelligent_reader_app/FS/EnterMobileNumber.dart';
import 'package:intelligent_reader_app/FS/FirstPage.dart';
import 'package:intelligent_reader_app/FS/FourthPage.dart';
import 'package:intelligent_reader_app/FS/HomeFlash.dart';
import 'package:intelligent_reader_app/FS/MapSample/MapPage.dart';
import 'package:intelligent_reader_app/FS/SubCategoryLst.dart';
import 'package:intelligent_reader_app/FS/ThirdPage.dart';
import 'package:intelligent_reader_app/FS/UpdateProfile.dart';
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
          ? HomeFlash(0)/*HomeFlash( )*//*UpdateProfile()*/
          : HomeFlash(0)/*HomeFlash( )*//*UpdateProfile()*/,
      debugShowCheckedModeBanner: false,
      );
  }

//background




}

