import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/about_view/about_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AboutViewPage extends StatelessWidget {
  const AboutViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AboutViewController());
    return Scaffold(
      body: screenDesign(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "About View",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              )),
          SizedBox(height: 20),
          GetBuilder<AboutViewController>(
              id: "about_api",
              builder: (con) {
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: con.showLoader == false
                        ? HtmlWidget(con.privacyModel.data![0].about ?? "")
                        : Container(
                            height: Get.height * 0.5,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator()));
              })
        ],
      )),
    );
  }
}
