// To parse this JSON data, do
//
//     final searchCatRes = searchCatResFromJson(jsonString);

import 'dart:convert';

SearchCatRes searchCatResFromJson(String str) => SearchCatRes.fromJson(json.decode(str));

String searchCatResToJson(SearchCatRes data) => json.encode(data.toJson());

class SearchCatRes {
  SearchCatRes({
  required  this.code,
    required   this.status,
    required this.message,
    required    this.listCategories,
  });

  String code;
  String status;
  String message;
  List<ListCategory> listCategories;

  factory SearchCatRes.fromJson(Map<String, dynamic> json) => SearchCatRes(
    code: json["Code"],
    status: json["status"],
    message: json["Message"],
    listCategories: List<ListCategory>.from(json["ListCategories"].map((x) => ListCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "Message": message,
    "ListCategories": List<dynamic>.from(listCategories.map((x) => x.toJson())),
  };
}

class ListCategory {
  ListCategory({
    required     this.categoryId,
    required this.categoryName,
    required this.imageUpload1,
    required this.charges,
    required this.date,
    required     this.isActive,
  });

  int categoryId;
  String categoryName;
  String imageUpload1;
  String charges;
  DateTime date;
  int isActive;

  factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
    categoryId: json["category_Id"],
    categoryName: json["category_name"],
    imageUpload1: json["image_upload1"],
    charges: json["charges"],
    date: DateTime.parse(json["date"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "category_Id": categoryId,
    "category_name": categoryName,
    "image_upload1": imageUpload1,
    "charges": charges,
    "date": date.toIso8601String(),
    "isActive": isActive,
  };
}
