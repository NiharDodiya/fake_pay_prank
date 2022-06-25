import 'package:fake_pay_prank/screens/paytm/paytm_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class AccountHolderDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  FocusNode nameFn = FocusNode();
  FocusNode phoneFn = FocusNode();
  FocusNode amountFn = FocusNode();

  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat("dd MMMM yyyy");

  Future<void> selectDate(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      print(formatter.format(selectedDate));
      selectedDate = picked;
      update();
    }
  }

  TimeOfDay selectedTime1 = const TimeOfDay(hour: 00, minute: 00);

  selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
    );
    if (pickedTime != null && pickedTime != selectedTime1) {
      selectedTime1 = pickedTime;
      print(pickedTime);
    }
    update();
    // var displayTime = pickedTime?.format(context).toString();
    // if (kDebugMode) {
    //   print(pickedTime?.format(context).toString());
    // } //output 10:51 PM
    // var removeAM = displayTime?.split(" ");
    // print("Display Time $displayTime ${removeAM?.first}");
  }

  formatTime(selectedTime1, context) {
    var displayTime = selectedTime1?.format(context).toString();
    if (kDebugMode) {
      print(selectedTime1?.format(context).toString());
    } //output 10:51 PM
    var removeAM = displayTime?.split(" ");
    print("Display Time $displayTime ${removeAM?.first}");
    return removeAM?.first.toString();
  }

  List<bool> selectMethod = [true, false, false];
  List<String> logos = [
    AssetRes.paytm_logo,
    AssetRes.phone_pay,
    AssetRes.gPay_logo
  ];
  List<String> paymentMethods = [
    Strings.paytm_logo,
    Strings.phone_pay,
    Strings.gPay_logo
  ];

  onTapSelectMethod(index) {
    selectMethod = [];
    for (int i = 0; i < logos.length; i++) {
      selectMethod.add(false);
    }
    print("SELECT 2 $selectMethod");
    selectMethod.removeAt(index);
    print("SELECT 1 $selectMethod");
    selectMethod.insert(index, true);
    print("SELECT $selectMethod");
    update(["radio"]);
  }

  onSubmitTap() {
    print("SELECTED METHOD $selectMethod");
    if (selectMethod[0] == true) {
      Get.to(PaytmScreen());
    } else if (selectMethod[1] == true) {
    } else if (selectMethod[2] == true) {}
  }
}
