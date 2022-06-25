import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/agreement/agreement_screen.dart';
import 'package:fake_pay_prank/screens/onbording/onboarding_second/onboarding_second_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingSecondController());
    return Scaffold(
        body: screenDesign(
            child: Column(
      children: [
        SizedBox(height: 15),
        Text(Strings.welcomeToFakePay),
        SizedBox(height: 5),
        Text(
          Strings.sendFakeMoneyToAFriend,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        SizedBox(height: 15),
        Image.asset(
          AssetRes.send_money,
          height: 150,
        ),
        SizedBox(height: 10),
        Container(
          // height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: ColorRes.blue,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text(
            Strings.sendMoney,
            style: TextStyle(color: ColorRes.white, fontSize: 12),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: [
              SizedBox(height: 5),
              Text(Strings.fakePayMoneyTransfer,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(AgreementScreen());
                    },
                    child: Container(
                      width: 45,
                      margin: EdgeInsets.only(left: 15),
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Image.asset(AssetRes.go_to_fake_pay, height: 30),
                          Text(
                            Strings.go_to_fake_pay,
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.03),
                  Container(
                    width: 45,
                    margin: EdgeInsets.only(left: 30),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Image.asset(AssetRes.how_to_use, height: 30),
                        Text(
                          Strings.how_to_use,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width * 0.03),
                  Container(
                    width: 50,
                    margin: EdgeInsets.only(left: 30),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Image.asset(AssetRes.fake_statement, height: 30),
                        Text(
                          Strings.fake_statement,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width * 0.03),
                  Container(
                    width: 45,
                    margin: EdgeInsets.only(left: 30),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Image.asset(AssetRes.rate_us, height: 30),
                        Text(
                          Strings.rate_us,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    )));
  }
}
