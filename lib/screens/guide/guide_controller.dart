import 'package:fake_pay_prank/Services/guide_line_api.dart';
import 'package:fake_pay_prank/model/guide_line_model.dart';
import 'package:get/get.dart';

class GuideController extends GetxController {
  List<String> guides = ["Guide 1", "Guide 2", "Guide 3", "Guide 4"];
  bool showLoader = false;
  GuideLineModel guideLineModel = GuideLineModel();
  @override
  void onInit() {
    showLoader = true;
    update(["fakeGuide"]);
    GuideLineApi.guideLineApi().then((value) {
        guideLineModel = value!;
        showLoader = false;
        update(["fakeGuide"]);
    });
    super.onInit();
  }


}