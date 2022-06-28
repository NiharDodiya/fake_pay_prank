import 'package:fake_pay_prank/Services/prefs_services.dart';
import 'package:fake_pay_prank/screens/onbording/onboarding_second/onboarding_second_screen.dart';
import 'package:fake_pay_prank/screens/onbording/onbording_first/onboarding_first_controller.dart';
import 'package:fake_pay_prank/screens/onbording/onbording_first/widgets/onboarding_drawer.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  const OnBoardingFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(OnBoardingFirstController());
    return Scaffold(
      // key: con.scaffoldKey,
      drawer: OnBoardingDrawer(),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorRes.gradiant2, ColorRes.gradiant2],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Stack(
              children: [
                Container(
                  height: 90,
                  padding: EdgeInsets.only(top: 45, bottom: 15),
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ColorRes.gradiant1, ColorRes.gradiant2],
                    ),
                  ),
                  child: Container(
                    child: Image.asset(AssetRes.logo),
                  ),
                ),
        /*        Positioned(
                  top: 40,
                  left: 15,
                  child: GetBuilder<OnBoardingFirstController>(
                    id: "drawer",
                    builder: (con) => GestureDetector(
                      onTap: con.onMenuBtnTap,
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          AssetRes.menu,
                          height: 19,
                          width: 19,
                        ),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
          Positioned(
            top: 90,
            child: Container(
              height: Get.height - 90,
              width: Get.width,
              decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    Image.asset(
                      AssetRes.money_transfer,
                      height: 250,
                    ),
                    Text(Strings.fakeMoneyUpi),
                    Spacer(),
                    GestureDetector(
                      onTap: ()  {
                        SharePref.setBool(PrefKeys.open_first_getStarted, true);
                        Get.to(OnBoardingSecondScreen());
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
                          Strings.getStarted,
                          style: TextStyle(color: ColorRes.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
