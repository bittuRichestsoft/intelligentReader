import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChooseSlottAndPlaceOrder extends StatefulWidget {
  @override
  State<ChooseSlottAndPlaceOrder> createState() => _ChooseSlottAndPlaceOrderState();
}

class _ChooseSlottAndPlaceOrderState extends State<ChooseSlottAndPlaceOrder> {
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
Size? sizeVal;

  @override
  Widget build(BuildContext context) {
     sizeVal=MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 56, 0),
                  child: Text('Address for the Service'),
                ),
                SizedBox(
                  height: sizeVal!.height*(0.02),
                ),
                Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text('Home'),
                        ),
                        Text('    10023,250d, D Block,Aman Nagar,Mo...'),
                        Text(
                          '      Change',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: sizeVal!.height*(0.04) ,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    )),
                Divider(
                  height:sizeVal!.height*(0.01),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                  child: Text(
                    '\n\nWhen would you like your service?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizeVal!.height*(0.02),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: days.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              debugPrint('selected=$index');
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                              ),
                              child: Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.1,
                                  width:
                                  MediaQuery.of(context).size.width * 0.1,
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(1),
                                          side:
                                          BorderSide(color: Colors.black))),
                                  alignment: Alignment.center,
                                  child: Text(days[index])),
                            ));
                      }),
                ),
                Container(
                  child: GridView.builder(
                      padding: EdgeInsets.all(18),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          mainAxisExtent: 50,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: myProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(1)),
                          child: Text(myProducts[index]),
                        );
                      }),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(10, 0, 40, 0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '1,222', style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: '\nView Details',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: sizeVal!.height*(0.02)),
                      ),
                    ]),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      debugPrint('array length=&index');
                    },
                    child: Text('Proceed to Pay')),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: ' By proceed you accept the latest versions of our',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:sizeVal!.height*(0.02))),
                      TextSpan(
                          text: 'Tc\'s,Privacy  policy ',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: sizeVal!.height*(0.02))),
                      TextSpan(
                        text: ' and',
                        style: TextStyle(
                            color: Colors.black, fontSize: sizeVal!.height*(0.02)),
                      ),
                      TextSpan(
                          text: '  Cancellation policy',
                          style: TextStyle(
                              color: Colors.blue, fontSize:sizeVal!.height*(0.02)))
                    ]))
              ],
            )
          //...
        ));
  }
}
