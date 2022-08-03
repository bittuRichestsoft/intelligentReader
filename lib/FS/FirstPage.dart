import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_reader_app/FS/SubCategoryLst.dart';

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

  int pageIndex=0,totalPage=4;

  List<String> imagesList = [
    ImagesString.bottom_home_disabled,
    ImagesString.bottom_profile_selected,
    ImagesString.bottom_reward_enabled,
  ];

  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  final CarouselController _controller = CarouselController();

  List<String> widgetList = ['A', 'B', 'C'];
  List<Widget> _demo=[
    Container(height: 300,color: Colors.amber),
    Container(height: 300,color: Colors.black),
    Container(height: 300,color: Colors.blue),
    Container(height: 300,color: Colors.green),
  ];

 /* @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (pageIndex < (totalPage-1)) {
        pageIndex++;
      } else {
        pageIndex = 0;
      }

      _pageController.animateToPage(
        pageIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }*/

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;

    return Material(
        child: Scaffold(
          //  backgroundColor: AppColor.appOrangeColor,
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
                icon: SvgPicture.asset(ImagesString.location_icon)
/*                Icon(Icons.location_on,color: AppColor.appWhiteColor),*/
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_drop_down,color: AppColor.appWhiteColor,),
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
                   headingSearchLoc(),
                   categoriesGrid(),
                   viewMoreBtn(),
                  guranteeText(),
                  bannerImages(),
                  bestOfferTxt(),
                  bestOffers(),
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
                    AppWidgetSize.appButtonBorderRadius),),
          ),
          padding: EdgeInsets.only(left: sizeVal.width * 0.03,right: sizeVal.width * 0.03),
          child: Center(
            child: ListTile(
              dense:true,
              contentPadding: EdgeInsets.only(left: 5,right: 5),
              leading:/* Image.asset('assets/images/png/home.png',)*/Icon(Icons.search,color: AppColor.appHintColor,),
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

  categoriesGrid() {
    return  Expanded(
      child: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          physics: NeverScrollableScrollPhysics(),shrinkWrap: true,
          children: List.generate(
            5,
                (index) => GestureDetector(
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SubCategoryLst()));
    },
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColor.appHintColor)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.touch_app, size: 30, color: Colors.yellow[900],),
                    SizedBox(height: 10,),
                    Text("Touch", style: TextStyle(fontSize: 20),)
                  ],
              ),
            ),
                ),
          ),
        ),

      ),
    );
  }
  bestOffers() {
    return  Expanded(
      child: Container(
        //     height: sizeVal.height*0.3,
        margin: EdgeInsets.all(sizeVal.width * 0.03),

        child: GridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          children:   widgetList.map((String value) {
            return   Container(
            //  height: 250.0,
              color: Colors.green,
              margin:  EdgeInsets.all(1.0),
              child:  Column(
                children:[
                  CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/250x150",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                /*height: 120,  */),
          /*    Text (
                value,
                style:  const TextStyle(fontSize: 5.0,color: Colors.white),
              ),
              Text (
                value,
                style:  const TextStyle(fontSize: 5.0,color: Colors.white),
              ),
*/
                ]

              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget guranteeText() {
    return Container(
      //  height: sizeVal.height*0.25,
        margin: EdgeInsets.only( top: 10,bottom: 10),
        color: Colors.grey,
        child: ListTile(
          title:  Text("100% safe services",style: TextStyle(color: AppColor.appBlackColor,fontWeight: FontWeight.bold)),
          subtitle:    Text("✓ this is sample 1\n✓ this is sample 1\n✓ this is sample 1\n✓ this is sample 1\n",style: TextStyle(color: AppColor.appBlackColor))
        )
    );

  }

  Widget  bannerImages() {

  return  Container(
    height: sizeVal.height*0.24,
    child: Column(
        children: [
      CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.18,
        autoPlay: true,
        //scrollDirection: Axis.vertical,
        onPageChanged: (index, reason) {
          setState(
                () {
                  pageIndex = index;
            },
          );
        },
      ),
      items: _demo.map((item) =>
          Container(
              color: Colors.pink,
              width: MediaQuery.of(context).size.width*0.7,
              child: item /*SvgPicture.asset(item, height: MediaQuery.of(context).size.height * 0.4,)*/))
          .toList(),

    ),
           SizedBox(height: sizeVal.height*0.03,),
          CarouselIndicator(
            count: _demo.length,
            color: AppColor.appHintColor,
            index: pageIndex,

activeColor: AppColor.appOrangeColor,
  width: 10,        ),
        ],
      ),
  );
  }

  viewMoreBtn() {
    return Container(
      width: sizeVal.width,
      height: sizeVal.height *0.08 ,
      margin: EdgeInsets.all(sizeVal.width * 0.03),

       decoration: BoxDecoration(
          color: AppColor.appWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(
            MediaQuery
                .of(context)
                .size
                .width *
                AppWidgetSize.appButtonBorderRadius)),
          border: Border.all(
            color: AppColor.linkedInButtonColor,
            width: 1,
          )
      ),
      padding: EdgeInsets.only(left: sizeVal.width * 0.03,right: sizeVal.width * 0.03),
      child: Center(
        child: Text("View All Services",
        style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.linkedInButtonColor),),
      ),
    );

  }

Widget  bestOfferTxt() {
    return ListTile(
      dense:true,
   //   contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
      title: Text("Best offers",
        style: TextStyle(color: AppColor.appBlackColor,fontSize:sizeVal.height*AppWidgetSize.appHeaderTitleFontSize),),

  subtitle: Text("Hygeinic & single-use products | low contact services",
    style: TextStyle(color: AppColor.appBlackColor,fontSize:sizeVal.height*AppWidgetSize.appContentXSmallFontSize),),

    );

}

}
