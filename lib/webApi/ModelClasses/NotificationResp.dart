// To parse this JSON data, do
//
//     final notificationResp = notificationRespFromJson(jsonString);

import 'dart:convert';

NotificationResp notificationRespFromJson(String str) => NotificationResp.fromJson(json.decode(str));

String notificationRespToJson(NotificationResp data) => json.encode(data.toJson());

class NotificationResp {
  NotificationResp({
    this.code,
    this.status,
    this.message,
    this.notificationList,
  });

  String? code;
  String? status;
  String? message;
  List<NotificationList>? notificationList;

  factory NotificationResp.fromJson(Map<String, dynamic> json) => NotificationResp(
    code: json["Code"],
    status: json["status"],
    message: json["Message"],
    notificationList: List<NotificationList>.from(json["NotificationList"].map((x) => NotificationList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "Message": message,
    "NotificationList": List<dynamic>.from(notificationList!.map((x) => x.toJson())),
  };
}

class NotificationList {
  NotificationList({
    this.id,
    this.title,
    this.note,
    this.date,
    this.isActive,
  });

  int? id;
  String? title;
  String? note;
  String? date;
  int? isActive;

  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    id: json["Id"],
    title: json["title"],
    note: json["note"],
    date: json["date"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "title": title,
    "note": note,
    "date": date,
    "isActive": isActive,
  };
}
