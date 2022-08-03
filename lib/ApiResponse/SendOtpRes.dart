// To parse this JSON data, do
//
//     final sendOtpRes = sendOtpResFromJson(jsonString);

import 'dart:convert';

SendOtpRes sendOtpResFromJson(String str) => SendOtpRes.fromJson(json.decode(str));

String sendOtpResToJson(SendOtpRes data) => json.encode(data.toJson());

class SendOtpRes {
  SendOtpRes({
   required this.code,
    required this.status,
    required this.otp,
    required this.message,
  });

  String code;
  String status;
  int otp;
  String message;

  factory SendOtpRes.fromJson(Map<String, dynamic> json) => SendOtpRes(
    code: json["Code"],
    status: json["status"],
    otp: json["OTP"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "OTP": otp,
    "Message": message,
  };
}
