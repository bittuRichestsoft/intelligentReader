import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';

import '../Constants/ApiUrl.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
import '../Utilities/GlobalUtility.dart';
import '../webApi/WebApi.dart';
import 'OTPVerify.dart';

class EnterMobileNumber extends StatefulWidget {
  @override
  _enterMobileNumberState createState() => _enterMobileNumberState();
}

class _enterMobileNumberState extends State<EnterMobileNumber> {
  var sizeVal;
  TextEditingController phone_controller = TextEditingController();
  List<String> countriesList = ["+91"];
  var countryCodeValue;
  bool isNumberEnabled = true;

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery.of(context).size;
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
                ) ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Your Phone!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: sizeVal.width * 0.05,
                          )),
                    ),
                Container(
               height:sizeVal.height*0.04 ,
                  alignment: Alignment.centerLeft,
                  child: Text("Phone Number",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: sizeVal.width * 0.02,
                        ))),
                    phoneField(),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: sizeVal.height * 0.1,
                      child:
                          Text("A 4 digit OTP will be sent via SMS to verify your mobile number!",
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

  Widget phoneField() {
    return Container(
         height: MediaQuery.of(context).size.height * 0.07,
   //   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: DropdownButtonFormField(
                focusColor: AppColor.appOrangeColor,
                isDense: true,
                isExpanded: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    /*fontFamily: AppFontFamily.UBUNTU_MEDIUM,*/
                    /*fontSize: MediaQuery.of(context).size.height *
                        AppWidgetSize.appXXSmallContentTitleFontSize*/
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.appBlackColor)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appBlackColor),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appBlackColor),
                  ),
                ),
                hint: Text(countriesList[0],
                    style: TextStyle(
                      color: Colors.grey,
                      /*  fontFamily: AppFontFamily.UBUNTU_MEDIUM,*/
                    ),
                    textAlign: TextAlign.right),
                icon: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ),
                items: countriesList.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          country,
                          style: TextStyle(
                            color: Colors.black,
                            /*    fontFamily: AppFontFamily.UBUNTU_LIGHT,*/
                          ),
                        ),

                        //  Image.network(category.flag,height: 20,width: 20,)
                      ],
                    ),
                  );
                }).toList(),
                value: countryCodeValue,
                onChanged: (valueSelectedByUser) {
                  setState(() {});
                }),
          ),
          Flexible(
            flex: 6,
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TextField(
                    enabled: isNumberEnabled,
                    controller: phone_controller,
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: Colors
                          .black, /*fontSize: MediaQuery.of(context).size.height * 0.02*/
                    ),

                    decoration: InputDecoration(
                      //  border: InputBorder.none,
                      hintText: 'Enter Number',
                      fillColor: Colors.black,
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        /*  fontSize: MediaQuery.of(context).size.height * 0.02,*/
                        /* fontFamily: AppFontFamily.UBUNTU_MEDIUM*/
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appBlackColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appBlackColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appBlackColor),
                      ),
                      /*  suffixIcon: Visibility(
                      visible: isSendOtpVisible,
                      child: IconButton(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1),
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.editPencilIcon),
                      ),
                    ),*/
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget sendOtpButton() {
    return GestureDetector(
      onTap: () {
//        sendOtpApi();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   OTPVerify(phone_controller.text)),
        );
      },
      child: Visibility(
        visible: true,
        child: Container(
          alignment: Alignment.center,

           height:
          MediaQuery.of(context).size.height * AppWidgetSize.appButtonHeight,
          decoration: BoxDecoration(
            color: AppColor.appOrangeColor,
            borderRadius: BorderRadius.all(Radius.circular(
                MediaQuery.of(context).size.width *
                    AppWidgetSize.appButtonBorderRadius)),
          ),
          child: Text("Send OTP",
              style: TextStyle(
                  color: AppColor.appWhiteColor,
                  fontSize: MediaQuery.of(context).size.height *
                      AppWidgetSize.appContentFontSize,
                  /*fontFamily: AppFontFamily.UBUNTU_MEDIUM*/)),
        ),
      ),
    );
  }
  sendOtpApi( ) async {

    var check_internet = await GlobalUtility().isConnected();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {
      Map map = {
        "phone": phone_controller.text,
        "country_code": countryCodeValue,
      };

      GlobalUtility().showLoaderDialog(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      String apiResponse = await WebApi().send_request_with_map(map, ApiUrl.SEND_OTP);
      setState(() {
        Navigator.of(context).pop();
        var jsondata = json.decode(apiResponse);
        String message = jsondata['message'];
        int status = jsondata['status'];
        if (status == 200) {

          GlobalUtility().showToast(message);
        } else if (status == 400) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OTPVerify(phone_controller.text)),
          );
          // GlobalUtility().showSnackBar(message, context);
        } else if (status == 403) {
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
