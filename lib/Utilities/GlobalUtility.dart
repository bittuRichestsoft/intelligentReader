
import 'dart:io';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
//import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:intelligent_reader_app/FS/EnterMobileNumber.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class GlobalUtility {






  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }


  void showSnackBar(String message, BuildContext context)
  {
    final snackBar = SnackBar(

      duration: Duration(seconds: 1),
      content:  Text(message),
    /*  action: SnackBarAction(
        label: 'ok',

        onPressed: () {

          // Some code to undo the change.

        },
      ),*/
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2);
  }


  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content:   Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text( 'please_wait')),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  bool validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      debugPrint("mobiletrue");
      return true;
    }

    else if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint("wifitrue");
      return true;
    }
    return false;
  }

  /*getDeviceName() async
  {
    String mobilename="";

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      prefs.setString("DEVICE_NAME", androidInfo.model!);

      debugPrint("device name" + androidInfo.model!);
      mobilename = androidInfo.model!;
    }

    else if (Platform.isIOS) {

      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      prefs.setString("DEVICE_NAME", iosInfo.model!);
      debugPrint("device name" + iosInfo.model!);
      mobilename = iosInfo.model!;
    }

    return mobilename;

  }
*/

  void setSessionEmpty(BuildContext context)  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

   // prefs.remove(AppString.SESSION_ID);
    prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => EnterMobileNumber(),
      ),
          (route) => false,
    );

  }

  void setSession(String sessionId,String mobile,String userId,String countryCode) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

/*
    prefs.setString(AppStrings.SESSION_ID,sessionId);
    prefs.setString(AppString.PHONE,mobile);
    prefs.setString(AppString.USER_ID,userId);
    prefs.setString(AppString.COUNTRY_CODE,countryCode);
*/

    debugPrint("sessionIdSaved $sessionId  phone<><> $mobile  user_id<><><> $userId  countryCode<><><><> $countryCode");

  }


  
  getPrefValue(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value=prefs.getString(key);
    return value;
  }



 /* void saveFirebaseToken(String firebToken) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(AppString.FIREBASE_TOKEN, firebToken);

    debugPrint("saveFirebaseToken<><><><> " + firebToken.toString());

  }


  void setProfileComplete(bool isProfileComplete) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(AppString.IS_PROFILE_COMPLETE, isProfileComplete);

    debugPrint("setProfileComplete value " + isProfileComplete.toString());

  }


  void setName(String name) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppString.NAME,name);

    debugPrint("nameSaved $name");

  }

  void updatePhone(String mobile) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppString.PHONE,mobile);

    debugPrint("phone<><> $mobile");

  }

  void setUserData(String profileImage,String firstName,String lastName,String gender,
      String oldVillage, String currentLocation,String occupation, String enterInfo,

      String designation,String country,String state,String city,String pincode,String gotra,
      String height, String weight, String email,String dob,String highestQualification) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(AppString.USER_PROFILE_IMAGE,profileImage);
    prefs.setString(AppString.FIRST_NAME,firstName);
    prefs.setString(AppString.LAST_NAME,lastName);
    prefs.setString(AppString.GENDER,gender);
    prefs.setString(AppString.OLD_VILLAGE,oldVillage);
    prefs.setString(AppString.CURRENT_LOCATION,currentLocation);
    prefs.setString(AppString.OCCUPATION,occupation);
    prefs.setString(AppString.ENTER_INFO,enterInfo);

    prefs.setString(AppString.DESIGNATION,designation);
    prefs.setString(AppString.COUNTRY,country);
    prefs.setString(AppString.STATE,state);
    prefs.setString(AppString.CITY,city);
    prefs.setString(AppString.PINCODE,pincode);
    prefs.setString(AppString.GOTRA,gotra);

    prefs.setString(AppString.HEIGHT,height);
    prefs.setString(AppString.WEIGHT,weight);
    prefs.setString(AppString.EMAIL,email);
    prefs.setString(AppString.DOB,dob);
    prefs.setString(AppString.HIGHEST_QUALIFICATION,highestQualification);

    debugPrint("setUserDataSaved $firstName");

  }

*/
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    }
    else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }


/*
  void changeLanguage(Language language,BuildContext context) async {
    Locale _locale = await setLocale(language.languageCode);
    SplashPage.setLocale(context, _locale);
  }
*/


}