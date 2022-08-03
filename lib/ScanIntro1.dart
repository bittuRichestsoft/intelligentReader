
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';

class ScanIntro1 extends StatefulWidget {
  @override
  _ScanIntro1State createState() => _ScanIntro1State();
}

List<String> imagesList = [
  ImagesString.bottom_home_disabled,
  ImagesString.bottom_profile_selected,
  ImagesString.bottom_reward_enabled,
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

                    });

                  },
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
        height: MediaQuery.of(context).size.height * 0.1,
        autoPlay: true,
        //scrollDirection: Axis.vertical,
        onPageChanged: (index, reason) {
          setState(
                () {
              _currentIndex = index;
            },
          );
        },
      ),
      items: imagesList.map((item) =>
          Container(
              color: Colors.pink,
              width: MediaQuery.of(context).size.width*0.7,
              child: SvgPicture.asset(item, height: MediaQuery.of(context).size.height * 0.4,)))
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
                  ? Color.fromRGBO(64, 220, 220, 0.30196078431372547)
                  : Color.fromRGBO(0, 0, 0, 0.3),
            ),
          );
        }).toList());
  }

}