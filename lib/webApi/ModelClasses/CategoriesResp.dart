// To parse this JSON data, do
//
//     final categoriesResp = categoriesRespFromJson(jsonString);

import 'dart:convert';

CategoriesResp categoriesRespFromJson(String str) => CategoriesResp.fromJson(json.decode(str));

String categoriesRespToJson(CategoriesResp data) => json.encode(data.toJson());

class CategoriesResp {
  CategoriesResp({
 required   this.code,
    required   this.status,
    required this.listCategories,
  });

  String code;
  String status;
  List<ListCategory> listCategories;

  factory CategoriesResp.fromJson(Map<String, dynamic> json) => CategoriesResp(
    code: json["Code"],
    status: json["status"],
    listCategories: List<ListCategory>.from(json["ListCategories"].map((x) => ListCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "ListCategories": List<dynamic>.from(listCategories.map((x) => x.toJson())),
  };
}

class ListCategory {
  ListCategory({
    required this.categoryId,
    required this.categoryName,
    required this.imageUpload1,
    required this.charges,
    required this.date,
    required this.isActive,
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
