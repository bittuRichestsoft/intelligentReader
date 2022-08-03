
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_reader_app/Constants/AppFontFamily.dart';
import 'package:intelligent_reader_app/Constants/app_color.dart';
import 'package:intelligent_reader_app/FS/UpdateProfile.dart';

import '../Constants/app_widgetsize.dart';
import 'HomeFlash.dart';

class FourthPage extends StatefulWidget {
  @override
  _fourthPageState createState() => _fourthPageState();

}

class _fourthPageState extends State<FourthPage> {
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
          title: Text("My Profile"),
        ),
        body: Container(
          height: sizeVal.height,
          width: sizeVal.width,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(sizeVal.width*0.03),
                height: sizeVal.height*0.1,
                child: UserInfo(),
              ),
              Divider(height: 2,),
              shareWidget(),
              Divider(height: 2,),
              referWidget(),
              Divider(height: 2,),
              inboxWidget(),
              Divider(height: 2,),
              scheduledBookingWidget(),
              Divider(height: 2,),
              moreServiceWidget(),
              Divider(height: 2,),
              LogoutWidget(),
              Divider(height: 2,),
            ],
          ),
        ),
      ) ,
    );
  }

  Widget shareWidget(){
    return ListTile(
        leading:  Container(
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
          child:/* SvgPicture.asset(ImagesString.social_2_1),*/  Icon(Icons.share,color: AppColor.blueColor,),
        ),
        title: const Text("Share"),
        onTap: () => print("shareWidget clicked")
    );
  }
  Widget referWidget(){
    return ListTile(
        leading:   Container(
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
            child:/* SvgPicture.asset(ImagesString.social_2_1),*/  Icon(Icons.record_voice_over,color: AppColor.blueColor,),
        ),
        title: const Text("Refer & Earn"),
        onTap: () => print("shareWidget clicked")
    );
  }
  Widget inboxWidget(){
    return ListTile(
        leading:  Container(
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
          child:/* SvgPicture.asset(ImagesString.social_2_1),*/   Icon(Icons.calendar_month_outlined,color: AppColor.blueColor,),
        ),
        title: const Text("My Inbox"),
        onTap: () => print("My Inbox clicked")
    );
  }
  Widget scheduledBookingWidget(){
    return ListTile(
        leading:
        Container(
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
          child:/* SvgPicture.asset(ImagesString.social_2_1),*/ Icon(Icons.calendar_view_month_sharp,color: AppColor.blueColor,)
        ),
        title: const Text("Scheduled Booking"),
        onTap: () => print("Scheduled Booking clicked")
    );
  }
  Widget moreServiceWidget(){
    return ListTile(
        leading:   Container(
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
            child:/* SvgPicture.asset(ImagesString.social_2_1),*/ Icon(Icons.calendar_view_month_sharp,color: AppColor.blueColor,)
        ),
        title: const Text("Rating App "),
        onTap: () => print("moreServiceWidget clicked")
    );
  }
  Widget LogoutWidget(){
    return ListTile(
        leading:   Container(
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
            child:/* SvgPicture.asset(ImagesString.social_2_1),*/ Icon(Icons.logout,color: AppColor.blueColor,)
        ),
        title: const Text("LogoutWidget "),

        onTap: () => print("LogoutWidget clicked")
    );
  }

  Widget UserInfo(){
    return ListTile(
      trailing: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   UpdateProfile()),
            );
          },
          child: Text("Edit",style: TextStyle(fontFamily: AppFontFamily.RobotoBold,color: AppColor.blueColor,),)),
      title: const Text("Name "),
      subtitle: Text("Mobile"),
      //    onTap: () => print("LogoutWidget clicked")
    );

    /* return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 8, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Edit",
            textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight. bold),),
          Text("Mobile",
            textAlign: TextAlign.left,)
        ],)),
     Flexible(flex:2,
         child: Align(
alignment: Alignment.centerRight,           child: Text("Edit",
           textAlign: TextAlign.center,),
         ))
      ],
    );*/
  }
}
