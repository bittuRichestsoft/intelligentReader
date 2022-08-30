
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Constants/ApiUrl.dart';


class WebApi {

  Future<String> send_request_with_map(Map map, url1) async {
    var baseUrl = ApiUrl.BASEURL+ url1;
    var url = Uri.parse(baseUrl);
    var response = await http.post(url, body:map);
    print('BaseUrl of Api : ${baseUrl}  \n ${map} ');
    print('Response of Api : ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
      //flutter pub get
    }
    else if(response.statusCode == 401) {
      print("code401");
      return '{"message": "Unauthenticated","status": 403}';
    }
    else {
      return response.body;
    }
  }



  Future<String> post_with_header_with_map(url,Map map, String token) async {
    var baseUrl = ApiUrl.BASEURL+ url;
    Uri myUri = Uri. parse("$baseUrl" );
    final response = await http.post(
      myUri,body:map,
      headers: <String, String>{'Authorization':'$token',},);
    print('BaseUrl of Api : ${baseUrl}  \n');
    print('Response of Api : ${response.body}\n token=$token  \n responseCode=${response.statusCode}');
    if (response.statusCode == 200) {
      return response.body;
    }else if(response.statusCode == 401) {

      print("code401");
      return '{"message": "Unauthenticated","status": 403}';
    } else if(response.statusCode == 403) {
      print("code403");
      return '{"message": "Unauthenticated","status": 403}';
    }
    else {
      return response.body;
    }
  }



  Future<String> get_request_with_header(url, String token) async {
    var baseUrl = ApiUrl.BASEURL+ url;
    Uri myUri = Uri. parse("$baseUrl" );


    final response = await http.get(
      myUri,
      headers: <String, String>{'Authorization':'$token',},);
    print('BaseUrl of Api : ${baseUrl}  \n  Authorization:$token' );
    print('Response of Api : ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    }else if(response.statusCode == 401) {

      print("code401");

      return '{"message": "Unauthenticated","status": 403}';
    }
    else {
      return response.body;
    }
  }



  Future<String> get_Request(url1) async {
    var baseUrl = ApiUrl.BASEURL+ url1;
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    print('BaseUrl of Api : ${baseUrl}  \n');
    print('Response of Api : ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
      //flutter pub get
    }
    else {
      return response.body;
    }
  }


}