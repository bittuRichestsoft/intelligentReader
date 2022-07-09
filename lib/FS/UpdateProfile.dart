

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_color.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:intelligent_reader_app/Constants/app_widgetsize.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Constants/ApiUrl.dart';
import '../Constants/AppFontFamily.dart';
import '../Utilities/GlobalUtility.dart';
import '../webApi/WebApi.dart';

class UpdateProfile extends StatefulWidget  {

  @override
  _updateProfileState createState() => _updateProfileState();

}

class _updateProfileState extends State<UpdateProfile>{

  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

List<String> lstGender = ['Mrs.', 'Mr.'];
  var countryCodeValue;
  TextEditingController name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
    var selectedComplaintType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appOrangeColor,
        title: Text(
          "Update Profile",
          style: TextStyle(
              fontFamily: AppFontFamily.RobotoMedium,
              color: AppColor.appWhiteColor,
              fontSize: MediaQuery.of(context).size.height *
                  AppWidgetSize.appContentFontSize),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          }  ,
        ),
      ),
      backgroundColor: AppColor.appWhiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
              topRight:
              Radius.circular(MediaQuery.of(context).size.width * 0.1),
            )),
        child: Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * AppWidgetSize.sideMargins,
            right: MediaQuery.of(context).size.width * AppWidgetSize.sideMargins,
          ),
          child: ListView(
            children: [
              nameAndGenderStaticText(),
              nameAndGender(),
              mobileNumber(),
              emailField(),
              address(),
              submitButton(),
             ],
          ),
       /*   Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child:  WebView(
              initialUrl: Uri.dataFromString('<html><body><a class="twitter-timeline" href="https://twitter.com/jeevanjyot20?ref_src=twsrc%5Etfw">Tweets by jeevanjyot20</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></iframe></body></html>', mimeType: 'text/html').toString(),
*//*<a class="twitter-timeline" href="https://twitter.com/jeevanjyot20?ref_src=twsrc%5Etfw">Tweets by jeevanjyot20</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>*//*
              javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (strUrl){
                debugPrint("strurl= ${strUrl}");
          },
            ),
          )*/
        ),
      ),
    );
  }

  Widget mobileNumber() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: phone_controller,
        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        onChanged: (text) {
         if(text.length>10){
            phone_controller.text = text.substring(0,10);
           phone_controller.selection = TextSelection.fromPosition(TextPosition(offset: phone_controller.text.length));
         }
        },
        style: TextStyle(
          color: Colors
              .black, /*fontSize: MediaQuery.of(context).size.height * 0.02*/
        ),
        decoration: InputDecoration(
          //  border: InputBorder.none,
          hintText: 'Phone Number',
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
    );
  }


  Widget address() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child:  TextFormField(
        controller: addressController,
        style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.RobotoMedium),
        maxLines: null,
        decoration:  InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          border: UnderlineInputBorder(),
          fillColor: AppColor.appHintColor,
          labelText: 'Address',
          hintText: 'Enter Your Address',
          labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
              color: AppColor.appHintColor,
              fontFamily: AppFontFamily.RobotoMedium),
        ),
      ),
    );
  }
  Widget emailField() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child:  TextFormField(
        controller: emailController,
        style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.RobotoMedium),
        maxLines: 1,
        decoration:  InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          border: UnderlineInputBorder(),
          fillColor: AppColor.appHintColor,
          labelText: 'Email Address',
          labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
              color: AppColor.appHintColor,
              fontFamily: AppFontFamily.RobotoMedium),
        ),
      ),
    );
  }

  Widget submitButton() {
    return GestureDetector(
      onTap: ()
      {

       updateProfileApi();
        // showUpdatedInfoBottomSheet();

      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * AppWidgetSize.sideMargins),
        width: MediaQuery.of(context).size.width * AppWidgetSize.appButtonWidth,
        height: MediaQuery.of(context).size.height * AppWidgetSize.appButtonHeight,
        decoration: BoxDecoration(

          color: AppColor.appOrangeColor,
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * AppWidgetSize.appButtonBorderRadius)),
        ),
        child:  Text(
            "Submit",
            style: TextStyle(color: AppColor.appWhiteColor,
                fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentFontSize,
                fontFamily: AppFontFamily.RobotoMedium
            )),
      ),
    );
  }


  showUpdatedInfoBottomSheet() {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08),
          topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          //  color: Colors.blueAccent
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
          // height: MediaQuery.of(context).size.height * 0.37,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [
                  SvgPicture.asset(ImagesString.SvgGroupLogin),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    "Thank You!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentFontSize,
                        fontFamily: AppFontFamily.RobotoMedium),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  Text(
                    "Lorem ipsum is simply dummy text of the \n printing and typesetting industry",
                    style: TextStyle(
                        color: AppColor.appHintColor,
                        fontSize: MediaQuery.of(context).size.height *
                            AppWidgetSize.appContentSmallFontSize,
                        fontFamily: AppFontFamily.RobotoMedium),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * AppWidgetSize.appButtonHeight,
                      // margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
                      decoration: BoxDecoration(
                        color: AppColor.appOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * AppWidgetSize.appButtonBorderRadius)),
                      ),
                      child: Text(
                          "OK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height *
                                  AppWidgetSize.appContentFontSize,
                              fontFamily: AppFontFamily.RobotoMedium)),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  updateProfileApi() async {
    var check_internet = await GlobalUtility().isConnected();
    var token = await GlobalUtility().getPrefValue(AppStrings.SESSION_ID);
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {
      if(validate())
      {
        Map map = {
          "name":name_controller.text,
          "email":emailController.text,
          "number":phone_controller.text,
          "address":addressController.text,
          "genderType":lstGender[0],
        };

        GlobalUtility().showLoaderDialog(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        String apiResponse = await WebApi().post_with_header_with_map(map, ApiUrl.updateProfile, token);

        setState(() {
          Navigator.of(context).pop();

          var jsondata = json.decode(apiResponse);
          String message = jsondata['message'];
          int status = jsondata['status'];

          if (status == 200) {

            showUpdatedInfoBottomSheet();

            // GlobalUtility().showToast(message);
          } else if (status == 400) {
            GlobalUtility().showSnackBar(message, context);
          } else if (status == 403) {
            GlobalUtility().setSessionEmpty(context);
          } else {
            GlobalUtility().showSnackBar(message, context);
          }
        });
      }

    } else {
      GlobalUtility().showSnackBar(AppStrings.PleaseCheckInternetConnection, context);
    }
  }

  bool validate() {
    if (addressController.text.replaceAll(" ", "") == "") {
      GlobalUtility().showSnackBar("Enter subject", context);
      return false;
    }
    if(selectedComplaintType == null)
    {
      GlobalUtility().showSnackBar("Choose Complaint Type", context);
      return false;
    }

    if (emailController.text.replaceAll(" ", "") == "") {
      GlobalUtility().showSnackBar("Enter emailController", context);
      return false;
    }

    return true;
  }

  Widget nameAndGenderStaticText() {
    return Container(
       margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Gender"),

          Text("Name"),
          SizedBox()

        ],
      ),
    );
  }
  Widget nameAndGender() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
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
                hint: Text(lstGender[0],
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
                items: lstGender.map((String country) {
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
       SizedBox(width: 15,),
          Flexible(
            flex: 6,
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TextField(
                    controller: name_controller,
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLines: 1,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: Colors
                          .black, /*fontSize: MediaQuery.of(context).size.height * 0.02*/
                    ),
/*
                    decoration: InputDecoration(
                      //  border: InputBorder.none,
                      hintText: 'Phone Number',
                      fillColor: Colors.black,
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        *//*  fontSize: MediaQuery.of(context).size.height * 0.02,*//*
                        *//* fontFamily: AppFontFamily.UBUNTU_MEDIUM*//*
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
                      *//*  suffixIcon: Visibility(
                      visible: isSendOtpVisible,
                      child: IconButton(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1),
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.editPencilIcon),
                      ),
                    ),*//*
                    ),*/
                    decoration:  InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
                      border: UnderlineInputBorder(),
                      fillColor: AppColor.appHintColor,
                      labelText: 'Address',
                      hintText: 'Enter Your Address',
                      labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
                          color: AppColor.appHintColor,
                          fontFamily: AppFontFamily.RobotoMedium),
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

}