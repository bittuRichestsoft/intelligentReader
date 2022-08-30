// To parse this JSON data, do
//
//     final subCatRes = subCatResFromJson(jsonString);

import 'dart:convert';

SubCatRes subCatResFromJson(String str) => SubCatRes.fromJson(json.decode(str));

String subCatResToJson(SubCatRes data) => json.encode(data.toJson());

class SubCatRes {
  SubCatRes({
   required this.code,
    required  this.message,
    required this.status,
    required this.listSubCategories,
  });

  String code;
  String message;
  String status;
  List<ListSubCategory> listSubCategories;

  factory SubCatRes.fromJson(Map<String, dynamic> json) => SubCatRes(
    code: json["Code"],
    message: json["Message"],
    status: json["status"],
    listSubCategories: List<ListSubCategory>.from(json["ListCategories"].map((x) => ListSubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "Message": message,
    "status": status,
    "ListCategories": List<dynamic>.from(listSubCategories.map((x) => x.toJson())),
  };
}

class ListSubCategory {
  ListSubCategory({
    required     this.serviceId,
    required this.categoryId,
    required this.service1,
    required this.price1,
    required this.isActive,
  });

  int serviceId;
  String categoryId;
  String service1;
  String price1;
  int isActive;

  factory ListSubCategory.fromJson(Map<String, dynamic> json) => ListSubCategory(
    serviceId: json["service_Id"],
    categoryId: json["category_Id"],
    service1: json["service1"],
    price1: json["price1"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "service_Id": serviceId,
    "category_Id": categoryId,
    "service1": service1,
    "price1": price1,
    "isActive": isActive,
  };
}
