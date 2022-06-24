import 'package:fake_pay_prank/screens/onbording/onbording_first/onboarding_first_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingDrawer extends StatelessWidget {
  const OnBoardingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.only(top: 50, bottom: 10),
              // width: Get.width - 100,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //         topRight: Radius.circular(15),
              //         bottomRight: Radius.circular(15))),
              child: Image.asset(
                AssetRes.logo,
                height: 100,
              ),
            ),
            Divider(color: ColorRes.blue),
            GetBuilder<OnBoardingFirstController>(builder: (con) {
              return ListView.builder(
                  itemCount: con.icons.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(
                          top: 15, bottom: 10,),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: ColorRes.black))),
                      child: Row(
                        children: [
                          Image.asset(con.icons[index]),
                          SizedBox(width: 10),
                          Text(con.title[index])
                        ],
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
