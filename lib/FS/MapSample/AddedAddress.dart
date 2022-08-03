import 'package:flutter/material.dart';

class AddedAddress extends StatefulWidget {
  @override
  State<AddedAddress> createState() => _AddedAddressState();
}

class _AddedAddressState extends State<AddedAddress> {
  List<String> data = [
    "office",
    "Home",
    "Lily Home",
    "Home",
    "office",
    "office",
    "Home",
    "Lily Home",
    "Home",
    "office"
  ];

  List<String> adr = [
    "11",
    "111",
    "112",
    "113",
    "114",
    "115",
    "116",
    "117",
    "118",
    "119",
  ];

  // List<String> edit =[]

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Address',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: ListTile(
                          title: Text(
                            data[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            SnackBar snackBar = SnackBar(
                                content: Text("Tapped : ${index + 1}"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          subtitle: Text(adr[index]),
                          trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                ),
                              ])),
                    ),
                  );
                },
              )),
          Container(
        //    padding: EdgeInsets.only(top: height * 0.8),
            width: MediaQuery.of(context).size.width * 0.6,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              onPressed: () {},
              child: Text('Confirm'),
            ),
          )
        ])));
  }
}
