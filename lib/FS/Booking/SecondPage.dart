



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _secondPageState createState() => _secondPageState();

}

class _secondPageState extends State<SecondPage> {
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