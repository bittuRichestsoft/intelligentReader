/*
import 'package:get/state_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../Constants/ApiUrl.dart';

class LoginController extends GetxController {

*/
/*
  Rx<TextEditingController> name = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> lastName = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> email = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> password = Rx<TextEditingController>(TextEditingController());
*//*


  Future<String>  hitLoginApi(Map map, url1) async
  {
    try {
     */
/* var url = Uri.parse(
          "https://indeedtraining.in/intelligent-reader/public/api/loginWithLinkedIn");
      var response = await http.post(url, body: {
        'email': email.value.text.trim()            //'diksha@gmail.com'
        ,
        'first_name': name.value.text.trim(),//'diksha',
        'last_name':  lastName.value.text.trim(),          //'kapil',
        'provider': 'linkedIn',
        'provider_id': '77324834783888888',
        'user_type': 'publisher',
        'device_name': 'gjjkkjhj',
        'device_token': 'jjhbjb',
        'device_type': 'vghvhgvh'
      });*//*


      var baseUrl = ApiUrl.BASEURL+ url1;
      var url = Uri.parse(baseUrl);
      var response = await http.post(url, body:map);
      print('BaseUrl of Api : ${baseUrl}  \n ${map} ');
      print('Response of Api : ${response.body}');

      if (response.statusCode == 200) {
        return response.body;
        //flutter pub get
      }else if(response.statusCode == 401) {
        print("code401");
        return '{"message": "Unauthenticated","status": 403}';
      }
      else {
        return response.body;
      }
    }catch(e)
    {
      print('catch error is ${e.toString()}');
      return '{"message": "Unauthenticated","status": 403}';
    }
  }


}*/
