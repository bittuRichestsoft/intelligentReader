



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
       child: Container(
         height: sizeVal.height,
         width: sizeVal.width,
      color: Colors.purple,
       ) ,
    );
  }

}