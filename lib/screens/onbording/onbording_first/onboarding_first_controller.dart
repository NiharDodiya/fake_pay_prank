import 'package:fake_pay_prank/Services/googleAdmob.dart';
import 'package:fake_pay_prank/screens/about_view/about_view_screen.dart';
import 'package:fake_pay_prank/screens/guide/guide_screen.dart';
import 'package:fake_pay_prank/screens/privacy/privacy_screen.dart';
import 'package:fake_pay_prank/screens/splash/splash_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/global_variable.dart';
import '../../go_to_fake_pay/account_holder_detail/account_holder_detail_screen.dart';

class OnBoardingFirstController extends GetxController {
  @override
  void onInit() {
    AdService.showInterstitialAd(() {
      init();
    });
    super.onInit();
  }

  init() {
    print("OPEN ADS ");
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  onMenuBtnTap() {
    print("OPEN DRAWER");
    scaffoldKey.currentState?.openDrawer();
    update(["drawer"]);
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse("$rateUsUrl")))
      throw 'Could not launch $rateUsUrl';
  }

  onTapDrawerItem(index) {
    if (index == 0) {
      //go to fake pay
      Get.to(AccountHolderDetailScreen(
        fromScannerPage: false,
      ));
    } else if (index == 1) {
      //fake statement
    } else if (index == 2) {
      //privacy
      Get.to(PrivacyScreen());
    } else if (index == 3) {
      //how to use
      Get.to(GuideScreen());
    } else if (index == 4) {
      //more
      Get.to(AboutViewPage());
    }
    update(["drawers"]);
  }

  onTapDrawerItem2(index) {
    if (index == 0) {
      //rate us
      _launchUrl();
    } else if (index == 1) {
      //share
      Share.share(shareUrl);
    }
    update(["drawers"]);
  }

  List<String> icons = [
    AssetRes.go_to_fake_pay,
    AssetRes.fake_statement,
    AssetRes.privacy,
    AssetRes.how_to_use,
    AssetRes.aboutUs,
  ];

  List<String> icons2 = [AssetRes.rate_us, AssetRes.share];

  List<String> title = [
    Strings.go_to_fake_pay,
    Strings.fake_statement,
    Strings.privacy,
    Strings.how_to_use,
    Strings.aboutUs,
  ];
  List<String> title2 = [Strings.rate_us, Strings.share];
}
