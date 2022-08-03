


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/ImagesString.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
import 'HomeFlash.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<ChooseLocation>
{

  var sizeVal;

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery.of(context).size;
 return Scaffold(
   body: Container(
     height: sizeVal.height,
width:  sizeVal.width,
child: Center(

  child:   Container(
    height: sizeVal.height*0.5,
    width:  sizeVal.width,
    child: Column (
        children: [
          Text("Hi, Nice to meet you", style:  TextStyle(fontSize: sizeVal.width * 0.03),  ),
          Text("See services around you", style:  TextStyle(fontSize: sizeVal.width * 0.04), ),
          SvgPicture.asset(ImagesString.search_another_loc),

    continueButton(),
//    SizedBox(height: sizeVal.height*0.02,),
    searchMoreServices(),
        ],
    ),
  ),
),

   ),
 );

  }

  continueButton() {
    return  GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  HomeFlash(0)),
        );
        },
      child: Container(
        alignment: Alignment.center,
margin: EdgeInsets.only(left:sizeVal.height*0.02,right: sizeVal.height*0.02,),
/*
        width: MediaQuery
            .of(context)
            .size
            .width * AppWidgetSize.appButtonWidth,
*/
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
        child: Row
          (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SvgPicture.asset(ImagesString.location_icon,              width: 30,
                color: Colors.white,
                height: 15,
                fit:BoxFit.fill
            ),
          Text("Your Current Location",

            style: TextStyle(
              color: AppColor.appWhiteColor,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .height *
                  AppWidgetSize.appContentFontSize,
            ),
          )

          ],
        )

      ),
    );
  }
  searchMoreServices() {
    return  Container(
      alignment: Alignment.center,
        margin: EdgeInsets.all(sizeVal.height*0.02,),

      height:
      MediaQuery
          .of(context)
          .size
          .height * AppWidgetSize.appButtonHeight,
      decoration: BoxDecoration(
        color: AppColor.appWhiteColor,
        border: Border.all(color: AppColor.appOrangeColor),
        borderRadius: BorderRadius.all(Radius.circular(
            MediaQuery
                .of(context)
                .size
                .width *
                AppWidgetSize.appButtonBorderRadius)),
      ),
      child: Row
      (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [SvgPicture.asset(ImagesString.search_icon,              width: 30,
          color: AppColor.linkedInButtonColor,

          height: 15,
          fit:BoxFit.fill
      ),
        Text("Some other location",

          style: TextStyle(
            color: AppColor.linkedInButtonColor,
            fontSize: MediaQuery
                .of(context)
                .size
                .height *
                AppWidgetSize.appContentFontSize,
          ),
        )

      ],
    )
    );
  }

}