import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_reader_app/Constants/ImagesString.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<MapPage> {
  GoogleMapController? _controller;

  var sizeVal;
  Location locationObj = Location();
  LatLng currentLocation= LatLng(0.0, 0.0);
  Set<Marker> _markers = {};
  bool _serviceEnabled=false;
  PermissionStatus? _permissionGranted;
  @override
  void initState() {
    checkPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sizeVal.height  ,
        width: sizeVal.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: sizeVal.height * 0.8,
                  width: sizeVal.width,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: currentLocation == null
                          ? LatLng(30.70, 76.71)
                          : LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!),
                      zoom: 12.0,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                    onCameraMove: _onCameraMove,
                    markers: _markers,
                  ),
                ),
GestureDetector(
  onTap: (){
    debugPrint("sdfsdfsdf");

  },
  child: Container(height: 40,width: 40,color: Colors.green,),
)
              ],
            ),
            Container(
        color: Colors.pink,
              margin: EdgeInsets.only(
                top: sizeVal.height * 0.1,
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
                 //   getCurrentLocation();
                  debugPrint("sdfsdfsdf");
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
    currentLocation = position.target ;
  }


  void getCurrentLocation() async {
    BitmapDescriptor?  customIcon;
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(12, 12)),
        ImagesString.homePng)
        .then((d) {
      customIcon = d;
    });

 var   currentLoc = await locationObj.getLocation();
 currentLocation=LatLng(currentLoc.latitude!,currentLoc.longitude!);
    locationObj.onLocationChanged.listen((LocationData loc) {
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
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
            icon: customIcon!,
          infoWindow: InfoWindow(title: currentLocation.toString(), snippet: "go here"),));
      });
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
}
