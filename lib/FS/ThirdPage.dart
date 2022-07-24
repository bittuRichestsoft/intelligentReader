



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/AppFontFamily.dart';
import '../Constants/ImagesString.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
import 'HomeFlash.dart';

class ThirdPage extends StatefulWidget {
  @override
  _thirdPageState createState() => _thirdPageState();

}

class _thirdPageState extends State<ThirdPage> {

  FlutterShareMe flutterShareMe = FlutterShareMe();

  var sizeVal;
  @override
  Widget build(BuildContext context) {
    sizeVal =MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appOrangeColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeFlash(0)),
              );
            }  ,
          ),
          title: Text("Rewards"),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
              height: sizeVal.height,
              width: sizeVal.width,
              child: ListView(
                children: [
Container(
 color: Colors.grey,
  padding: EdgeInsets.only(top: 10, bottom: 10),
  child:   Wrap(

    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text("Refer and Earn Rs. 100",   style: TextStyle( fontWeight: FontWeight.bold,color: Colors.black)),
          subtitle: Text("It’s all About this issue. Hope all solutions helped you a lo?",style: TextStyle( color: Colors.black)),
          trailing:  SvgPicture.asset(ImagesString.rewards,
            width: sizeVal.width*0.2,
            height: sizeVal.width*0.2,),
        ),
      ),
      dividerWithText(),
      sharePlatform(),

    ],
  ),
),                 ListTile(
                    //padding: const EdgeInsets.all(8.0),
                    title: Text("How it works?", style: TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  ListTile(leading: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,width: 40,
                    decoration: BoxDecoration(   borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery
                            .of(context)
                            .size
                            .width *
                            AppWidgetSize.appButtonBorderRadius)),
                      color: Colors.grey,
                    ),
                    child: SvgPicture.asset(ImagesString.social_1),
                  ),
                    title: Text("Invite your friends to Flash Services"),
                  ),
                  ListTile(leading: Container(
                    height: 40,width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(   borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery
                            .of(context)
                            .size
                            .width *
                            AppWidgetSize.appButtonBorderRadius)),
                      color: Colors.grey,

                    ),
                    child: SvgPicture.asset(ImagesString.reward2),
                  ),
                    title: Text("They will receive a reward of ₹100 on signup"),
                  ),
                  ListTile(leading: Container(
                    height: 40,width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(   borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery
                            .of(context)
                            .size
                            .width *
                            AppWidgetSize.appButtonBorderRadius)),
                      color: Colors.grey,

                    ),
                    child: SvgPicture.asset(ImagesString.reward2),
                  ),
                    title: Text("You receive a reward of ₹100, once they book a service",style: TextStyle (          color: AppColor.appBlackColor,
                        fontSize: MediaQuery.of(context).size.height *
                            AppWidgetSize.appContentFontSize),),
                  ),

                  Padding(
                    padding:  EdgeInsets.all(sizeVal.width*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Text("• Terms and conditions",style: TextStyle ( fontFamily: AppFontFamily.RobotoMedium,
                              color: AppColor.linkedInButtonColor,
                              fontSize: MediaQuery.of(context).size.height *
                                  AppWidgetSize.appContentSmallFontSize),),
                        ),

                        InkWell(
                          onTap: (){

                          },          child: Text("• FAQs",style: TextStyle ( fontFamily: AppFontFamily.RobotoMedium,
                            color: AppColor.linkedInButtonColor,
                            fontSize: MediaQuery.of(context).size.height *
                                AppWidgetSize.appContentSmallFontSize),),
                        ),
                        SizedBox()

                      ],),
                  ),


                  ListTile(
                    title:    Text("You are yet to earn any scratch cards",style: TextStyle ( fontFamily: AppFontFamily.RobotoBold,
                        color: AppColor.appBlackColor,
 ),),
                    subtitle:    Text("Start referring to get surprises",style: TextStyle (fontFamily: AppFontFamily.RobotoMedium,
                        color: AppColor.appBlackColor,
 ),),
                  ),
        Divider(height: 1,),
                  ListTile(leading: Container(
                    height: 40,width: 40,
                    padding: EdgeInsets.all(8),
/*                    decoration: BoxDecoration(   borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery
                            .of(context)
                            .size
                            .width *
                            AppWidgetSize.appButtonBorderRadius)),
                      color: Colors.grey,
                    ),*/
                    child: SvgPicture.asset(ImagesString.rewards),
                  ),
                    title: Text("Earn ₹100 on every scratch card",style: TextStyle (fontFamily: AppFontFamily.RobotoMedium,
                        color: AppColor.appBlackColor,
                        fontSize: MediaQuery.of(context).size.height *
                            AppWidgetSize.appContentTitleFontSize),),
                  ),

                ],
              ),)


        ),
      ) ,
    );
  }

  Widget  dividerWithText() {
    return Stack(
      children: [
        Container(height: 40, child: Divider(height: 2, color: Colors.black,)),
        Container(height: 40,child: Center(child: Text("Refer Via",style: TextStyle(backgroundColor: Colors.grey,color: Colors.black,fontWeight: FontWeight.bold),)))

      ],
    );

  }

  Widget  sharePlatform() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
//String? response = await flutterShareMe.shareToFacebook(url: "https://www.google.com/", msg: "msg");
//debugPrint("shareToFacebook=$response");
            onButtonTap("shareToFacebook");

          },
          child: Column(
            children: [
              SvgPicture.asset(ImagesString.social_1,
                width: sizeVal.width*0.1,
                height: sizeVal.width*0.1,),
              Text("data"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            //  String? response = await flutterShareMe.shareToWhatsApp(url: "https://www.google.com/", msg: "msg");
            // debugPrint("shareToFacebook=$response");
            onButtonTap("shareToWhatsApp");
          },

          child: Column(
            children: [
               SvgPicture.asset(ImagesString.reward2,
              )
              ,
              Text("data"),           ],
          ),
        ),
        Column(
          children: [
            SvgPicture.asset(ImagesString.reward2,
              /*width: sizeVal.width*0.2,
              height: sizeVal.width*0.2,*/)
            ,
            Text("data"),],
        )

      ],
    );

  }
  Future<void> onButtonTap(String share) async {
    String msg =
        'Flutter share is great!!\n Check out full example at https://pub.dev/packages/flutter_share_me';
    String url = 'https://pub.dev/packages/flutter_share_me';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    switch (share) {
      case "shareToFacebook":
        response = await flutterShareMe.shareToFacebook(url: url, msg: msg);
        break;
    //  case Share.messenger:
    //    response = await flutterShareMe.shareToMessenger(url: url, msg: msg);
    //   break;
      case 'shareToTwitter':
        response = await flutterShareMe.shareToTwitter(url: url, msg: msg);
        break;
      case 'shareToWhatsApp':
      /*if (file != null) {
          response = await flutterShareMe.shareToWhatsApp(
              imagePath: file!.path,
              fileType: videoEnable ? FileType.video : FileType.image);
        } else {*/
        response = await flutterShareMe.shareToWhatsApp(msg: msg);
        //}
        break;
    /* case Share.whatsapp_business:
        response = await flutterShareMe.shareToWhatsApp(msg: msg);
        break;*/
      case 'shareToSystem':
        response = await flutterShareMe.shareToSystem(msg: msg);
        break;
      case 'shareWhatsAppPersonalMessage':
        response = await flutterShareMe.shareWhatsAppPersonalMessage(
            message: msg, phoneNumber: 'phone-number-with-country-code');
        break;
    /* case 'shareToInstagram':
        response = await flutterShareMe.shareToInstagram(
            filePath: file!.path,
            fileType: videoEnable ? FileType.video : FileType.image);
        break;
      case Share.share_telegram:
        response = await flutterShareMe.shareToTelegram(msg: msg);
        break;*/
    }
    debugPrint(response);
  }
}
