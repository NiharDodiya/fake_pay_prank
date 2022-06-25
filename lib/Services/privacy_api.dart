import 'dart:convert';

import 'package:fake_pay_prank/model/privacy_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PrivacyApi{
  static Future<PrivacyModel?> privacyPolicy() async {
    try {
      String url = "https://prank-pay.herokuapp.com/api/About-view";
      // Map<String, dynamic> bodyData = {"email": email, "password": password};
      http.Response response =
      await http.get(Uri.parse(url));
      print("Privacy : $url");
      print(response.statusCode);
      print(response.body);
      if (jsonDecode(response.body)["data"] != null || jsonDecode(response.body)["data"].length != 0) {
        return privacyModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Privacy API ERROR : ${e.toString()}");
      }
    }
  }


}