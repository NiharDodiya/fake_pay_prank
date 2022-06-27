// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

AboutViewModel aboutViewModelFromJson(String str) => AboutViewModel.fromJson(json.decode(str));

String aboutViewModelToJson(AboutViewModel data) => json.encode(data.toJson());

class AboutViewModel {
  AboutViewModel({
    this.data,
  });

  List<Datum>? data;

  factory AboutViewModel.fromJson(Map<String, dynamic> json) => AboutViewModel(
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
