


//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligent_reader_app/Constants/app_color.dart';
import 'package:intelligent_reader_app/FS/HomeFlash.dart';

import '../Constants/ImagesString.dart';

class ThirdPage extends StatefulWidget {
  @override
  _thirdPageState createState() => _thirdPageState();

}

class _thirdPageState extends State<ThirdPage> {
var sizeVal;
  @override
  Widget build(BuildContext context) {
    sizeVal =MediaQuery.of(context).size;
    return Material(
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: AppColor.appOrangeColor,
             leading: IconButton(
           icon: Icon(Icons.arrow_back, color: Colors.white),
           onPressed: () {
             Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (context) => HomeFlash(0)),
             );
           }  ,
         ),
           title: Text("Rewards"),
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
                     title: Text("This is my TItle"),
                     subtitle: Text("It’s all About this issue. Hope all solutions helped you a lot. Comment below Your thoughts and your queries. Also, Comment below which solution worked for you?"),
                     trailing:  SvgPicture.asset(ImagesString.reward2,
                     width: sizeVal.width*0.2,
                     height: sizeVal.width*0.2,),
                   ),
                 ),
            
dividerWithText(),
                 sharePlatform()
                 
   ],
             ),
           ),
         ),
       ) ,
    );
  }

Widget  dividerWithText() {
    return Stack(
 children: [
   Container(height: 40, child: Divider(height: 2, color: Colors.black,)),
Container(height: 40,child: Center(child: Text("Refer Via",style: TextStyle(backgroundColor: Colors.white),)))
   
 ],     
    );
    
  }

Widget  sharePlatform() {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("data"),
            SvgPicture.asset(ImagesString.reward2,
              width: sizeVal.width*0.1,
              height: sizeVal.width*0.1,)
          ],
        ),
        Column(
          children: [
            Text("data"),
            SvgPicture.asset(ImagesString.reward2,
             )
          ],
        ),
        Column(
          children: [
            Text("data"),
            SvgPicture.asset(ImagesString.reward2,
              /*width: sizeVal.width*0.2,
              height: sizeVal.width*0.2,*/)
          ],
        )

      ],
    );

  }

}