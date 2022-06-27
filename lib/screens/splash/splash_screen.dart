import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/screens/splash/splash_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [ColorRes.gradiant2, ColorRes.gradiant2],
        //   ),
        // ),
        alignment: Alignment.center,
        child: Image.asset(AssetRes.logo,height: 50)
      ),
    );
  }
}
