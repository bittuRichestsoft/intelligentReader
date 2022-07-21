/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intelligent_reader_app/ApiResponse/SendOtpRes.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:intelligent_reader_app/Constants/app_widgetsize.dart';
import 'package:intelligent_reader_app/Controllers/LoginController.dart';
import 'package:intelligent_reader_app/Utilities/PreferenceUtils.dart';
import 'package:intelligent_reader_app/View/HomeScreen.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:sized_context/sized_context.dart';

import '../Constants/ApiUrl.dart';
import '../Constants/app_color.dart';
import '../Utilities/GlobalUtility.dart';

class LoginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen>   {
  LoginController registerController = Get.put(LoginController());
  */
/*  String redirectUrl = 'https://www.linkedin.com/company/richestsoft/?originalSubdomain=in';
    String clientId = '86uxvx5l6jtz6e';
    String clientSecret = 'Wx57ql3jhsWVcrVu';*//*

    String redirectUrl = 'https://www.youtube.com/callback';
    String clientId = '776rnw4e4izlvg';
    String clientSecret = 'rQEgboUHMLcQi59v';
  UserDataFromLinked? user;
 LoginResp?    loginResponse ;
    bool logoutUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    */
/*  GetX<LoginController>(builder: (controller)
    {*//*

        Stack(
        children: [
          SvgPicture.asset('assets/images/svg/login_bg.svg',
            fit: BoxFit.fill,
            //  height: MediaQuery.of(context).size.height,
            width: MediaQuery
                .of(context)
                .size
                .width,),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Center(
              child: Container(
                height: context.heightPct(.60),
                width: context.widthPct(.85),
//color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      height: context.heightPct(.30),
                      child: SvgPicture.asset(ImagesString.SvgGroupLogin,
                        //   fit: BoxFit.fill,
                        //  height: MediaQuery.of(context).size.height,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,),
                    ),
                    SizedBox(height: context.heightPct(.02),
                    ),
                    Text(
                      AppStrings.loginWelcome,
                      style: TextStyle(
                        fontSize: context.heightPct(
                          AppWidgetSize.appTitleFontSize,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.heightPct(.02),),

                    Text(
                      AppStrings.login_footerTxt,
                      style: TextStyle(
                        fontSize: context.heightPct(
                          AppWidgetSize.appXSmallContentTitleFontSize,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.heightPct(.02),),
                    loginButton(),
                  ],
                ),
              ),
            ),
          ),
        ],


      )
 // }  )
    );
  }

    Widget loginButton() {
      return GestureDetector(
        onTap: () {
          loginWitLinkedIn();
          //  Navigator.push(
          //    context, MaterialPageRoute(builder: (context) =>
          //      TimeSelectionPage("")),);
        },
        child: Container(
          height: context.widthPct(0.07),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          decoration: BoxDecoration(
              color: AppColor.linkedInButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(
context.widthPct(0.2)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             */
/* Center(
                child: SvgPicture.asset(AppImages.linkedIcon),
              ),*//*

              Text(
                AppStrings.loginLinked,
              */
/*  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppStrings.rubikSemiBold,
                    fontSize: MediaQuery.of(context).size.height *
                        AppWidgetSize.contentTextSize),*//*

              ),
              SizedBox(
                width: 50,
              )
            ],
          ),
        ),
      );
    }

    loginWitLinkedIn() {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (final BuildContext context) => LinkedInUserWidget(
            appBar: AppBar(
              title: const Text('LinkedIn Login'),
            ),
            destroySession: true,
            redirectUrl: redirectUrl,
            clientId: clientId,
            clientSecret: clientSecret,
            projection: const [
              ProjectionParameters.id,
              ProjectionParameters.localizedFirstName,
              ProjectionParameters.localizedLastName,
              ProjectionParameters.firstName,
              ProjectionParameters.lastName,
              ProjectionParameters.profilePicture,
            ],
            onError: (final UserFailedAction e) {
              debugPrint("LoginScreen UserFailedAction<<>>${e.toString()}");
              GlobalUtility().showToast(AppStrings.errorString);
            },
            onGetUserProfile: (final UserSucceededAction linkedInUser) {
              String userName =
                  "${linkedInUser.user.firstName!.localized!.label!} ${linkedInUser.user.lastName!.localized!.label!}";
          debugPrint("LoginScreen <<>>$userName");
              user = UserDataFromLinked(
                  firstName: linkedInUser.user.firstName!.localized!.label!,
                  lastName: linkedInUser.user.lastName!.localized!.label!,
                  email: linkedInUser
                      .user.email!.elements![0].handleDeep!.emailAddress!,
                  profileImageUrl: linkedInUser
                    .user
                  .profilePicture
              !.displayImageContent
              !.elements![0]
                  .identifiers![0]
                  .identifier!,
                   );
              setState(() {
                logoutUser = false;
              });
              String profilepicture = "";
              if(linkedInUser.user.profilePicture!=null)
              {
                if (linkedInUser.user.profilePicture!.displayImageContent!
                    .elements![0].identifiers![0].identifier !=
                    null &&
                    linkedInUser.user.profilePicture!.displayImageContent!
                        .elements![0].identifiers![0].identifier! !=
                        "") {
                  profilepicture = linkedInUser
                      .user
                      .profilePicture!
                      .displayImageContent!
                      .elements![0]
                      .identifiers![0]
                      .identifier!;
                }
              }

              loginwithApi(
                  linkedInUser.user.firstName!.localized!.label!,
                  linkedInUser.user.lastName!.localized!.label!,
                  linkedInUser.user.email!.elements![0].handleDeep!.emailAddress!,
                  linkedInUser.user.userId.toString(),
                  profilepicture);
            },
          ),
          fullscreenDialog: true,
        ),
      );
    }

    loginwithApi(String firstname, String lastName, String email,
        String providerId, String profilepicture) async {
      var checkInternet = await GlobalUtility().isConnected();
      if (checkInternet) {
        GlobalUtility().showLoaderDialog(context);
        Map map = {
          'email': email.trim()            //'diksha@gmail.com'
          ,
          'first_name': firstname,//'diksha',
          'last_name':  lastName,          //'kapil',
          'provider': 'linkedIn',
          'provider_id': providerId,
          'user_type': 'publisher',
          'device_name': 'gjjkkjhj',
          'device_token': 'jjhbjb',
          'device_type': 'vghvhgvh'
        };

        String? apiResponse =   registerController.hitLoginApi(map, ApiUrl.LoginWithLinkedIn).toString();
        debugPrint(apiResponse);
        Navigator.pop(context);
        loginResponse = loginRespFromJson(apiResponse);
        var status = loginResponse!.status;
        var message = loginResponse!.message;
        if (status == 200) {
          GlobalUtility().showToast(message.toString());
          PreferenceUtils().setUserData(
              loginResponse!.loginData.token,
              "${loginResponse!.loginData.firstName} ${loginResponse!.loginData.lastName.toString()}",
              profilepicture,
              loginResponse!.loginData.email.toString());

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()),
          );
        } else if (status == 400) {
          GlobalUtility().showToast(message.toString());
        }
      } else {
        GlobalUtility().showToast(AppStrings.PleaseCheckInternetConnection);
      }
    }
}
*/
