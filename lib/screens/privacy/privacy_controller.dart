import 'dart:io';

import 'package:fake_pay_prank/Services/privacy_api.dart';
import 'package:fake_pay_prank/model/privacy_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyController extends GetxController {
  bool showLoader = false;
  PrivacyModel privacyModel = PrivacyModel();

  @override
  void onInit() {
    showLoader = true;
    update();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    PrivacyApi.privacyPolicy().then((value) {
      privacyModel = value!;
      showLoader = false;
    });
    update();
    super.onInit();
  }
}
