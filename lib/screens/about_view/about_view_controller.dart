import 'dart:io';

import 'package:fake_pay_prank/Services/about_view_api.dart';
import 'package:fake_pay_prank/model/about_view_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutViewController extends GetxController {
  bool showLoader = false;
  AboutViewModel privacyModel = AboutViewModel();

  @override
  void onInit() {
    showLoader = true;
    update(["about_api"]);
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    AboutViewApi.aboutView().then((value) {
      privacyModel = value!;
      showLoader = false;
     update(["about_api"]);
    });

    super.onInit();
  }
}
