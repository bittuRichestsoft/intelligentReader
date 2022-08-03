
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/ImagesString.dart';
import '../../Constants/app_color.dart';

class RefferAndEarn extends StatefulWidget {
  @override
  _RefferAndEarnState createState() => _RefferAndEarnState();

}

class _RefferAndEarnState extends State<RefferAndEarn> {


  var sizeVal;

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery
        .of(context)
        .size;
    return Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.appOrangeColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                /*     Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeFlash(0)),
                );*/
              },
            ),
            title: Text("My Wallet"),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
                height: sizeVal.height,
                width: sizeVal.width,
                child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("Reffer and Earn"),
                          subtitle: Text("Gurante Awarded to everyone"),
                          leading: SvgPicture.asset(ImagesString.reward2,
                            width: sizeVal.width * 0.2,
                            height: sizeVal.width * 0.2,),
                          trailing: SvgPicture.asset(ImagesString.reward2,
                            width: sizeVal.width * 0.2,
                            height: sizeVal.width * 0.2,),),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ListTile(
                              title: Text("Reffer and Earn"),
                              subtitle: Text("Gurante Awarded to everyone"),
                              leading: SvgPicture.asset(ImagesString.reward2,
                                width: sizeVal.width * 0.2,
                                height: sizeVal.width * 0.2,),
                            ),


                          ],

                        ),


                      ),
                    ]
                )

            ),
          ),
        )
    );
  }

  Widget dividerWithText() {
    return Stack(
      children: [
        Container(height: 40, child: Divider(height: 2, color: Colors.black,),
        ),
        Container(height: 40,
            child: Center(child: Text(
              "Refer Via", style: TextStyle(backgroundColor: Colors.white),)))
      ],
    );
  }
}