import 'package:fake_pay_prank/screens/privacy/privacy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(PrivacyController());
    return Scaffold(
      body: Container(
        // child: WebView(
        //   initialUrl: "https://prank-pay.herokuapp.com/api/PrivacyPolicy-view",
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                )),
            SizedBox(height: 20),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: !con.showLoader
                    ? Text(con.privacyModel.data![0].about ?? "")
                    : CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
