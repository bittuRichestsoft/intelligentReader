
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryLst extends StatefulWidget {
  @override
  _subCategoryLstState createState() => _subCategoryLstState();

}

class _subCategoryLstState extends State<SubCategoryLst> {
  var sizeVal;
  @override
  Widget build(BuildContext context) {
    sizeVal =MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: sizeVal.height,
        width: sizeVal.width,
        color: Colors.purple,
    child:  ListView.builder(
      scrollDirection: Axis.vertical,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => Card(

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
    )
      ) ,
    );
  }

}