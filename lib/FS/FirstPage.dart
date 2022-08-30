import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intelligent_reader_app/FS/SubCategoryLst.dart';
import 'package:intelligent_reader_app/webApi/ModelClasses/BannerImagesResp.dart';
import 'package:intelligent_reader_app/webApi/ModelClasses/CategoriesResp.dart';

import '../Constants/ApiUrl.dart';
import '../Constants/ImagesString.dart';
import '../Constants/app_color.dart';
import '../Constants/app_strings.dart';
import '../Constants/app_widgetsize.dart';
import '../Utilities/GlobalUtility.dart';
import '../Utilities/PreferenceUtils.dart';
import '../webApi/WebApi.dart';
import 'HomeFlash.dart';

class FirstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();

}

class _firstPageState extends State<FirstPage> {
  var sizeVal;
  TextEditingController searchLocController = TextEditingController();
  String sessionId = "";
  int pageIndex = 0,
      totalPage = 4;

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
  List<ListCategory> listCategories = [];
  List<ListBannerImage> listBanner = [];
  List<String> widgetList = ['A', 'B', 'C'];
  List<Widget> _demo = [
    Container(height: 300, color: Colors.amber),
    Container(height: 300, color: Colors.black),
    Container(height: 300, color: Colors.blue),
    Container(height: 300, color: Colors.green),
  ];

  @override
  void initState() {
    getSavedData();
    Future<Position> position = getCurrentLocation();
    currentLoc2();
    super.initState();
  }

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
                  icon: Icon(
                    Icons.arrow_drop_down, color: AppColor.appWhiteColor,),
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
              child: ListView(
                children: [
                  headingSearchLoc(),
                  categoriesGrid(),
                  viewMoreBtn(),
                  guranteeText(),
                  bannerImages(),
                  bestOfferTxt(),
                  bestOffers(),
                  /*adsVw(),*/
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
                    AppWidgetSize.appButtonBorderRadius),),
          ),
          padding: EdgeInsets.only(
              left: sizeVal.width * 0.03, right: sizeVal.width * 0.03),
          child: Center(
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 5, right: 5),
              leading: /* Image.asset('assets/images/png/home.png',)*/Icon(
                Icons.search, color: AppColor.appHintColor,),
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
    return Expanded(
      child: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
          children: List.generate(
            listCategories.length,
                (index) =>
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            SubCategoryLst(listCategories[index].categoryId)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: AppColor.appHintColor)
                    ),
                    child: Stack(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

//    Image.network("${ApiUrl.BASEURLForBanners+listCategories[index].imageUpload1}"),
                        Image.network(
                            "https://flashservices.in/uploads/banner/electrical-maintenance.jpg"),
                        //      Image.network("https://flashservices.in/uploads/cctvcamera.png",fit: BoxFit.cover,),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                color: Colors.grey.withOpacity(0.5),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Text("${listCategories[index]
                                    .categoryName}", style: TextStyle(
                                    fontSize: 12), textAlign: TextAlign
                                    .center,)))
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
    return Expanded(
      child: Container(
        //     height: sizeVal.height*0.3,
        margin: EdgeInsets.all(sizeVal.width * 0.03),

        child: GridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          children: widgetList.map((String value) {
            return Container(
              //  height: 250.0,
              color: Colors.green,
              margin: EdgeInsets.all(1.0),
              child: Column(
                  children: [
                    Image.network(
                        "https://flashservices.in/uploads/banner/plumber-services-in-bhopal-1.jpg"),
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
        margin: EdgeInsets.only(top: 10, bottom: 10),
        color: Colors.grey,
        child: ListTile(
            title: Text("100% safe services", style: TextStyle(
                color: AppColor.appBlackColor, fontWeight: FontWeight.bold)),
            subtitle: Text(
                "✓ this is sample 1\n✓ this is sample 1\n✓ this is sample 1\n✓ this is sample 1\n",
                style: TextStyle(color: AppColor.appBlackColor))
        )
    );
  }

  Widget bannerImages() {
    return Container(
      height: sizeVal.height * 0.24,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.18,
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
            items: listBanner.map((item) =>
                Container(
                    color: Colors.pink,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,

                    child: /*item*/ SvgPicture.network(
                      'https://flashservices.in/uploads/banner/' +
                          item.imageUpload1, height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,)))
                .toList(),

          ),
          SizedBox(height: sizeVal.height * 0.03,),
          CarouselIndicator(
            count: listBanner.length,
            color: AppColor.appHintColor,
            index: pageIndex,

            activeColor: AppColor.appOrangeColor,
            width: 10,),
        ],
      ),
    );
  }

  viewMoreBtn() {
    return Container(
      width: sizeVal.width,
      height: sizeVal.height * 0.08,
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
      padding: EdgeInsets.only(
          left: sizeVal.width * 0.03, right: sizeVal.width * 0.03),
      child: Center(
        child: Text("View All Services",
          style: TextStyle(fontWeight: FontWeight.bold,
              color: AppColor.linkedInButtonColor),),
      ),
    );
  }

  Widget bestOfferTxt() {
    return ListTile(
      dense: true,
      //   contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
      title: Text("Best offers",
        style: TextStyle(color: AppColor.appBlackColor,
            fontSize: sizeVal.height * AppWidgetSize.appHeaderTitleFontSize),),

      subtitle: Text("Hygeinic & single-use products | low contact services",
        style: TextStyle(color: AppColor.appBlackColor,
            fontSize: sizeVal.height *
                AppWidgetSize.appContentXSmallFontSize),),

    );
  }

  void getSavedData() async {
    PreferenceUtils preferenceUtils = PreferenceUtils();
    sessionId = await preferenceUtils.getSessionId();
    debugPrint("Home sessionId=$sessionId");
    getBannerImagesApi();
    getAllCategories();
  }

  void getBannerImagesApi() async {
    var check_internet = await GlobalUtility().isConnected();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {
      GlobalUtility().showLoaderDialog(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      String apiResponse = await WebApi().get_request_with_header(
          ApiUrl.ListBannerImages, sessionId);
      setState(() {
        Navigator.of(context).pop();
        var jsondata = json.decode(apiResponse);
        String message = "jsondata['Message']";
        String status = jsondata['Code'];
        if (status == "200") {
          BannerImagesResp categoriesResp = bannerImagesRespFromJson(
              apiResponse);

          listBanner = categoriesResp.listBannerImages;
        } else if (status == "400") {
          GlobalUtility().showSnackBar(message, context);
        } else if (status == "403") {
          GlobalUtility().setSessionEmpty(context);
        } else {
          GlobalUtility().showSnackBar(message, context);
        }
      });
    } else {
      GlobalUtility()
          .showSnackBar(AppStrings.PleaseCheckInternetConnection, context);
    }
  }

  void getAllCategories() async {
    var check_internet = await GlobalUtility().isConnected();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {
      GlobalUtility().showLoaderDialog(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      String apiResponse = await WebApi().get_request_with_header(
          ApiUrl.ListCategories, sessionId);
      setState(() {
        Navigator.of(context).pop();
        var jsondata = json.decode(apiResponse);
        String message = "jsondata['Message']";
        String status = jsondata['Code'];
        if (status == "200") {
          CategoriesResp categoriesResp = categoriesRespFromJson(apiResponse);

          listCategories = categoriesResp.listCategories;
        } else if (status == "400") {
          GlobalUtility().showSnackBar(message, context);
        } else if (status == "403") {
          GlobalUtility().setSessionEmpty(context);
        } else {
          GlobalUtility().showSnackBar(message, context);
        }
      });
    } else {
      GlobalUtility()
          .showSnackBar(AppStrings.PleaseCheckInternetConnection, context);
    }
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


  void currentLoc2() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen(
            (Position? position) {
          print(position == null ? 'Unknown' : 'Current lat=${position.latitude
              .toString()}, long=${position.longitude.toString()}');
//          updateCurrentLocApi(    position!.latitude.toString(), position.longitude.toString());
        });
  }


  void updateCurrentLocApi(String strLat, String strLng) async {
    var check_internet = await GlobalUtility().isConnected();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {

      GlobalUtility().showLoaderDialog(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      Map map = {
        "latitude":strLat,
        "longitude":strLng
      };
       String apiResponse = await WebApi().post_with_header_with_map( ApiUrl.UpdateLocation,map,sessionId);
      setState(() {
        Navigator.of(context).pop();
        var jsondata = json.decode(apiResponse);
        String message = "jsondata['Message']";
        String status = jsondata['Code'];
        if (status == "200") {

        } else if (status == "400") {
          GlobalUtility().showSnackBar(message, context);
        } else if (status == "403") {
          GlobalUtility().setSessionEmpty(context);
        } else {
          GlobalUtility().showSnackBar(message, context);
        }
      });
    } else {
      GlobalUtility()
          .showSnackBar(AppStrings.PleaseCheckInternetConnection, context);
    }
  }


}