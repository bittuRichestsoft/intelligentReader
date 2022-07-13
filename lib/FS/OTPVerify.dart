import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:intelligent_reader_app/FS/ChooseLocation.dart';
import 'package:intelligent_reader_app/FS/EnterMobileNumber.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../Constants/AppFontFamily.dart';
import '../Constants/ImagesString.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';


class OTPVerify extends StatefulWidget {
  String number= "";
  OTPVerify(holdNumber){
    number=holdNumber;
  }

  @override
  _oTPVerifyState createState() => _oTPVerifyState(number);
}

class _oTPVerifyState extends State<OTPVerify> {

  var sizeVal;
  OtpFieldController otpController = OtpFieldController();
  String completeOtp = "";
  var countryCodeValue;
  bool isNumberEnabled = true;
  String phnNmbr="";

  _oTPVerifyState(holdNumber){
    phnNmbr=holdNumber;
  }


  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Stack(
          children: [

            Image(image: AssetImage(          ImagesString.cheerful_plumber_plumber_png,),fit:BoxFit.fitWidth,
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
                        sendOtpButton()
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

  Widget sendOtpButton() {
    return GestureDetector(
      onTap: () {
        /* sendOtpApi();*/
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   ChooseLocation()),
        );

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
      Text("+91$phnNmbr",
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

}