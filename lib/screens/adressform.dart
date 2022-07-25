// ignore_for_file: prefer_const_constructors_in_immutables
import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intelligent_reader_app/screens/widgetstest.dart';
import 'package:plain_notification_token/plain_notification_token.dart';
import 'package:select_form_field/select_form_field.dart';
import 'image.dart';

// ignore: must_be_immutable
class AddressForm extends StatefulWidget {
  AddressForm({Key? key}) : super(key: key);

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  var homebutton = false;
  var officebutton = false;
  var otherbutton = false;
  var selectionVal = 1;

  // ignore: non_constant_identifier_names
  final List<Map<String, dynamic>> _Gender = [
    {
      'value': 'MR',
      'label': 'MR',
    },
    {
      'value': 'MRS',
      'label': 'MRS',
    }
  ];
  String _pushToken = 'Unknown';
  IosNotificationSettings? _settings;

  late StreamSubscription onTokenRefreshSubscription;
  late StreamSubscription onIosSubscription;

  @override
  void initState() {
    super.initState();

    onTokenRefreshSubscription =
        PlainNotificationToken().onTokenRefresh.listen((token) {
      setState(() {
        _pushToken = token;
      });
    });
    onIosSubscription =
        PlainNotificationToken().onIosSettingsRegistered.listen((settings) {
      setState(() {
        _settings = settings;
      });
    });
  }

  @override
  void dispose() {
    onTokenRefreshSubscription.cancel();
    onIosSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adress Details")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: '''f2506, Block Alam Nagar Model MANE,14002
Maharashtra ,INDIA''',
                readOnly: true,
                maxLines: 2,
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      )),
                  labelText: "Your Location",
                  enabled: true,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Flat/building/Street"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      initialValue: 'circle',
                      labelText: 'Title',
                      items: _Gender,
                      // ignore: avoid_print
                      onChanged: (val) => print(val),
                      // ignore: avoid_print
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: "Your Name"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: Text(
                  "SaveAs",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: (selectionVal == 1)
                              ? Colors.amber
                              : Colors.transparent),
                      onPressed: () {
                        setState(() {
                          selectionVal = 1;
                          PlainNotificationToken().requestPermission();
                        });
                      },
                      child: Text("Home")),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: (selectionVal == 2)
                              ? Colors.amber
                              : Colors.transparent),
                      onPressed: () {
                        setState(() {
                          selectionVal = 2;
                        });
                      },
                      child: Text("Office")),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: (selectionVal == 3)
                              ? Colors.amber
                              : Colors.transparent),
                      onPressed: () {
                        setState(() {
                          selectionVal = 3;
                        });
                      },
                      child: Text("Other"))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    late String? token;
                    // Platform messages may fail, so we use a try/catch PlatformException.
                    try {
                      token = await PlainNotificationToken().getToken();
                    } on PlatformException {
                      token = 'Failed to get platform version.';
                    }
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(token ?? "(no token yet)")));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      fixedSize: Size(400, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45))),
                  child: Text("Add Flat/Building/Street"))
            ],
          ),
        ),
      ),
    );
  }
}
