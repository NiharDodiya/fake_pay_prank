import 'package:fake_pay_prank/screens/onbording/onbording_first/onbording_first_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(OnBoardingFirstScreen());
    });
    super.onInit();
  }
}
