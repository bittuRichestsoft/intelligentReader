import 'package:flutter/material.dart';

//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_place/google_place.dart';
//import 'package:letsmeetappcode/httppp/ApiUrl.dart';

class CustomGooglePlaces extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CustomGooglePlaces> {
  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];
  String choosedAddress = "";
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    String
        apiKey = /*ApiUrl.kGoogleApiKey;*/ "AIzaSyBl8YPYAhb7DmlmyjK81AJX-hdtavJi-es"; // DotEnv().env['API_KEY'];
    googlePlace = GooglePlace(apiKey);
/*    onError: onError,
    mode: _mode,
    language: "en",*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: homeScaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/inner_page_background.jpg',
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.of(context).maybePop();
                    },
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2,
                      ),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('images/logo_final_big.png'),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          left: MediaQuery.of(context).size.width * 0.1 + 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.02,
                              top: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).maybePop();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: SvgPicture.asset(
                                  "images/svgicons/002-error.svg",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                    setState(() {
                      choosedAddress = value;
                    });
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
            ),
            Container(
              //      height: 40,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.water_damage_sharp,
                    color: Colors.white,
                  ),
                ),
                title: Text((choosedAddress.replaceAll(" ", "") == "")
                    ? "Search Your Address"
                    : choosedAddress),
                onTap: () {
                  debugPrint(
                      "Custom Address before space=}" + choosedAddress + "{");
                  choosedAddress = choosedAddress.trimLeft();
                  choosedAddress = choosedAddress.trimRight();
                  debugPrint(
                      "Custom Address after space=}" + choosedAddress + "{");
                  if (choosedAddress == "") {
                    showSnackBar("Please enter any location name");
                  } else {
                    Navigator.of(context).pop(
                        {'choosedLoc': choosedAddress.replaceAll(",", "")});
                  }
                },
              ),
            ),
            SizedBox(),
            Expanded(
              child: ListView.builder(
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(predictions[index].description!),
                    onTap: () {
                      debugPrint("choosed " + predictions[index].description!);
                      Navigator.of(context).pop({
                        'choosedLoc':
                            predictions[index].description!.replaceAll(",", "")
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset("images/powered_by_google.png"),
            ),
          ],
        ),
      ),
    ));

    /*Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  setState(() {
                    choosedAddress=value;
                  });
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
              Container(
          //      height: 40,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.water_damage_sharp,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(choosedAddress==""? "Add Your Address": choosedAddress),
                  onTap: () {
                    debugPrint("Custom Address="+choosedAddress);
 */
    /*
  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            placeId: predictions[index].placeId,
            googlePlace: googlePlace,
          ),
        ),);*/ /*
                  },
                ),
              ),
SizedBox(),
              Expanded(
                child: ListView.builder(
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(predictions[index].description),
                      onTap: () {
                        debugPrint("choosed "+  predictions[index].description);
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset("assets/powered_by_google.png"),
              ),
            ],
          ),
        ),
      ),
    );*/
  }

  void showSnackBar(String message) {
    final snackBarContent = SnackBar(
      content: Text(
        message,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      action: SnackBarAction(
          label: 'OK',
          onPressed: homeScaffoldKey.currentState!.hideCurrentSnackBar),
      duration: Duration(seconds: 5),
    );
    homeScaffoldKey.currentState!.showSnackBar(snackBarContent);
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace!.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }
}

/*
class DetailsPage extends StatefulWidget {
  final String placeId;
  final GooglePlace googlePlace;
  DetailsPage({Key key, this.placeId, this.googlePlace}) : super(key: key);
  @override
  _DetailsPageState createState() =>
      _DetailsPageState(this.placeId, this.googlePlace);
}

class _DetailsPageState extends State<DetailsPage> {
  final String placeId;
  final GooglePlace googlePlace;

  _DetailsPageState(this.placeId, this.googlePlace);

  DetailsResult detailsResult;
  List<Uint8List> images = [];

  @override
  void initState() {
    getDetils(this.placeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          getDetils(this.placeId);
        },
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.memory(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      detailsResult != null && detailsResult.types != null
                          ? Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: detailsResult.types.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Chip(
                                label: Text(
                                  detailsResult.types[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.blueAccent,
                              ),
                            );
                          },
                        ),
                      )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.location_on),
                          ),
                          title: Text(
                            detailsResult != null &&
                                detailsResult.formattedAddress != null
                                ? 'Address: ${detailsResult.formattedAddress}'
                                : "Address: null",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.location_searching),
                          ),
                          title: Text(
                            detailsResult != null &&
                                detailsResult.geometry != null &&
                                detailsResult.geometry.location != null
                                ? 'Geometry: ${detailsResult.geometry.location.lat.toString()},${detailsResult.geometry.location.lng.toString()}'
                                : "Geometry: null",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.timelapse),
                          ),
                          title: Text(
                            detailsResult != null &&
                                detailsResult.utcOffset != null
                                ? 'UTC offset: ${detailsResult.utcOffset.toString()} min'
                                : "UTC offset: null",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.rate_review),
                          ),
                          title: Text(
                            detailsResult != null &&
                                detailsResult.rating != null
                                ? 'Rating: ${detailsResult.rating.toString()}'
                                : "Rating: null",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.attach_money),
                          ),
                          title: Text(
                            detailsResult != null &&
                                detailsResult.priceLevel != null
                                ? 'Price level: ${detailsResult.priceLevel.toString()}'
                                : "Price level: null",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset("assets/powered_by_google.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getDetils(String placeId) async {
    var result = await this.googlePlace.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      setState(() {
        detailsResult = result.result;
        images = [];
      });

      if (result.result.photos != null) {
        for (var photo in result.result.photos) {
          getPhoto(photo.photoReference);
        }
      }
    }
  }

  void getPhoto(String photoReference) async {
    var result = await this.googlePlace.photos.get(photoReference, null, 400);
    if (result != null && mounted) {
      setState(() {
        images.add(result);
      });
    }
  }
}
*/
