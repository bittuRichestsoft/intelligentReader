import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/ImagesString.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
import 'HomeFlash.dart';

class FirstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();

}

class _firstPageState extends State<FirstPage> {
  var sizeVal;
  TextEditingController searchLocController = TextEditingController();

  List<Choice> choices = <Choice>[
    Choice(title: 'Home', icon: Icons.home),
    Choice(title: 'Contact', icon: Icons.contacts),
    Choice(title: 'Map', icon: Icons.map),
    Choice(title: 'Phone', icon: Icons.phone),
    Choice(title: 'Camera', icon: Icons.camera_alt),
    Choice(title: 'Setting', icon: Icons.settings),
    Choice(title: 'Album', icon: Icons.photo_album),
    Choice(title: 'WiFi', icon: Icons.wifi),
  ];

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;

    return Material(
        child: Scaffold(
          backgroundColor: AppColor.appOrangeColor,
          /* resizeToAvoidBottomInset: true,
   appBar: AppBar(backgroundColor: AppColor.appOrangeColor,toolbarHeight: kToolbarHeight,),*/
          appBar: AppBar(
              backgroundColor: AppColor.appOrangeColor,
              title: Text(
                "Your Current Location",
                style: TextStyle(
                  /* fontFamily: AppFontFamily.UBUNTU_MEDIUM,*/
                    color: AppColor.appWhiteColor,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height *
                        AppWidgetSize.appContentFontSize),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  //    _scaffoldKey.currentState!.openDrawer();
                },
                icon: SvgPicture.asset(ImagesString.SvgGroupLogin),
              ),
              actions: <Widget>[
                IconButton(
                  icon: SvgPicture.asset(ImagesString.SvgGroupLogin),
                  onPressed: () {
                    /*             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsScreen()));
 */
                  },
                ),
              ]
          ),
          body: SafeArea(
            child: Container(
              //  margin: EdgeInsets.only(top: ),
              color: Colors.white,
              height: sizeVal.height,
              width: sizeVal.width,
              child: Column(
                children: [
                  headingSearchLoc(),
                  gridServiceItem(),
                ],
              ),
            ),
          ),
        )
    );
  }
  headingSearchLoc() {
    return Container(height: sizeVal.height * 0.1,
      color: AppColor.appOrangeColor,

      child: Center(
        child: Container(
          height: sizeVal.height * 0.08,
          margin: EdgeInsets.only(left: sizeVal.width * 0.03,
            right: sizeVal.width * 0.03,
          ),
          // color: AppColor.appWhiteColor,
          decoration: BoxDecoration(
            color: AppColor.appWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(
                MediaQuery
                    .of(context)
                    .size
                    .width *
                    AppWidgetSize.appButtonBorderRadius)),
          ),
          padding: EdgeInsets.only(left: sizeVal.width * 0.03,right: sizeVal.width * 0.03),
          child: Center(
            child: ListTile(
              dense:true,
              contentPadding: EdgeInsets.only(left: 5,right: 5),
              leading: Image.asset('assets/images/png/home.png',),
              title: TextField(
                controller: searchLocController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search your Location',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  gridServiceItem() {
    return  Container(
      height: sizeVal.height*0.3,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true ,
        children:   List<Widget>.generate(12, (index) {
          return   GridTile(

            child:   Card(

                color: Colors.blue.shade200,

                child:   Center(
                  child:   Text('tile $index'),
                )
            ),
          );
        }),
      ),
    );
  }

}
