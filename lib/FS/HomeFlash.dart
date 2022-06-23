
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/FS/FirstPage.dart';
import 'package:intelligent_reader_app/FS/FourthPage.dart';
import 'package:intelligent_reader_app/FS/SecondPage.dart';
import 'package:intelligent_reader_app/FS/ThirdPage.dart';
import 'package:intelligent_reader_app/View/HomeScreen.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
int _selectedIndex = 0;
class HomeFlash extends StatefulWidget {

  HomeFlash(int index)
  {
    _selectedIndex = index;
  }

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

    return Material(
        child: Scaffold(
                backgroundColor: AppColor.appOrangeColor,
           /* resizeToAvoidBottomInset: true,
   appBar: AppBar(backgroundColor: AppColor.appOrangeColor,toolbarHeight: kToolbarHeight,),*/
    appBar:  AppBar(
        backgroundColor: AppColor.appOrangeColor,
        title: Text(
          "Your Current Location",
          style: TextStyle(
             /* fontFamily: AppFontFamily.UBUNTU_MEDIUM,*/
              color: AppColor.appWhiteColor,
              fontSize: MediaQuery.of(context).size.height *
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
 */           },
          ),
        ]
    ),
        body: Center(
            child: Container(
                child: _pages.elementAt(_selectedIndex))
        ),
          bottomNavigationBar: bottomNav(), ) );
  }


  Widget bottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: (_selectedIndex == 0) ? SvgPicture.asset(AppImages.homeBottomIconSelected):
          SvgPicture.asset(AppImages.homeBottomIconUnselected),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: (_selectedIndex == 1)? SvgPicture.asset(AppImages.allRequestBottomIconSelected):
          SvgPicture.asset(AppImage.allRequestBottomIconUnselected),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: (_selectedIndex == 2) ? SvgPicture.asset(AppImages.aboutMlaBottomIconSelected) :
          SvgPicture.asset(AppImages.aboutMlaBottomIconUnSelected),
          label: '',
        ),

        BottomNavigationBarItem(
          icon: (_selectedIndex == 3) ? SvgPicture.asset(AppImages.profileBottomIconSelected):
          SvgPicture.asset(AppImages.profileBottomIconUnselected),
          label: '',
        ),

      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  static   final List<Widget> _pages = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage()
  ];

}
class Choice {
 Choice({this.title, this.icon});
 final String? title;
 final  IconData? icon;
}



