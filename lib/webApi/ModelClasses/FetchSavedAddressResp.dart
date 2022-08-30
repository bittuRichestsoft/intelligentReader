// To parse this JSON data, do
//
//     final fetchSavedAddressRes = fetchSavedAddressResFromJson(jsonString);

import 'dart:convert';

FetchSavedAddressRes fetchSavedAddressResFromJson(String str) => FetchSavedAddressRes.fromJson(json.decode(str));

String fetchSavedAddressResToJson(FetchSavedAddressRes data) => json.encode(data.toJson());

class FetchSavedAddressRes {
  FetchSavedAddressRes({
    required     this.code,
    required this.message,
    required this.savedAddresses,
  });

  String code;
  String message;
  List<SavedAddress> savedAddresses;

  factory FetchSavedAddressRes.fromJson(Map<String, dynamic> json) => FetchSavedAddressRes(
    code: json["Code"],
    message: json["Message"],
    savedAddresses: List<SavedAddress>.from(json["SavedAddresses"].map((x) => SavedAddress.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "Message": message,
    "SavedAddresses": List<dynamic>.from(savedAddresses.map((x) => x.toJson())),
  };
}

class SavedAddress {
  SavedAddress({
required    this.id,
    required     this.userId,
    required this.addressType,
    required this.addressLocation,
    required this.addressflat,
    required this.title,
    required     this.name,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String addressType;
  String addressLocation;
  String addressflat;
  String title;
  String name;
  String latitude;
  String longitude;
  DateTime createdAt;
  DateTime updatedAt;

  factory SavedAddress.fromJson(Map<String, dynamic> json) => SavedAddress(
    id: json["id"],
    userId: json["user_id"],
    addressType: json["addressType"],
    addressLocation: json["addressLocation"],
    addressflat: json["addressflat"],
    title: json["title"],
    name: json["name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "addressType": addressType,
    "addressLocation": addressLocation,
    "addressflat": addressflat,
    "title": title,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
