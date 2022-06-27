import 'dart:convert';

import 'package:fake_pay_prank/model/about_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AboutViewApi{
  static Future<AboutViewModel?> aboutView() async {
    try {
      String url = "https://prank-pay.herokuapp.com/api/About-view";
      http.Response response =
      await http.get(Uri.parse(url));
      print("About view : $url \n ${response.statusCode} \n ${response.body}");
      print(response.statusCode);
      print(response.body);
      if (jsonDecode(response.body)["data"] != null || jsonDecode(response.body)["data"].length != 0) {
        return aboutViewModelFromJson(response.body);
      }
      return AboutViewModel();
    } catch (e) {
      if (kDebugMode) {
        print("About View API ERROR : ${e.toString()}");
      }
    }
  }
}