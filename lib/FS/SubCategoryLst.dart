
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_reader_app/Constants/app_color.dart';
import 'package:intelligent_reader_app/Constants/app_strings.dart';
import 'package:intelligent_reader_app/Constants/app_widgetsize.dart';
import 'package:intelligent_reader_app/FS/MapSample/MapPage.dart';

class SubCategoryLst extends StatefulWidget {
  @override
  _subCategoryLstState createState() => _subCategoryLstState();

}

class _subCategoryLstState extends State<SubCategoryLst> {
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
                child:  CachedNetworkImage(
                  imageUrl: "http://via.placeholder.com/200x150",
                  width: sizeVal.height*0.13,
                  height: sizeVal.height*0.13,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                          colorFilter:
                          ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              title:   Text(
                'KindaCode.com',
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

}