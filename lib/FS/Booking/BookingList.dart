



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingList extends StatefulWidget {
  @override
  _secondPageState createState() => _secondPageState();

}

class _secondPageState extends State<BookingList> {
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