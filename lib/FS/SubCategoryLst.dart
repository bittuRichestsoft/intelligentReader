
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intelligent_reader_app/Constants/app_color.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:intelligent_reader_app/Constants/app_widgetsize.dart';
import 'package:intelligent_reader_app/FS/MapSample/MapPage.dart';
import 'package:intelligent_reader_app/webApi/ModelClasses/SubCateResp.dart';

import '../Constants/ApiUrl.dart';
import '../Utilities/GlobalUtility.dart';
import '../Utilities/PreferenceUtils.dart';
import '../webApi/ModelClasses/CategoriesResp.dart';
import '../webApi/WebApi.dart';

class SubCategoryLst extends StatefulWidget {
String strCatId="";
  SubCategoryLst(holdCatId){
    strCatId=holdCatId.toString();
  }

  @override
  _subCategoryLstState createState() => _subCategoryLstState(strCatId);

}

class _subCategoryLstState extends State<SubCategoryLst> {
  String TAG="SubCategoryLst ";
  String strChoosedCatId="";
  String sessionId="";
  List<ListSubCategory> listSubCategories=[];

  _subCategoryLstState(holdCatId){
    strChoosedCatId=holdCatId;
  }


   @override
  void initState() {
     getSavedData();
    super.initState();
  }
  void getSavedData() async {
    PreferenceUtils preferenceUtils= PreferenceUtils();
    sessionId= await     preferenceUtils.getSessionId();
    debugPrint("$TAG sessionId=$sessionId");
    getSubCategories();
  }

  var sizeVal;
  @override
  Widget build(BuildContext context) {
    sizeVal =MediaQuery.of(context).size;
    return Scaffold(
appBar: AppBar(
  backgroundColor: AppColor.appOrangeColor,
  title: Text("Choose Subcategory"),
  leading:  GestureDetector(
    onTap: (){
      Navigator.pop(context);
    },
    child: Icon(
      Icons.arrow_back,
      color: Colors.white,

    ),
  ) ,
),
      body: Container(
        height: sizeVal.height,
        width: sizeVal.width,
      margin: EdgeInsets.only(left: sizeVal.width*AppWidgetSize.sideMargins,right: sizeVal.width*AppWidgetSize.sideMargins,),
    child:  ListView.builder(
      scrollDirection: Axis.vertical,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => Card(

        child: GestureDetector(

          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   MapPage()),
            );
           },
          child: Container(

            width: sizeVal.width,
          height: sizeVal.height*0.15,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.white),
                  ),
           padding: EdgeInsets.all(5),
            child:/*Row(
              children : [
              ]           ),*/

            GridTileBar(

              backgroundColor: Colors.white,
              leading:Transform(
                transform: Matrix4.translationValues(-8, 0.0, 0.0),
                child:
       Image.network("https://flashservices.in/uploads/cctvcamera.png",fit: BoxFit.cover,),

                // SvgPicture.network(/*ApiUrl.BASEURLForBanners+listSubCategories[index].imageUpload1*/),
              ),
              title:   Text(
                listSubCategories[index].service1,
               maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
               /* style: TextStyle(color: Colors.black),*/
              ),

              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.navigate_next,
                    color: Colors.black54,
                  )),
            ),
          ),
        ),
      ),
    )
      ) ,
    );
  }

  void getSubCategories() async {

    var check_internet = await GlobalUtility().isConnected();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (check_internet) {

      GlobalUtility().showLoaderDialog(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      Map map = {
        "category_id":strChoosedCatId
      };
       String apiResponse = await WebApi().post_with_header_with_map( ApiUrl.ListSubCategories,map,sessionId);
      setState(() {
        Navigator.of(context).pop();
        var jsondata = json.decode(apiResponse);
        String message = "jsondata['Message']";
        String status = jsondata['Code'];
        if (status == "200") {
          SubCatRes subCatRes = subCatResFromJson(apiResponse);
          listSubCategories= subCatRes.listSubCategories;
        } else if (status == "400") {
          GlobalUtility().showSnackBar(message, context);
        } else if (status == "403") {
          GlobalUtility().setSessionEmpty(context);
        } else {
          GlobalUtility().showSnackBar(message, context);
        }
      });
    } else {
      GlobalUtility()
          .showSnackBar(AppStrings.PleaseCheckInternetConnection, context);
    }
  }
}