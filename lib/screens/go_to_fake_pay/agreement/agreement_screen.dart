import 'package:fake_pay_prank/Services/prefs_services.dart';
import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screenDesign(
            child: Column(
      children: [
        SizedBox(height: 20),
        Image.asset(
          AssetRes.logo_text,
          height: 70,
        ),
        SizedBox(
          height: 5,
        ),
        Text(Strings.fakePay),
        SizedBox(height: 20),
        Text(
          Strings.thisApp,
          style: TextStyle(fontSize: 12),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            SharePref.setBool(PrefKeys.open_first_agree, true);
            Get.to(() => AccountHolderDetailScreen());
          },
          child: Container(
            height: 50,
            // width: Get.width * 0.5,
            margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorRes.nBlue,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Text(
              Strings.agreeAndContinue,
              style: TextStyle(color: ColorRes.white),
            ),
          ),
        )
      ],
    )));
  }
}
