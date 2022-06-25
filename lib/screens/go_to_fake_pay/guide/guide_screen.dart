import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/guide/guide_controller.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GuideController());
    return Scaffold(
      body: screenDesign(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(Strings.fakePayGuide,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          SizedBox(height: 10),
          GetBuilder<GuideController>(builder: (con) {
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: con.guides.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: ColorRes.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(con.guides[index]),
                    );
                  }),
            );
          })
        ],
      )),
    );
  }
}


