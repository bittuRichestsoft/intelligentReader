
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_reader_app/View/HomeScreen.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';

class HomeFlash extends StatefulWidget {
  @override
  _homeFlashState createState() => _homeFlashState();

}

class _homeFlashState extends State<HomeFlash> {
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

    return Scaffold(
/*          backgroundColor: AppColor.appOrangeColor,
          resizeToAvoidBottomInset: true,
  //    appBar: AppBar(),
 */
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: sizeVal.height,
        width: sizeVal.width,
        child: Column(
          children: [
            headingTopLoc(),
            headingSearchLoc(),
          // gridServiceItem(),
          ],
        ),
      ),
    );
  }

  headingTopLoc() {
    return Container(height: sizeVal.height * 0.05,
      color: AppColor.appOrangeColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Image.asset(
            'assets/images/png/home.png',
            width: 30,
            color: Colors.white,
            height: 15,
            fit: BoxFit.fill
        ),
          Text("Your Current Location",
            style: TextStyle(
              color: AppColor.appWhiteColor,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .height *
                  0.02,
            ),
          ),
          Image.asset(
              'assets/images/png/home.png',
              width: 30,
              color: Colors.white,
              height: 15,
              fit: BoxFit.fill
          ),
        ],),
    );
  }

  headingSearchLoc() {
    return Container(height: sizeVal.height * 0.05,
      color: AppColor.appOrangeColor,
      child: Container(
        margin: EdgeInsets.only(left: sizeVal.height * 0.05,
            right: sizeVal.height * 0.05,
            top: sizeVal.height * 0.01,
            bottom: sizeVal.height * 0.01),
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
        child: ListTile(
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
    );
  }

  gridServiceItem() {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(choices.length, (index) {
          return Center(
            child: Card(
                color: Colors.orange,
                child: Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Icon(choices[index].icon, size:50.0,  )),
                      Text(choices[index].title!,  ),
                    ]
                ),
                )
            ),
          );
        }
        )
    );
  }

}
class Choice {
 Choice({this.title, this.icon});
 final String? title;
 final  IconData? icon;
}



