import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/guide/guide_controller.dart';
import 'package:fake_pay_prank/screens/guide/guide_line_answer_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
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
              style: TextStyle(
                fontFamily: AssetRes.fontRobotoMedium,
                fontSize: 14,
              )),
          SizedBox(height: 10),
          GetBuilder<GuideController>(
              id: "fakeGuide",
              builder: (con) {
                return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: con.showLoader == false
                      ? ListView.builder(
                          itemCount: con.guideLineModel.data?.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(GuideLineAnswerScreen(
                                    answer: con.guideLineModel.data?[index]
                                            .answer ??
                                        ""));
                              },
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.only(left: 16),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: 10),
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: ColorRes.blue.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                    con.guideLineModel.data![index].question ??
                                        "",
                                    style: TextStyle(
                                      fontFamily: AssetRes.fontRobotoMedium,
                                      fontSize: 14,
                                    )),
                              ),
                            );
                          })
                      : Container(
                          height: Get.height * 0.5,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                );
              })
        ],
      )),
    );
  }
}
