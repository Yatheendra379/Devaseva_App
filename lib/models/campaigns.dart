// To parse this JSON data, do
//
//     final campaignResponse = campaignResponseFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<CampaignResponse> campaignResponseFromJson(String str) => List<CampaignResponse>.from(json.decode(str).map((x) => CampaignResponse.fromJson(x)));

String campaignResponseToJson(List<CampaignResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CampaignResponse {
  CampaignResponse({
    this.id,
    this.code,
    this.name,
    this.templeId,
    this.templeCode,
    this.templeName,
    // this.templeImage,
    this.image,
    this.description,
    this.shortDesc,
    this.endDate,
    this.createdBy,
    this.featured,
    this.status,
    this.priority,
    this.donorCount,
    this.prasadRequest,
  });

  int? id;
  String? code;
  String? name;
  int? templeId;
  String? templeCode;
  String? templeName;
  // TempleImage? templeImage;
  String? image;
  String? description;
  String? shortDesc;
  DateTime? endDate;
  String? createdBy;
  bool? featured;
  int? status;
  int? priority;
  int? donorCount;
  int? prasadRequest;

  factory CampaignResponse.fromJson(Map<String, dynamic> json) => CampaignResponse(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    templeId: json["templeId"] == null ? null : json["templeId"],
    templeCode: json["templeCode"] == null ? null : json["templeCode"],
    templeName: json["templeName"] == null ? null : json["templeName"],
    // templeImage: json["templeImage"] == null ? null : templeImageValues.map[json["templeImage"]],
    image: json["image"] == null ? null : json["image"],
    description: json["description"] == null ? null : json["description"],
    shortDesc: json["shortDesc"] == null ? null : json["shortDesc"],
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    featured: json["featured"] == null ? null : json["featured"],
    status: json["status"] == null ? null : json["status"],
    priority: json["priority"] == null ? null : json["priority"],
    donorCount: json["donorCount"] == null ? null : json["donorCount"],
    prasadRequest: json["prasadRequest"] == null ? null : json["prasadRequest"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "templeId": templeId == null ? null : templeId,
    "templeCode": templeCode == null ? null : templeCode,
    "templeName": templeName == null ? null : templeName,
    // "templeImage": templeImage == null ? null : templeImageValues.reverse[templeImage],
    "image": image == null ? null : image,
    "description": description == null ? null : description,
    "shortDesc": shortDesc == null ? null : shortDesc,
    // "endDate": endDate == null ? null : endDate.toIso8601String(),
    "createdBy": createdBy == null ? null : createdBy,
    "featured": featured == null ? null : featured,
    "status": status == null ? null : status,
    "priority": priority == null ? null : priority,
    "donorCount": donorCount == null ? null : donorCount,
    "prasadRequest": prasadRequest == null ? null : prasadRequest,
  };
}

// enum TempleImage { TEMPLES_HKM_TEMPLE_JPG, CAMAPIGNS_NEW_JPG, TEMPLES_BASS_TEMPLE_JPG }
//
// final templeImageValues = EnumValues({
//   "/camapigns/new.jpg": TempleImage.CAMAPIGNS_NEW_JPG,
//   "/temples/bass_temple.jpg": TempleImage.TEMPLES_BASS_TEMPLE_JPG,
//   "/temples/hkm_temple.jpg": TempleImage.TEMPLES_HKM_TEMPLE_JPG
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
