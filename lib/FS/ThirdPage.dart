



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    /*sizeVal =MediaQuery.of(context).size;
    return Material(
       child: Container(
         height: sizeVal.height,
         width: sizeVal.width,
      color: Colors.purple,

   child: Column(
     children: [
Container(
  color: Colors.white,
  child: Column(
  children: [
     ],
   ),
       ) ,
    );
  }

}*/

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("This is my TItle"),
                      subtitle: Text("It’s all About this issue. Hope all solutions helped you a lot. Comment below Your thoughts and your queries. Also, Comment below which solution worked for you?"),
                      trailing:  SvgPicture.asset(ImagesString.reward2,
                        width: sizeVal.width*0.2,
                        height: sizeVal.width*0.2,),
                    ),
                  ),

                  dividerWithText(),
                  sharePlatform(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("How it works?"),
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
            child: SvgPicture.asset(ImagesString.reward2),
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              InkWell(
              onTap: (){

        },
          child: Text("• Terms and conditions",style: TextStyle ( fontFamily: AppFontFamily.UBUNTU_MEDIUM,
          color: AppColor.linkedInButtonColor,
          fontSize: MediaQuery.of(context).size.height *
              AppWidgetSize.appContentFontSize),),
      ),

      InkWell(
      onTap: (){

      },          child: Text("• FAQs",style: TextStyle ( fontFamily: AppFontFamily.UBUNTU_MEDIUM,
      color: AppColor.linkedInButtonColor,
      fontSize: MediaQuery.of(context).size.height *
      AppWidgetSize.appContentFontSize),),
      ),
      SizedBox()

      ],),


      ListTile(
      title:    Text("You are yet to earn any scratch cards",style: TextStyle ( fontFamily: AppFontFamily.UBUNTU_MEDIUM,
      color: AppColor.appBlackColor,
      fontSize: MediaQuery.of(context).size.height *
      AppWidgetSize.appLargeTitleFontSize),),
      subtitle:    Text("Start referring to get surprises",style: TextStyle (fontFamily: AppFontFamily.UBUNTU_MEDIUM,
      color: AppColor.appBlackColor,
      fontSize: MediaQuery.of(context).size.height *
      AppWidgetSize.appSubtitleSize),),
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
      title: Text("Earn ₹100 on every scratch acrd",style: TextStyle (fontFamily: AppFontFamily.UBUNTU_MEDIUM,
      color: AppColor.appBlackColor,
      fontSize: MediaQuery.of(context).size.height *
      AppWidgetSize.appContentFontSize),),
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
          Container(height: 40,child: Center(child: Text("Refer Via",style: TextStyle(backgroundColor: Colors.white),)))

        ],
      );

    }

    Widget  sharePlatform() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("data"),
              SvgPicture.asset(ImagesString.reward2,
                width: sizeVal.width*0.1,
                height: sizeVal.width*0.1,)
            ],
          ),
          Column(
            children: [
              Text("data"),
              SvgPicture.asset(ImagesString.reward2,
              )
            ],
          ),
          Column(
            children: [
              Text("data"),
              SvgPicture.asset(ImagesString.reward2,
                /*width: sizeVal.width*0.2,
              height: sizeVal.width*0.2,*/)
            ],
          )

        ],
      );

    }

  }
