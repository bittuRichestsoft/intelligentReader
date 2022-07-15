import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../Constants/AppFontFamily.dart';
import '../../Constants/app_color.dart';
import '../../Constants/app_widgetsize.dart';

class MapPage extends StatefulWidget {
  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<MapPage> {
  GoogleMapController? _controller;

  var sizeVal;
  Location locationObj = Location();
  double curLat = 0.0;
  double curLng = 0.0;
  Set<Marker> _markers = {};
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;

  @override
  void initState() {
    checkPermissions();
    try {
      getCurrentLocation();
    }
    catch (exp) {
      debugPrint("excep= ${exp}");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        height: sizeVal.height,
        width: sizeVal.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: sizeVal.height * 0.8,
                  width: sizeVal.width,
                  child: Stack(
                      children: [ GoogleMap(
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: curLat == 0.0
                              ? const LatLng(30.70, 76.71)
                              : LatLng(curLat,
                              curLng),
                          zoom: 12.0,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                        },
                        onCameraMove: _onCameraMove,
                        markers: _markers,
                      ),
                        Center(
                          child: Image.asset(ImagesString.homePng),
                        )


                      ]

                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showBottomSht(context);
                  },
                  child: Container(height: 40, width: 40, color: Colors.green,),
                )


              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: sizeVal.height * 0.7,
              ),
              height: sizeVal.height * 0.1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.location_searching,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    getCurrentLocation();
                    //   debugPrint("sdfsdfsdf");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCameraMove(CameraPosition position) {
    curLat = position.target.latitude;
    curLng = position.target.longitude;
    debugPrint(
        "_onCameraMove   ${position.target.longitude}   ,  ${position.target
            .longitude}");
  }


  void getCurrentLocation() async {
    debugPrint("current loc fun calling");

    var currentLoc = await locationObj.getLocation();
    debugPrint("current loc=${currentLoc.latitude}  ${currentLoc.longitude}");
    curLat = currentLoc.latitude!;
    curLng = currentLoc.longitude!;

    _controller
        ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      target: LatLng(curLat, curLng),
      zoom: 12.0,
    )));

    /*locationObj.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print("loc.latitude  ${loc.latitude}");
      print("loc.longitude  ${loc.longitude}");
      setState(() {
      _markers.add(Marker(
        markerId: MarkerId('Home'),
        position: LatLng(curLat, curLng),
        icon: customIcon!,
        infoWindow: InfoWindow(title: ('$curLat, $curLng').toString(), snippet: "go here"),));
    });
    });*/

  }

  Future<void> checkPermissions() async {
    _serviceEnabled = await locationObj.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationObj.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await locationObj.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationObj.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    getCurrentLocation();
  }

    void showBottomSht(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc){
            return Container(
              margin: EdgeInsets.only(left: 10,right: 10),

              child: Wrap(
                children: <Widget>[
                  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,                    children: [

                    SizedBox(),
                    Text("Add New Address"),
                    IconButton(onPressed: (){
                    }, icon: Image.asset(ImagesString.circle_grey_filled))
                  ],),
                  emailField(),
                  emailField(),
                  emailField(),
                  emailField(),
                  submitButton()
                ],
              ),
            );});
     }


  Widget emailField() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child:  TextFormField(
       // controller: emailController,
        style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.RobotoMedium),
        maxLines: 1,
        decoration:  InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appBlackColor)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appOrangeColor)),
          border: UnderlineInputBorder(),
          fillColor: AppColor.appHintColor,
          labelText: 'Email Address',
          labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
              color: AppColor.appHintColor,
              fontFamily: AppFontFamily.RobotoMedium),
        ),
      ),
    );
  }

  Widget submitButton() {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pop(context);
    //    updateProfileApi();

      },
      child: Center(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * AppWidgetSize.sideMargins),
          width: MediaQuery.of(context).size.width * AppWidgetSize.appButtonWidth,
          height: MediaQuery.of(context).size.height * AppWidgetSize.appButtonHeight,
          decoration: BoxDecoration(

            color: AppColor.appOrangeColor,
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * AppWidgetSize.appButtonBorderRadius)),
          ),
          child:  Text(
              "Submit",
              style: TextStyle(color: AppColor.appWhiteColor,
                  fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentFontSize,
                  fontFamily: AppFontFamily.RobotoMedium
              )),
        ),
      ),
    );
  }


}


