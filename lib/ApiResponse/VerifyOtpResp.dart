// To parse this JSON data, do
//
//     final otpVerifyResp = otpVerifyRespFromJson(jsonString);

import 'dart:convert';

OtpVerifyResp otpVerifyRespFromJson(String str) => OtpVerifyResp.fromJson(json.decode(str));

String otpVerifyRespToJson(OtpVerifyResp data) => json.encode(data.toJson());

class OtpVerifyResp {
  OtpVerifyResp({
   required this.code,
    required    this.status,
    required this.otp,
    required     this.isUpdatedProfile,
    required this.userId,
    required this.message,
  });

  String code;
  String status;
  String otp;
  int isUpdatedProfile;
  int userId;
  String message;

  factory OtpVerifyResp.fromJson(Map<String, dynamic> json) => OtpVerifyResp(
    code: json["Code"],
    status: json["status"],
    otp: json["OTP"],
    isUpdatedProfile: json["IsUpdatedProfile"],
    userId: json["UserId"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "OTP": otp,
    "IsUpdatedProfile": isUpdatedProfile,
    "UserId": userId,
    "Message": message,
  };
}
