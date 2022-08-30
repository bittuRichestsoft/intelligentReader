// To parse this JSON data, do
//
//     final getReviewRes = getReviewResFromJson(jsonString);

import 'dart:convert';

GetReviewRes getReviewResFromJson(String str) => GetReviewRes.fromJson(json.decode(str));

String getReviewResToJson(GetReviewRes data) => json.encode(data.toJson());

class GetReviewRes {
  GetReviewRes({
    required   this.code,
    required   this.status,
    required    this.message,
    required    this.reviewData,
  });

  String code;
  String status;
  String message;
  List<ReviewDatum> reviewData;

  factory GetReviewRes.fromJson(Map<String, dynamic> json) => GetReviewRes(
    code: json["Code"],
    status: json["status"],
    message: json["Message"],
    reviewData: List<ReviewDatum>.from(json["ReviewData"].map((x) => ReviewDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "status": status,
    "Message": message,
    "ReviewData": List<dynamic>.from(reviewData.map((x) => x.toJson())),
  };
}

class ReviewDatum {
  ReviewDatum({
 required   this.id,
    required    this.userId,
    required this.vendorId,
    required  this.serviceId,
    required    this.rating,
    required    this.review,
    required  this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  int vendorId;
  int serviceId;
  int rating;
  String review;
  DateTime createdAt;
  DateTime updatedAt;

  factory ReviewDatum.fromJson(Map<String, dynamic> json) => ReviewDatum(
    id: json["id"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    serviceId: json["service_id"],
    rating: json["rating"],
    review: json["review"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "vendor_id": vendorId,
    "service_id": serviceId,
    "rating": rating,
    "review": review,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
