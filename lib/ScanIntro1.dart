import 'package:argosy_app/intro/LocateIntro2.dart';
import 'package:argosy_app/register/SignInPage.dart';
import 'package:argosy_app/utility/AppColors.dart';
import 'package:argosy_app/utility/Appstrings.dart';
import 'package:argosy_app/utility/GlobalUtility.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScanIntro1 extends StatefulWidget {
  @override
  _ScanIntro1State createState() => _ScanIntro1State();
}

List<String> imagesList = [
  'assets/images/svg/Scan_intro.svg',
  'assets/images/svg/locate_intro.svg',
  'assets/images/svg/searched_item_intro.svg'
];

int _currentIndex = 0;
//int imageIndex = 0;

class _ScanIntro1State extends State<ScanIntro1> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //  color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sliderImages(),

            // SvgPicture.asset("assets/images/svg/Scan_intro.svg"),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            indicators(),
            /*Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
                    height: MediaQuery.of(context).size.height * 0.002,
                    width: MediaQuery.of(context).size.width * 0.04,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (index == 0)?Color(GlobalUtility().hexStringToHexInt(AppColors.THEMECOLOR)) : Colors.grey),
                  );
                },
              ),
            ),*/

            Text(
              (_currentIndex == 0)
                  ? "Scan"
                  : (_currentIndex == 1)
                      ? "My Boxes"
                      : "Find",
              style: TextStyle(
                  color: Color(GlobalUtility()
                      .hexStringToHexInt(AppColors.THEME_BLUECOLOR)),
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                  fontFamily: Appstrings.NunitoExtraBold),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            Center(
              child: Text(
                (_currentIndex == 0)
                    ? "Apply your unique Argosy QR label on anything and then scan it!"
                    : (_currentIndex == 1)
                        ? " Name your label, add the location, description of the items and any photos of the contents!"
                        : "Type the name of your label to find the location!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(GlobalUtility()
                        .hexStringToHexInt(AppColors.THEMECOLOR)),
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontFamily: Appstrings.RobotoRegular),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    setState(() {

                      bool thirdIndexChecked = false;
                      if(_currentIndex == 0)
                        {
                          _currentIndex =1;

                          _controller.animateToPage(_currentIndex);

                        }

                      else if(_currentIndex == 1)
                      {
                        _currentIndex = 2;

                        _controller.animateToPage(_currentIndex);
                      }

                      else if(_currentIndex == 2)
                      {
                        thirdIndexChecked = true;

                      }
                       if(thirdIndexChecked)
                        {
                          GlobalUtility().setShowIntro(true);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );
                        }

                    });

                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.height * 0.05 / 2)),
                      gradient: LinearGradient(
                          colors: [
                            Color(GlobalUtility()
                                .hexStringToHexInt(AppColors.THEMECOLOR)),
                            Color(GlobalUtility()
                                .hexStringToHexInt(AppColors.THEME_BLUECOLOR)),
                          ],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                          tileMode: TileMode.repeated),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: Appstrings.NunitoBold),
                      textAlign: TextAlign.center,
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final CarouselController _controller = CarouselController();

  Widget sliderImages() {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.6,
        autoPlay: false,
        //scrollDirection: Axis.vertical,
        onPageChanged: (index, reason) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      items: imagesList.map((item) => SvgPicture.asset(item, height: MediaQuery.of(context).size.height * 0.4,))
          .toList(),

    );
  }

  Widget indicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imagesList.map((urlOfItem) {
          int index = imagesList.indexOf(urlOfItem);
          return Container(
            width: 10.0,
            height: 10.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index
                  ? Color(
                      GlobalUtility().hexStringToHexInt(AppColors.THEMECOLOR))
                  : Color.fromRGBO(0, 0, 0, 0.3),
            ),
          );
        }).toList());
  }

}
