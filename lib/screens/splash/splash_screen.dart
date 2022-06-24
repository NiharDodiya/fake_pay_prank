import 'package:fake_pay_prank/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: Text(
          "FAKE PAY",
          style: TextStyle(color: ColorRes.blue,fontSize: 30,wordSpacing: 2),
        ),
      ),
    );
  }
}
