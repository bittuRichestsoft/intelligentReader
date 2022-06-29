import 'package:cached_network_image/cached_network_image.dart';
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
height: sizeVal.height,
              child: ListView (
                  children: [
                  //  headingSearchLoc(),
                      gridServiceItem(),
                   adsVw(),
                     adsVw(),
                     adsVw(),
                 viewMoreBtn(),
                 lstVwBuilder(),
                    /*adsVw(),*/ ],
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
    return  Expanded(
      child: Container(
 //     height: sizeVal.height*0.3,
        child: GridView.count(
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          children:   List<Widget>.generate(11, (index) {
            return   GridTile(
footer: Text("Footer"),
              child:   GestureDetector(

                child: Card(
                    color: Colors.blue.shade200,

                    child:   Container(
color: Colors.deepOrange,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "http://via.placeholder.com/200x150",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    colorFilter:
                                    ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                              ),
                            ),
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          Text('tile $index'),
                        ],

                      ),
                    )
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

 Widget adsVw() {
return Container(
  height: sizeVal.height*0.15,
margin: EdgeInsets.only(top: 10),
color: Colors.purple,
);

  }

Widget  lstVwBuilder() {

return   Container(
  height: sizeVal.height*0.15,
  child: ListView.builder(
     scrollDirection: Axis.horizontal,
   // physics: NeverScrollableScrollPhysics(),
       itemCount: 15,
    itemBuilder: (BuildContext context, int index) => Card(
      child: Center(child: Container(
        width: sizeVal.width*0.6,
        child:CachedNetworkImage(
          imageUrl: "http://via.placeholder.com/200x150",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      )),
    ),
  ),
);
}

  viewMoreBtn() {
    return Container(
      margin: EdgeInsets.only(left: sizeVal.width*0.1,right: sizeVal.width*0.1,top: sizeVal.height *0.03,bottom: sizeVal.height*0.03),
decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
        ImagesString.button_filled_rounded),
    fit: BoxFit.fill,
  ),
  shape: BoxShape.circle,
),
   child: Center(
     child: Text("Search More"),
   ),
    );

  }

}
