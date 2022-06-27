// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

import 'dart:convert';

BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

String bankModelToJson(BankModel data) => json.encode(data.toJson());

class BankModel {
  BankModel({
    this.data,
  });

  List<Datum>? data;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.bankAccount,
    this.image,
    this.upiTranslateId,
  });

  int? id;
  String? name;
  String? bankAccount;
  String? image;
  String? upiTranslateId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    bankAccount: json["bank_account"],
    image: json["image"],
    upiTranslateId: json["upi_translate_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "bank_account": bankAccount,
    "image": image,
    "upi_translate_id": upiTranslateId,
  };
}
