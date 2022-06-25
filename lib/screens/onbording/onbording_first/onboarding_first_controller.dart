import 'package:fake_pay_prank/screens/privacy/privacy_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoardingFirstController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  onMenuBtnTap() {
    print("OPEN DRAWER");
    scaffoldKey.currentState?.openDrawer();
    update(["drawer"]);
  }

  onTapDrawerItem(index) {
    if (index == 0) {
      //go to fake pay
    } else if (index == 1) {
      //fake payment
    } else if (index == 2) {
      //privacy
      Get.to(PrivacyScreen());
    } else if (index == 3) {
      //how to use
    }else if(index == 4){
      //more
    }else if(index == 5){
      //rate us
    }else if(index == 6){
      //share
    }
    update(["drawers"]);
  }

  List<String> icons = [
    AssetRes.go_to_fake_pay,
    AssetRes.fake_statement,
    AssetRes.privacy,
    AssetRes.how_to_use,
    AssetRes.more,
    AssetRes.rate_us,
    AssetRes.share
  ];

  List<String> title = [
    Strings.go_to_fake_pay,
    Strings.fake_statement,
    Strings.privacy,
    Strings.how_to_use,
    Strings.more,
    Strings.rate_us,
    Strings.share
  ];
}
