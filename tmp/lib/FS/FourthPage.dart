
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_reader_app/FS/UpdateProfile.dart';

class FourthPage extends StatefulWidget {
  @override
  _fourthPageState createState() => _fourthPageState();

}

class _fourthPageState extends State<FourthPage> {
  var sizeVal;
  @override
  Widget build(BuildContext context) {
    sizeVal =MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: sizeVal.height,
        width: sizeVal.width,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(sizeVal.width*0.03),
              height: sizeVal.height*0.1,
              child: UserInfo(),
            ),
            Divider(height: 2,),
            shareWidget(),
            Divider(height: 2,),
            referWidget(),
            Divider(height: 2,),
            inboxWidget(),
            Divider(height: 2,),
            scheduledBookingWidget(),
            Divider(height: 2,),
            moreServiceWidget(),
            Divider(height: 2,),
            LogoutWidget(),
            Divider(height: 2,),
          ],
        ),
      ) ,
    );
  }

  Widget shareWidget(){
    return ListTile(
        leading: const Icon(Icons.share),
        title: const Text("Share"),
        onTap: () => print("shareWidget clicked")
    );
  }
  Widget referWidget(){
    return ListTile(
        leading: const Icon(Icons.record_voice_over),
        title: const Text("Refer & Earn"),
        onTap: () => print("shareWidget clicked")
    );
  }
  Widget inboxWidget(){
    return ListTile(
        leading: const Icon(Icons.calendar_month_outlined,),
        title: const Text("My Inbox"),
        onTap: () => print("My Inbox clicked")
    );
  }
  Widget scheduledBookingWidget(){
    return ListTile(
        leading: const Icon(Icons.calendar_view_month_sharp,),
        title: const Text("Scheduled Booking"),
        onTap: () => print("Scheduled Booking clicked")
    );
  }
  Widget moreServiceWidget(){
    return ListTile(
        leading: const Icon(Icons.home,),
        title: const Text("More "),
        onTap: () => print("moreServiceWidget clicked")
    );
  }
  Widget LogoutWidget(){
    return ListTile(
        leading: const Icon(Icons.logout,),
        title: const Text("LogoutWidget "),

        onTap: () => print("LogoutWidget clicked")
    );
  }

  Widget UserInfo(){
    return ListTile(
      trailing: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   UpdateProfile()),
            );
          },
          child: Text("Edit")),
      title: const Text("Name "),
      subtitle: Text("Mobile"),
      //    onTap: () => print("LogoutWidget clicked")
    );

    /* return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 8, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Edit",
            textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight. bold),),
          Text("Mobile",
            textAlign: TextAlign.left,)
        ],)),
     Flexible(flex:2,
         child: Align(
alignment: Alignment.centerRight,           child: Text("Edit",
           textAlign: TextAlign.center,),
         ))
      ],
    );*/
  }
}
