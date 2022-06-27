// To parse this JSON data, do
//
//     final guideLineModel = guideLineModelFromJson(jsonString);

import 'dart:convert';

GuideLineModel guideLineModelFromJson(String str) => GuideLineModel.fromJson(json.decode(str));

String guideLineModelToJson(GuideLineModel data) => json.encode(data.toJson());

class GuideLineModel {
  GuideLineModel({
    this.data,
  });

  List<Datum>? data;

  factory GuideLineModel.fromJson(Map<String, dynamic> json) => GuideLineModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.question,
    this.answer,
  });

  int? id;
  String? question;
  String? answer;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
  };
}
