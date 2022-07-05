import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:intelligent_reader_app/FS/ChooseLocation.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

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
            SvgPicture.asset(
              'assets/images/svg/login_bg.svg',
              fit: BoxFit.fill,
              //  height: MediaQuery.of(context).size.height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            Container(
              height: sizeVal.height,
              width: sizeVal.width,
              child: Column(
                children: [
                  SizedBox(
                    height: sizeVal.height * 0.05,
                  ),
                  Text(
                    "data data",
                    style: TextStyle(fontSize: sizeVal.width * 0.1),
                  ),
                  Center(
                    child: Container(
                      width: sizeVal.width * 0.2,
                      height: 2,
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
                          child: Text("Phone Number",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: sizeVal.width * 0.05,
                              )),
                        ),
                        Container(
                            height: sizeVal.height * 0.05,
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Phone Number",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: sizeVal.width * 0.02,
                                ))),
                        OtpFields(),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: sizeVal.height * 0.1,
                          child:
                          Text("You will got an OTP on entered mobile number",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: sizeVal.width * 0.03,
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

          width: MediaQuery
              .of(context)
              .size
              .width * AppWidgetSize.appButtonWidth,
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
          child: Text("Send OTP",
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

}