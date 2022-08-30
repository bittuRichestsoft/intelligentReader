// To parse this JSON data, do
//
//     final bannerImagesResp = bannerImagesRespFromJson(jsonString);

import 'dart:convert';

BannerImagesResp bannerImagesRespFromJson(String str) => BannerImagesResp.fromJson(json.decode(str));

String bannerImagesRespToJson(BannerImagesResp data) => json.encode(data.toJson());

class BannerImagesResp {
  BannerImagesResp({
   required this.code,
    required this.status,
    required this.listBannerImages,
  });

  String code;
  String status;
  List<ListBannerImage> listBannerImages;

  factory BannerImagesResp.fromJson(Map<String, dynamic> json) => BannerImagesResp(
    code: json["Code"],
    status: json["status"],
    listBannerImages: List<ListBannerImage>.from(json["ListBannerImages"].map((x) => ListBannerImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "ListBannerImages": List<dynamic>.from(listBannerImages.map((x) => x.toJson())),
  };
}

class ListBannerImage {
  ListBannerImage({
    required this.id,
    required this.name,
    required this.imageUpload1,
    required this.date,
    required this.isActive,
  });

  int id;
  String name;
  String imageUpload1;
  DateTime date;
  int isActive;

  factory ListBannerImage.fromJson(Map<String, dynamic> json) => ListBannerImage(
    id: json["Id"],
    name: json["name"],
    imageUpload1: json["image_upload1"],
    date: DateTime.parse(json["date"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "name": name,
    "image_upload1": imageUpload1,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "isActive": isActive,
  };
}
