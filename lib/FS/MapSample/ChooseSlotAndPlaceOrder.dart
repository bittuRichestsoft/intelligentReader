import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intelligent_reader_app/FS/Booking/BookingList.dart';
import 'package:intelligent_reader_app/FS/HomeFlash.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChooseSlottAndPlaceOrder extends StatefulWidget {
  @override
  State<ChooseSlottAndPlaceOrder> createState() => _ChooseSlottAndPlaceOrderState();
}
 class _ChooseSlottAndPlaceOrderState extends State<ChooseSlottAndPlaceOrder> {
   int? timeSelected;
  List<String> myProducts = [
  "10.00",
  "11.00",
  "12.00",
  "7.00",
  "10.00",
  "11.00",
  "12.00",
  "1.00",
  "10.00",
  "11.00",
  ];
  int? daySelected;
  List<String> days = [
  "Mon\n"
  "   1 ",
  "Tues\n"
  "   2",
  "Wed\n"
  "   3",
  "Thur\n"
  "   4",
  "Fri\n"
  "  5",
  "Sat\n"
  "   6",
  ];

  List<bool> isSelected = [false, false, false, false, false, false];
   _isSelected(index) {
  setState(() {
  for (int i = 0; i < isSelected.length; i++) {
  if (i == index) {
  daySelected = i;
  isSelected[i] = true;
  } else {
  isSelected[i] = false;
  }
  }
  // if (isSelected[index]) {
  //   isSelected[index] = false;
  // } else {
  //   isSelected[index] = true;
  // }
  });
  }
   List<bool> isTap = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
  ];
   _isTap(indexs) {
  setState(() {
  for (int j = 0; j < isTap.length; j++) {
  if (j == indexs) {
  isTap[j] = true;
  timeSelected = j;
  } else {
  isTap[j] = false;
  }
  }
  });
  }
   @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
  children: [
  Padding(
  padding: EdgeInsets.only(
  top: MediaQuery.of(context).size.height * 0.08)),
  Container(
  child: Row(children: [
  Padding(
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.04)),
  Text(
  'Address for the Service',
  style: TextStyle(color: Colors.grey),
  ),
  ])),
  Container(
  child: Row(
  children: [
  Padding(
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.03,
  ),
  child: ElevatedButton(
  style: ElevatedButton.styleFrom(
  primary: Color(0xFF0D47A1),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30))),
  onPressed: () {},
  child: Text(
  'Home',
  style: TextStyle(fontSize: 14),
  ),
  ),
  ),
  Text(
  '  10023,250E, D-Block,Aman Nagar,Mo..',
  style: TextStyle(fontSize: 14),
  ),
  Text(
  '   Change',
  style: TextStyle(
  color: Color(0xFF0D47A1),
  fontSize: 14,
  fontWeight: FontWeight.bold),
  ),
  ],
  )),
  Container(
  height: MediaQuery.of(context).size.height * 0.001,
  color: Colors.grey,
  ),
  Container(
  child: Row(children: [
  Padding(
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.03)),
  Text(
  '\nWhen would you like your service?',
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
  ])),
  SizedBox(
  height: MediaQuery.of(context).size.height * 0.04,
  ),
  Container(
  height: MediaQuery.of(context).size.height * 0.06,
  width: MediaQuery.of(context).size.width * 0.9,
  child: ListView.builder(
  shrinkWrap: true,
  itemCount: days.length,
  scrollDirection: Axis.horizontal,
  itemBuilder: (BuildContext context, index) {
  return GestureDetector(
  onTap: () {
  setState(() {
  _isSelected(index);
  });
  debugPrint('isselected=$index');
  },
  child: Container(
  padding: EdgeInsets.only(
  left: 1,
  right: 15,
  ),
  alignment: Alignment.center,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(1),
  ),
  child: Container(
  height: 45,
  width: 45,
  decoration: ShapeDecoration(
  color: isSelected[index]
  ? Colors.orange
      : Colors.transparent,
  shape: RoundedRectangleBorder(
  borderRadius:
  BorderRadius.circular(5),
  side:
  BorderSide(color: Colors.black))),
  alignment: Alignment.center,
  child: Text(
  days[index],
  style: TextStyle(fontSize: 12),
  )),
  ));
  }),
  ),
  Container(
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.04,
  right: MediaQuery.of(context).size.width * 0.04,
  ),
  child: GridView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  gridDelegate:
  const SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,
  childAspectRatio: 3 / 2,
  mainAxisExtent: 50,
  crossAxisSpacing: 10,
  mainAxisSpacing: 15),
  itemCount: myProducts.length,
  itemBuilder: (BuildContext ctx, indexs) {
  return GestureDetector(
  onTap: () {
  _isTap(indexs);
  debugPrint('isTap = $indexs');
  },
  child: Container(
  alignment: Alignment.center,
  decoration: ShapeDecoration(
  color: isTap[indexs]
  ? Colors.orange
      : Colors.transparent,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
  side: BorderSide(color: Colors.black)),
  ),
  child: Text(myProducts[indexs]),
  ));
  }),
  ),
  Padding(
  padding: EdgeInsets.only(
  top: MediaQuery.of(context).size.height * 0.03,
  )),
  Divider(
  height: MediaQuery.of(context).size.height * 0.01,
  ),
  Container(
  alignment: Alignment.centerLeft,
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.06,
  top: MediaQuery.of(context).size.height * 0.02),
  child: Row(children: [
  RichText(
  text: TextSpan(children: [
  TextSpan(
  text: '\u{20B9}1,222',
  style: TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold)),
  TextSpan(
  text: '\nView Details',
  style: TextStyle(
  color: Color(0xFF0D47A1), fontSize: 14),
  ),
  ]),
  ),
  Padding(
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.3,
  right: MediaQuery.of(context).size.width * 0.06,
  )),
  Container(
  child: ElevatedButton(
  style: ElevatedButton.styleFrom(
  primary: Color(0xFFFF6D00),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30))),
  onPressed: () {
  if (daySelected != null && timeSelected != null) {
  debugPrint(
  'Day is ${days[daySelected!]} and Time is ${myProducts[timeSelected!]}');
  } else {
  debugPrint("select day and time first");
  }
  // debugPrint('service recieved');
  },
  child: Text('Proceed to Pay')),
  )
  ])),
  SizedBox(
  height: MediaQuery.of(context).size.height * 0.01,
  ),
  Padding(
  padding: EdgeInsets.only(
  left: MediaQuery.of(context).size.width * 0.03),
  child: RichText(
  text: TextSpan(children: [
  TextSpan(
  text:
  ' By proceed you accept the latest versions of our ',
  style: TextStyle(color: Colors.black, fontSize: 12)),
  TextSpan(
  text: ' T\&C\'s,Privacy    policy',
  style: TextStyle(
  color: Color(0xFF0D47A1), fontSize: 13)),
  TextSpan(
  text: '  and',
  style: TextStyle(color: Colors.black, fontSize: 12),
  ),
  TextSpan(
  text: '  Cancellation policy',
  style:
  TextStyle(color: Color(0xFF0D47A1), fontSize: 13))
  ])))
  ],
  )
  //...
  ));
  }
}