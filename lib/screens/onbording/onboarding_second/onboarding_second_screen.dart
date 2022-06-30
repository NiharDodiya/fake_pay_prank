import 'package:fake_pay_prank/Services/googleAdmob.dart';
import 'package:fake_pay_prank/Services/prefs_services.dart';
import 'package:fake_pay_prank/common/common_function.dart';
import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_screen.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/agreement/agreement_screen.dart';
import 'package:fake_pay_prank/screens/guide/guide_screen.dart';
import 'package:fake_pay_prank/screens/onbording/onboarding_second/onboarding_second_controller.dart';
import 'package:fake_pay_prank/screens/onbording/onbording_first/onboarding_first_controller.dart';
import 'package:fake_pay_prank/screens/onbording/onbording_first/widgets/onboarding_drawer.dart';
import 'package:fake_pay_prank/screens/qr_code_scanner/qr_code_scanner_page.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/global_variable.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(OnBoardingFirstController());
    final conSecond = Get.put(OnBoardingSecondController());
    return Scaffold(
      key: con.scaffoldKey,
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
                Positioned(
                  top: 45,
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
                ),
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
              child: homeWidget(conSecond),
            ),
          ),

          /*   AdService.showInterstitialAd(() {
        Get.to(() =>());
      });*/
        ],
      ),
      bottomNavigationBar: Obx(
        () => conSecond.bannerLoaded.isTrue
            ? Container(
                color: Colors.white,
                width: conSecond.bannerAd!.size.width.toDouble(),
                height: conSecond.bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: conSecond.bannerAd!),
              )
            : const SizedBox(),
      ),
    );
  }
}

Widget homeWidget(OnBoardingSecondController conSecond) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
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
        GestureDetector(
          onTap: () {
            AdService.showInterstitialAd(() {
              Get.to(AccountHolderDetailScreen(
                fromScannerPage: false,
              ));
            });
          },
          child: Container(
            // height: 50,
            height: 34,
            width: 100,
            alignment: Alignment.center,
            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: ColorRes.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              Strings.sendMoney,
              style: TextStyle(
                  color: ColorRes.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 140,
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                child: Text(Strings.fakePayMoneyTransfer,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 0),
                  GestureDetector(
                    onTap: () async {
                      bool opened;
                      opened =
                          await SharePref.getBool(PrefKeys.open_first_agree) ??
                              false;
                      print(
                          "GET OPEN FIRST TIME OPEN AGREEMENT PAGE OR NOT $opened");
                      if (opened == false) {
                        Get.to(AgreementScreen());
                      } else {
                        Get.to(() => AccountHolderDetailScreen(
                              fromScannerPage: false,
                            ));
                      }
                    },
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 15),
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Image.asset(AssetRes.go_to_fake_pay, height: 30),
                          SizedBox(height: 10),
                          Text(
                            Strings.go_to_fake_pay,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AdService.showInterstitialAd(() {
                        Get.to(GuideScreen());
                      });
                    },
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 15),
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Image.asset(AssetRes.how_to_use, height: 30),
                          SizedBox(height: 10),
                          Text(
                            Strings.how_to_use,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 15),
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Image.asset(AssetRes.fake_statement, height: 30),
                          SizedBox(height: 10),
                          Text(
                            Strings.fake_statement,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<OnBoardingFirstController>(builder: (con) {
                    return GestureDetector(
                      onTap: () async {
                        print("OPEN PLAY STORE APP FOR RATING");
                        if (!await launchUrl(Uri.parse("$rateUsUrl")))
                          throw 'Could not launch $rateUsUrl';
                      },
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 15, bottom: 10),
                        // decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            Image.asset(AssetRes.rate_us, height: 30),
                            SizedBox(height: 20),
                            Text(
                              Strings.rate_us,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(width: 0),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            Get.to(QRViewPage());
          },
          child: Container(
            height: 55,
            width: 135,
            decoration: BoxDecoration(
                color: ColorRes.nBlue,
                borderRadius: BorderRadius.all(Radius.circular(99))),
            child: Row(
              children: [
                SizedBox(width: 10),
                Image.asset(
                  AssetRes.qr_code,
                  height: 30,
                ),
                SizedBox(width: 10),
                Text(
                  "Scan & Pay",
                  style: TextStyle(
                      color: ColorRes.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.12,
        ),
        // Obx(()=>  conSecond.bannerLoaded.isTrue
        //     ? Container(
        //   color: Colors.black,
        //   width: conSecond.bannerAd!.size.width.toDouble(),
        //   height: conSecond.bannerAd!.size.height.toDouble(),
        //   child: AdWidget(ad: conSecond.bannerAd!),
        // )
        //     : const SizedBox(),),
      ],
    ),
  );
}
