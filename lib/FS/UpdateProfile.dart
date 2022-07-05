

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_color.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:intelligent_reader_app/Constants/app_widgetsize.dart';

import '../Constants/AppFontFamily.dart';
import '../Utilities/GlobalUtility.dart';

class UpdateProfile extends StatefulWidget  {

  @override
  _updateProfileState createState() => _updateProfileState();

}

class _updateProfileState extends State<UpdateProfile>{

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

List<String> lstGender = ['Mrs., Mr.'];


  var selectedComplaintType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appOrangeColor,
        title: Text(
          "Update Profile",
          style: TextStyle(
              fontFamily: AppFontFamily.UBUNTU_MEDIUM,
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
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Complaint Form",
                  style: TextStyle(
                      fontFamily: AppFontFamily.UBUNTU_MEDIUM,
                      fontSize: MediaQuery.of(context).size.height *
                          AppWidgetSize.appTitleFontSize),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  "Lorem ipsum is simply dummy text of the printing",
                  style: TextStyle(
                      fontFamily: AppFontFamily.UBUNTU_REGULAR,
                      color: AppColor.appBlackColor,
                      fontSize: MediaQuery.of(context).size.height *
                          AppWidgetSize.appContentSmallFontSize),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(
                color: AppColor.linkedInBtn,
              ),
              subject(),
              complaintType(),
              description(),
              submitButton()

            ],
          ),
        ),
      ),
    );
  }

  Widget subject() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child:  TextFormField(
        controller: subjectController,
        style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.UBUNTU_MEDIUM),
        decoration:  InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          border: UnderlineInputBorder(),
          fillColor: AppColor.appHintColor,
          labelText: 'Subject',
          labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
              color: AppColor.appHintColor,
              fontFamily: AppFontFamily.UBUNTU_REGULAR),
        ),
      ),
    );
  }

  Widget complaintType() {
    return Container (

      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.02),
      child: DropdownButtonFormField(
          isDense: true,
          isExpanded: true,
          decoration: InputDecoration(

            labelStyle: TextStyle(
                color: Colors.black,
                fontFamily: AppFontFamily.UBUNTU_MEDIUM,
                fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)
            ),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),


          ),
          hint: Text(
            "Choose Type",
            style: TextStyle(
              color: AppColor.appHintColor,
              fontSize: MediaQuery.of(context).size.height *   AppWidgetSize.appContentSmallFontSize,
              fontFamily: AppFontFamily.UBUNTU_REGULAR,
            ),
          ),

          icon:SvgPicture.asset(ImagesString.SvgGroupLogin),

          items: lstGender.map((String genderType) {
            return DropdownMenuItem<String>(
                value: genderType.toString(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      genderType,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppFontFamily.UBUNTU_MEDIUM,
                      ),
                    ),
                    //type.icon

                  ],
                )
            );
          }).toList(),
          value: selectedComplaintType,
          onChanged: (valueSelectedByUser) {
            setState(() {
              selectedComplaintType = valueSelectedByUser.toString();

              print("selectedComplaintTypeid $selectedComplaintType");
            });
          }),
    );
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child:  TextFormField(
        controller: descriptionController,
        style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.UBUNTU_MEDIUM),
        maxLines: null,
        decoration:  InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appTextFieldBorderColor)),
          border: UnderlineInputBorder(),
          fillColor: AppColor.appHintColor,
          labelText: 'Description',
          labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
              color: AppColor.appHintColor,
              fontFamily: AppFontFamily.UBUNTU_REGULAR),
        ),
      ),
    );
  }

  Widget submitButton() {
    return GestureDetector(
      onTap: ()
      {

     //   complaintApi();
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
                fontFamily: AppFontFamily.UBUNTU_MEDIUM
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
                        fontSize: MediaQuery.of(context).size.height *
                            AppWidgetSize.appContentFontSize,
                        fontFamily: AppFontFamily.UBUNTU_MEDIUM),
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
                        fontFamily: AppFontFamily.UBUNTU_REGULAR),
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
                              fontFamily: AppFontFamily.UBUNTU_MEDIUM)),
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

/*  complaintApi() async {
    var check_internet = await GlobalUtility().isConnected();
    var token = await GlobalUtility().getPrefValue(AppString.SESSION_ID);
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {

      if(validate())
      {
        Map map = {
          "subject": subjectController.text,
          "description": descriptionController.text,
          "type": selectedComplaintType,
        };

        GlobalUtility().showLoaderDialog(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        String apiResponse = await WebApi().post_with_header_with_map(map, ApiUrl.RAISE_COMPLAINT, token);

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
  }*/

  bool validate() {
    if (subjectController.text.replaceAll(" ", "") == "") {
      GlobalUtility().showSnackBar("Enter subject", context);
      return false;
    }
    if(selectedComplaintType == null)
    {
      GlobalUtility().showSnackBar("Choose Complaint Type", context);
      return false;
    }

    if (descriptionController.text.replaceAll(" ", "") == "") {
      GlobalUtility().showSnackBar("Enter description", context);
      return false;
    }

    return true;
  }



}