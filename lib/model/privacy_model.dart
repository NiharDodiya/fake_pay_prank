// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) => PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  PrivacyModel({
    this.data,
  });

  List<Datum>? data;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.about,
  });

  int? id;
  String? about;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "about": about,
  };
}
