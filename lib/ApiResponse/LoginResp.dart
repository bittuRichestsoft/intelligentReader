// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
  LoginResp({
    required  this.status,
    required    this.message,
    required    this.loginData,
  });

  int status;
  String message;
  LoginData loginData;

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
    status: json["status"],
    message: json["message"],
    loginData: LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": loginData.toJson(),
  };
}

class LoginData {
  LoginData({
  required  this.id,
  required  this.firstName,
 required   this.lastName,
    required  this.email,
    required  this.profileImage,
    required   this.token,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String profileImage;
  String token;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    profileImage: json["profile_image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "profile_image": profileImage,
    "token": token,
  };
}
