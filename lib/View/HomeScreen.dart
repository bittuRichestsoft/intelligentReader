/*


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
  
}

class _homeScreenState extends State<HomeScreen>
{
  
  
  @override
  Widget build(BuildContext context) {
  return Container(
color: Colors.amber,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
  );
  
  }
  
}
*/
























/*

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:location/location.dart' as geo;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../Constants/AppFontFamily.dart';
import '../../Constants/app_color.dart';
import '../../Constants/app_widgetsize.dart';

class MapPage extends StatefulWidget {
  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  GoogleMapController? _controller;

  var sizeVal;

  geo.Location locationObj = geo.Location()  ;
  double curLat = 0.0;
  double curLng = 0.0;
  Set<Marker> _markers = {};
  bool _serviceEnabled = false;
  geo.PermissionStatus? _permissionGranted;

  var delayableSecond =5;

  Duration _elapsed = Duration.zero;
  // 2. declare Ticker
  late final Ticker _ticker;

  @override
  void initState() {
    checkPermissions();
    try {
      getCurrentLocation();
    }
    catch (exp) {
      debugPrint("excep= ${exp}");
    }
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;

        var splittedStr= _elapsed.toString().split(".")[0];
        var splittedStr2= splittedStr.toString().split(":")[2];


        if(splittedStr2=="05"){
          debugPrint("timer matchedAndStopped= $splittedStr2");
          updateTextLoc();
          stopTicker();
        }
      });
    });
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

  Future<void> _onCameraMove(CameraPosition position) async  {


    setState(() {
      delayableSecond=5;
    });
    curLat = position.target.latitude;
    curLng = position.target.longitude;
    debugPrint("_onCameraMove   ${position.target.longitude}   ,  ${position.target
        .longitude}");
*/
/*updateTextLoc();*//*

    startTicker();

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

    */
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
    });*//*


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
    if (_permissionGranted == geo.PermissionStatus.denied) {
      _permissionGranted = await locationObj.requestPermission();
      if (_permissionGranted != geo.PermissionStatus.granted) {
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

            */
/* child: Wrap(
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
              ),*//*

            child: Wrap(
              children: [
                TextFormField(decoration: InputDecoration(labelText: "Your Location",suffix:TextButton(onPressed: (){}, child: Text("Change"))),),
                TextFormField(decoration: InputDecoration(labelText: "Flat/building/Street"),),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: TextFormField(decoration: InputDecoration(labelText: "Your Name"),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: Text("Save as",textAlign: TextAlign.left,),
                ),
                SizedBox(height: 15,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

                  OutlinedButton(onPressed: (){}, child: Text("Home")),
                  OutlinedButton(onPressed: (){}, child: Text("Office")),OutlinedButton(onPressed: (){}, child: Text("Other"))
                ],),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){}, child: Text("Add Flat/Building/Street"),style: ElevatedButton.styleFrom(primary: Colors.orange,fixedSize: Size(400, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))))
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

  void updateTextLoc() async {

    */
/* var chkTime=false;
    Future.delayed(Duration(seconds: delayableSecond), (){
      DateTime now = new DateTime.now();
      print("Executed after $delayableSecond");
    });*//*


    List<Placemark> placemarks = await placemarkFromCoordinates(curLat,curLng);
    debugPrint(
        "updateTextLoc   ${placemarks.toString()}");
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
  stopTicker(){
    setState((){
      _ticker.stop();
    });
  }
  startTicker(){
    setState((){
      _ticker.stop();
      _ticker.start();
    });
  }
}


*/
