



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _fourthPageState createState() => _fourthPageState();

}

class _fourthPageState extends State<FourthPage> {
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