import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:intelligent_reader_app/FS/ChooseLocation.dart';
import 'package:intelligent_reader_app/FS/EnterMobileNumber.dart';
import 'package:intelligent_reader_app/FS/HomeFlash.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../Constants/ApiUrl.dart';
import '../Constants/AppFontFamily.dart';
import '../Constants/ImagesString.dart';
import '../Constants/app_color.dart';
import '../Constants/app_strings.dart';
import '../Constants/app_widgetsize.dart';
import '../Utilities/GlobalUtility.dart';
import '../Utilities/PreferenceUtils.dart';
import '../webApi/WebApi.dart';


class OTPVerify extends StatefulWidget {
  String number= "";
  String strOTP= "";
  OTPVerify(holdNumber,holdOTP){
    number=holdNumber;
    strOTP=holdOTP;
  }

  @override
  _oTPVerifyState createState() => _oTPVerifyState(number,strOTP);
}

class _oTPVerifyState extends State<OTPVerify> {

  var sizeVal;
  OtpFieldController otpController = OtpFieldController();
  String completeOtp = "";
  var countryCodeValue;
  bool isNumberEnabled = true;
  String phnNmbr="";
  String otp="";

  _oTPVerifyState(holdNumber,holdOTP){
    phnNmbr=holdNumber;
    otp=holdOTP;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  GlobalUtility().showSnackBar(otp, context);

}

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Stack(
          children: [
            Image(image: AssetImage(
              ImagesString.cheerful_plumber_plumber_png,),fit:BoxFit.fitWidth,
              height: sizeVal.height,
              width: sizeVal.width,),
            Container(
              height: sizeVal.height,
              width: sizeVal.width,
              color: Colors.grey.withOpacity(0.8),),
            Container(
              height: sizeVal.height,
              width: sizeVal.width,
              child: Column(
                children: [
                  SizedBox(
                    height: sizeVal.height * 0.07,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.09,
                    width: MediaQuery.of(context).size.width*0.6,

                    child: SvgPicture.asset(
                      ImagesString.flash_services_text,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: sizeVal.height * 0.02,
                  ),
                  Center(
                    child: Container(
                      width: sizeVal.width * 0.1,
                      height: sizeVal.height*0.005,
                      color: Colors.deepPurpleAccent,
                    ),
                  )
                ],
              ),
            ),

            Center(
              child: Container(
                height: sizeVal.height * 0.4,
                alignment: Alignment.centerLeft,

                width: sizeVal.width * 0.9,
                //  color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                    border: Border.all(
                      color: AppColor.appOrangeColor,
                      width: 1,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("OTP Verification",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: sizeVal.width * 0.05,
                              )),
                        ),
                        Container(
                            height: sizeVal.height * 0.05,
                            alignment: Alignment.centerLeft,
                            child: Text("Enter the OTP you received to",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: sizeVal.width * 0.02,
                                ))),
                    numberAndEdit(),
                        OtpFields(),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: sizeVal.height * 0.08,
                          child:
                          Text("Resend OTP",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: sizeVal.width * 0.035,
                              color: AppColor.linkedInButtonColor
                              )),
                        ),
                        verifyOtpButton()
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      // }  )
    );
  }

  Widget verifyOtpButton() {
    return GestureDetector(
      onTap: () {
        callVerifyOtpApi();
       /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   ChooseLocation()),
        );*/

      },
      child: Visibility(
        visible: true,
        child: Container(
          alignment: Alignment.center,

          height:
          MediaQuery
              .of(context)
              .size
              .height * AppWidgetSize.appButtonHeight,
          decoration: BoxDecoration(
            color: AppColor.appOrangeColor,
            borderRadius: BorderRadius.all(Radius.circular(
                MediaQuery
                    .of(context)
                    .size
                    .width *
                    AppWidgetSize.appButtonBorderRadius)),
          ),
          child: Text("Login",
              style: TextStyle(
                color: AppColor.appWhiteColor,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height *
                    AppWidgetSize.appContentFontSize,
                /*fontFamily: AppFontFamily.UBUNTU_MEDIUM*/)),
        ),
      ),
    );
  }


 Widget  OtpFields() {
 return OTPTextField(
 controller: otpController,
 length: 4,
 width: MediaQuery.of(context).size.width * 0.6,
 fieldWidth: MediaQuery.of(context).size.width * 0.11,
 style: TextStyle(fontSize: 17),
 textFieldAlignment: MainAxisAlignment.spaceBetween,
 fieldStyle: FieldStyle.underline,
 onCompleted: (pin) {
 //print("Completed: " + pin);
 completeOtp = pin;
 callVerifyOtpApi();
 },
 onChanged: (pin){
 print("on Changed: " + pin);
 completeOtp = pin;
 },
  );
  }

  numberAndEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("+91$phnNmbr  $otp",
      style: TextStyle(
        color: AppColor.appBlackColor,
        fontSize: MediaQuery
            .of(context)
            .size
            .height *
            AppWidgetSize.appContentFontSize,
          fontWeight: FontWeight.bold,
        fontFamily: AppFontFamily.RobotoMedium)),

    InkWell(
      onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>   EnterMobileNumber()),
        );
      },
      child: Text("Edit Number",
        style: TextStyle(
          color: AppColor.linkedInButtonColor,
          fontSize: MediaQuery
              .of(context)
              .size
              .height *
              AppWidgetSize.appContentFontSize,
          /*fontFamily: AppFontFamily.UBUNTU_MEDIUM*/)),
    )
    ],);
  }
  callVerifyOtpApi( ) async {

    var check_internet = await GlobalUtility().isConnected();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {
      Map map = {
        "Phone": phnNmbr,
        "OTP":completeOtp,
      };

      GlobalUtility().showLoaderDialog(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      String apiResponse = await WebApi().send_request_with_map(map, ApiUrl.VerifyOTP);
      setState(() {
        Navigator.of(context).pop();
        var jsondata = json.decode(apiResponse);
        String message = jsondata['Message'];
        String status = jsondata['Code'];
        if (status == "200") {
          String token = jsondata['token'];

           PreferenceUtils preferenceUtils= PreferenceUtils();
           preferenceUtils.setSessionId(token);
          String email = jsondata['Email'];
preferenceUtils.setEmail(email);
           /*"token": "Zm9zOGplVDFldUhkcndwa0NJWmdBcWJrekgxNWNPaGoyWGpZSDhudVVDYTRDWEg2WEtyV3ZiSWdKV3M462fd7654a2dcf",
    "customerId": 1190,
    "Name": "bittu test User",
    "Email": "iww.bittu@gmail.com",
    "Number": "9855748751",
    "ReferCode": "bi72482",
    "ReferBy": "",
    "IsUpdatedProfile": 1
*/
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>   HomeFlash(0)),
          );

        } else if (status == "400") {

          GlobalUtility().showSnackBar(message, context);
        } else if (status == "403") {
          GlobalUtility().setSessionEmpty(context);
        } else {
          GlobalUtility().showSnackBar(message, context);
        }
      });
    } else {
      GlobalUtility()
          .showSnackBar(AppStrings.PleaseCheckInternetConnection, context);
    }
  }

}