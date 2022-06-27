import 'dart:convert';
import 'package:fake_pay_prank/model/guide_line_model.dart';
import 'package:fake_pay_prank/utils/global_variable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GuideLineApi{
  static Future<GuideLineModel?> guideLineApi() async {
    try {
      String url = "${baseUrl}GuideLine-view";
      http.Response response =
      await http.get(Uri.parse(url));
      print("GUIDE LINE API  : $url \n ${response.statusCode} \n ${response.body}");
      print(response.statusCode);
      print(response.body);
      if (jsonDecode(response.body)["data"] != null || jsonDecode(response.body)["data"].length != 0) {
        return guideLineModelFromJson(response.body);
      }
      return GuideLineModel();
    } catch (e) {
      if (kDebugMode) {
        print("About View API ERROR : ${e.toString()}");
      }
    }
  }
}