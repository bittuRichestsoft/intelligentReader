import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  Future<String>    getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = ""+prefs.getString('session_id').toString();
    debugPrint("getSessionId()= $stringValue");
    return ""+stringValue;
  }

  setSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session_id', ""+sessionId);
  }

  setFirebaseToken(String firebaseToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firebase_token', ""+firebaseToken);
  }

  getFirebaseToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = ""+prefs.getString('firebase_token').toString();
    debugPrint("firebase_token in shared pref= $stringValue");
    return stringValue;
  }


  setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email',""+email);
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String  stringValue = prefs.getString('email').toString();
    debugPrint("email in shared pref= $stringValue");
    return stringValue;
  }


  setProfilePic(String profilePic) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profilePic',""+profilePic);
  }

  getProfilePic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String  stringValue = prefs.getString('profilePic').toString();
    debugPrint("profilePic in shared pref= $stringValue");
    return stringValue;
  }


  setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name',""+name);
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String  stringValue = prefs.getString('name').toString();
    debugPrint("name in shared pref= $stringValue");
    return stringValue;
  }
/*loginResponse!.data!.token!,
              "${loginResponse!.data!.firstName} ${loginResponse!.data!.lastName.toString()}",
              profilepicture,
              loginResponse!.data!.email.toString()*/

  setUserData(
      String strSessionToken, String name, String profilePic,String strEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session_id',strSessionToken);
    prefs.setString('name',name);
    prefs.setString('profilePic',profilePic);
    prefs.setString('email',strEmail);
  }

  sharedPreferencesClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


}
