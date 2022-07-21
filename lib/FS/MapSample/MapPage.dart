import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:location/location.dart';
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
  double zoomLevel = 18;
  Set<Marker> _markers = {};
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
var mapHeight=0.0,addressHeight=0.0;
  TextEditingController address_controller = TextEditingController();

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
mapHeight=sizeVal.height*0.6;
addressHeight=sizeVal.height*0.4;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColor.appOrangeColor,
          title: Text("Choose Address"),
      leading:  GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,

        ),
      ) ,
      ),
      body: Container(
        height: sizeVal.height,
        width: sizeVal.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: mapHeight,
                  width: sizeVal.width,
                  child: Stack(
                      children: [
                        GoogleMap(
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: curLat == 0.0
                              ? const LatLng(30.70, 76.71)
                              : LatLng(curLat,
                              curLng),
                          zoom:35,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                        },
                        onCameraMove: _onCameraMove,
                        markers: _markers,
                      ),
                        Center(
                          child: Image.asset(ImagesString.homePng),
                        ),
                        Align(
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
                      ]

                  ),
                ),
                /*GestureDetector(
                  onTap: () {
                    showBottomSht(context);
                  },
                  child: Container(height: 40, width: 40, color: Colors.green,),
                )
*/

                addressHeight==sizeVal.height*0.5?
            Container(
              height: addressHeight,
      margin: EdgeInsets.only(left: 10,right: 10) ,

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
    ): Container(
                  height: addressHeight,
                  margin: EdgeInsets.only(left: 10,right: 10) ,
                  child:Column(
                  children: <Widget>[

                    ListTile(
                      title:                       TextField(
                        controller: address_controller,

                        maxLines: 2,
                        style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.RobotoMedium),
                         decoration:  InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appBlackColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.appOrangeColor)),
                          border: UnderlineInputBorder(),
                          fillColor: AppColor.appHintColor,
                          labelText: 'Your Address',
                          labelStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentSmallFontSize,
                              color: AppColor.appHintColor,
                              fontFamily: AppFontFamily.RobotoMedium),
                        ),
                      ),
                         trailing:                       InkWell(
                           onTap: (){
                             debugPrint("Change pressed");
                             setState(() {
                               addressHeight=sizeVal.height*0.5;
                               mapHeight=sizeVal.height*0.5;
                             });

                           },
                           child: Text("Change",  style: TextStyle(color: AppColor.appOrangeColor,fontFamily: AppFontFamily.RobotoBold),
                           ),
                         ),
                    ),


                    addMoreDetails()
                  ],
          )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onCameraMove(CameraPosition position) async {
    curLat = position.target.latitude;
    curLng = position.target.longitude;
    debugPrint(
        "_onCameraMove   ${position.target.longitude}   ,  ${position.target
        .longitude}");
  /*  final coordinates =   Coordinates(
        curLat,curLng);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
*/

    address_controller.text="${position.target.longitude}   ,  ${position.target
        .longitude}" ;
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


    /*CameraPosition(
      target: curLat == 0.0
          ? const LatLng(30.70, 76.71)
          : LatLng(curLat,
          curLng),
      zoom: 22.0,
    );*/
    setState(() {
      zoomLevel=22;
      zoomLevel++;
      debugPrint("zoomlvl=$zoomLevel");

    });
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
        setState(() {
          addressHeight=sizeVal.height*0.2;
          mapHeight=sizeVal.height*0.8;
        });


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
  Widget addMoreDetails() {
    return GestureDetector(
      onTap: ()
      {
        debugPrint("addMoreDetails pressed");
        setState(() {
          addressHeight=sizeVal.height*0.5;
          mapHeight=sizeVal.height*0.5;
        });
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
              "Add More Details",
              style: TextStyle(color: AppColor.appWhiteColor,
                  fontSize: MediaQuery.of(context).size.height * AppWidgetSize.appContentFontSize,
                  fontFamily: AppFontFamily.RobotoMedium
              )),
        ),
      ),
    );
  }


}


