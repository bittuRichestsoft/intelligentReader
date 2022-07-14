
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/FS/FirstPage.dart';
import 'package:intelligent_reader_app/FS/FourthPage.dart';
import 'package:intelligent_reader_app/FS/ThirdPage.dart';
import 'package:intelligent_reader_app/View/HomeScreen.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
import 'Booking/BookingList.dart';
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



  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;

    return Material(
        child: Scaffold(
                backgroundColor: AppColor.appOrangeColor,
        body: Center(
            child: Container(
              height: sizeVal.height ,
                child: _pages.elementAt(_selectedIndex))
        ),
          bottomNavigationBar: bottomNav(), ) );
  }

  Widget bottomNav() {
    return SizedBox(
     height: 55,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: (_selectedIndex == 0) ? tabItem(ImagesString.bottom_home_selected):
      tabItem(ImagesString.bottom_home_disabled) ,
        label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: (_selectedIndex == 1)? SvgPicture.asset(ImagesString.bottom_cal_unselect,height: 20,width: 40,color: AppColor.appOrangeColor,):
            tabItem(ImagesString.bottom_cal_unselect)
            ,
          label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: (_selectedIndex == 2) ?  tabItem(ImagesString.bottom_reward_enabled)  :
    tabItem(ImagesString.bottom_reward_unslelect)     ,
            label: 'Rewards',
          ),

          BottomNavigationBarItem(
            icon: (_selectedIndex == 3) ?  tabItem(ImagesString.bottom_profile_selected) :
    tabItem(ImagesString.bottom_profile_unselect) ,
             label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  static   final List<Widget> _pages = <Widget>[
    FirstPage(),
    BookingList(),
    ThirdPage(),
    FourthPage()
  ];

Widget  tabItem(String strImg) {
return  SvgPicture.asset(strImg,height: 20,width: 40,);
}

}



