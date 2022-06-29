import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/privacy/privacy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(PrivacyController());
    return Scaffold(
        body: screenDesign(
            child: Column(
      children: [
        SizedBox(height: 20),
        Container(
          height: Get.height * 0.75,
          width: Get.width,
          child: con.showLoader
              ? Center(child: CircularProgressIndicator())
              : WebView(
                  initialUrl:
                      "https://prank-pay.herokuapp.com/api/PrivacyPolicy-view",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageStarted: (val) {
                    con.showLoader = true;
                    con.update();
                  },
                  onPageFinished: (val) {
                    con.showLoader = false;
                    con.update();
                  },
                ),
        ),
      ],
    )));
  }
}
