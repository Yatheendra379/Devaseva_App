// To parse this JSON data, do
//
//     final campaignByIdResponse = campaignByIdResponseFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<CampaignByIdResponse> campaignByIdResponseFromJson(String str) => List<CampaignByIdResponse>.from(json.decode(str).map((x) => CampaignByIdResponse.fromJson(x)));

String campaignByIdResponseToJson(List<CampaignByIdResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CampaignByIdResponse {
  CampaignByIdResponse({
    this.id,
    this.campaignSevaLanguageId,
    this.sevaId,
    this.code,
    this.name,
    this.templeCode,
    this.templeName,
    this.templeId,
    this.templeImage,
    this.campaignId,
    this.image,
    this.description,
    this.priority,
    this.category,
    this.detailsMandatory,
    this.devoteeCount,
  });


  int? id;
  dynamic campaignSevaLanguageId;
  int? sevaId;
  String? code;
  String? name;
  String? templeCode;
  String? templeName;
  int? templeId;
  String? templeImage;
  int? campaignId;
  String? image;
  String? description;
  int? priority;
  int? category;
  int? detailsMandatory;
  int? devoteeCount;

  factory CampaignByIdResponse.fromJson(Map<String, dynamic> json) => CampaignByIdResponse(
    id: json["id"] == null ? null : json["id"],
    campaignSevaLanguageId: json["campaignSevaLanguageId"],
    sevaId: json["sevaId"] == null ? null : json["sevaId"],
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    templeCode: json["templeCode"] == null ? null : json["templeCode"],
    templeName: json["templeName"] == null ? null : json["templeName"],
    templeId: json["templeId"] == null ? null : json["templeId"],
    templeImage: json["templeImage"] == null ? null : json["templeImage"],
    campaignId: json["campaignId"] == null ? null : json["campaignId"],
    image: json["image"] == null ? null : json["image"],
    description: json["description"] == null ? null : json["description"],
    priority: json["priority"] == null ? null : json["priority"],
    category: json["category"] == null ? null : json["category"],
    detailsMandatory: json["detailsMandatory"] == null ? null : json["detailsMandatory"],
    devoteeCount: json["devoteeCount"] == null ? null : json["devoteeCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "campaignSevaLanguageId": campaignSevaLanguageId,
    "sevaId": sevaId == null ? null : sevaId,
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "templeCode": templeCode == null ? null : templeCode,
    "templeName": templeName == null ? null : templeName,
    "templeId": templeId == null ? null : templeId,
    "templeImage": templeImage == null ? null : templeImage,
    "campaignId": campaignId == null ? null : campaignId,
    "image": image == null ? null : image,
    "description": description == null ? null : description,
    "priority": priority == null ? null : priority,
    "category": category == null ? null : category,
    "detailsMandatory": detailsMandatory == null ? null : detailsMandatory,
    "devoteeCount": devoteeCount == null ? null : devoteeCount,
  };
}
