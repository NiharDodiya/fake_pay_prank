import 'package:fake_pay_prank/model/bank_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class GetBankItem{
  static Future<BankModel?> getBankDropDown() async {
    try {
      String url = "https://prank-pay.herokuapp.com/api/BankList-view";
      http.Response response =
      await http.get(Uri.parse(url));
      print("getBankDropDown : $url \n ${response.statusCode} \n ${response.body}");
      print(response.statusCode);
      print(response.body);
      if (jsonDecode(response.body)["data"] != null || jsonDecode(response.body)["data"].length != 0) {
        return bankModelFromJson(response.body);
      }
      return BankModel();
    } catch (e) {
      if (kDebugMode) {
        print("Bank Api ERROR : ${e.toString()}");
      }
    }
  }
}