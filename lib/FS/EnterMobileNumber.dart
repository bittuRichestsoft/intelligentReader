import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Constants/app_color.dart';
import '../Constants/app_widgetsize.dart';
import 'OTPVerify.dart';

class EnterMobileNumber extends StatefulWidget {
  @override
  _enterMobileNumberState createState() => _enterMobileNumberState();
}

class _enterMobileNumberState extends State<EnterMobileNumber> {
  var sizeVal;
  TextEditingController phone_controller = TextEditingController();
  List<String> countriesList = ["+91"];
  var countryCodeValue;
  bool isNumberEnabled = true;

  @override
  Widget build(BuildContext context) {
    sizeVal = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          'assets/images/svg/login_bg.svg',
          fit: BoxFit.fill,
          //  height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: sizeVal.height,
          width: sizeVal.width,
          child: Column(
            children: [
              SizedBox(
                height: sizeVal.height * 0.05,
              ),
              Text(
                "data data",
                style: TextStyle(fontSize: sizeVal.width * 0.1),
              ),
              Center(
                child: Container(
                  width: sizeVal.width * 0.2,
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
              )
            ],
          ),
        ),
        Center(
          child: Container(
            height: sizeVal.height * 0.4,
            alignment: Alignment.centerLeft,

            width: sizeVal.width * 0.9,
            //  color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Phone Number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: sizeVal.width * 0.05,
                          )),
                    ),
                Container(
               height:sizeVal.height*0.05 ,
                  alignment: Alignment.centerLeft,
                  child: Text("Enter Phone Number",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: sizeVal.width * 0.02,
                        ))),
                    phoneField(),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: sizeVal.height * 0.1,
                      child:
                          Text("You will got an OTP on entered mobile number",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: sizeVal.width * 0.02,
                              )),
                    ),
                    sendOtpButton()
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    )
        // }  )
        );
  }

  Widget phoneField() {
    return Container(
          height: MediaQuery.of(context).size.height * 0.07,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: DropdownButtonFormField(
                focusColor: AppColor.appOrangeColor,
                isDense: true,
                isExpanded: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    /*fontFamily: AppFontFamily.UBUNTU_MEDIUM,*/
                    /*fontSize: MediaQuery.of(context).size.height *
                        AppWidgetSize.appXXSmallContentTitleFontSize*/
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.appBlackColor)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appBlackColor),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appBlackColor),
                  ),
                ),
                hint: Text(countriesList[0],
                    style: TextStyle(
                      color: Colors.grey,
                      /*  fontFamily: AppFontFamily.UBUNTU_MEDIUM,*/
                    ),
                    textAlign: TextAlign.right),
                icon: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ),
                items: countriesList.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          country,
                          style: TextStyle(
                            color: Colors.black,
                            /*    fontFamily: AppFontFamily.UBUNTU_LIGHT,*/
                          ),
                        ),

                        //  Image.network(category.flag,height: 20,width: 20,)
                      ],
                    ),
                  );
                }).toList(),
                value: countryCodeValue,
                onChanged: (valueSelectedByUser) {
                  setState(() {});
                }),
          ),
          Flexible(
            flex: 6,
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TextField(
                    enabled: isNumberEnabled,
                    controller: phone_controller,
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: Colors
                          .black, /*fontSize: MediaQuery.of(context).size.height * 0.02*/
                    ),

                    decoration: InputDecoration(
                      //  border: InputBorder.none,
                      hintText: 'Phone Number',
                      fillColor: Colors.black,
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        /*  fontSize: MediaQuery.of(context).size.height * 0.02,*/
                        /* fontFamily: AppFontFamily.UBUNTU_MEDIUM*/
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appBlackColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appBlackColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appBlackColor),
                      ),
                      /*  suffixIcon: Visibility(
                      visible: isSendOtpVisible,
                      child: IconButton(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1),
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.editPencilIcon),
                      ),
                    ),*/
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget sendOtpButton() {
    return GestureDetector(
      onTap: () {
       /* sendOtpApi();*/
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   OTPVerify()),
        );

      },
      child: Visibility(
        visible: true,
        child: Container(
          alignment: Alignment.center,

          width: MediaQuery.of(context).size.width * AppWidgetSize.appButtonWidth,
          height:
          MediaQuery.of(context).size.height * AppWidgetSize.appButtonHeight,
          decoration: BoxDecoration(
            color: AppColor.appOrangeColor,
            borderRadius: BorderRadius.all(Radius.circular(
                MediaQuery.of(context).size.width *
                    AppWidgetSize.appButtonBorderRadius)),
          ),
          child: Text("Send OTP",
              style: TextStyle(
                  color: AppColor.appWhiteColor,
                  fontSize: MediaQuery.of(context).size.height *
                      AppWidgetSize.appContentFontSize,
                  /*fontFamily: AppFontFamily.UBUNTU_MEDIUM*/)),
        ),
      ),
    );
  }

}
