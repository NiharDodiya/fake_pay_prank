import 'package:fake_pay_prank/Services/prefs_services.dart';
import 'package:fake_pay_prank/screens/onbording/onbording_first/onbording_first_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../onbording/onboarding_second/onboarding_second_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () async {
      bool opened;
      opened = await SharePref.getBool(PrefKeys.open_first_getStarted) ?? false;
      print("OPENED GET STARTED PAGE : $opened");
      if(opened == false){
        Get.off(OnBoardingFirstScreen());
      }else{
        Get.off(OnBoardingSecondScreen());
      }
    });
    super.onInit();
  }
}
