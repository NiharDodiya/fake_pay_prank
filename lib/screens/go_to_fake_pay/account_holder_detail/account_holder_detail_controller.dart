import 'package:fake_pay_prank/Services/get_bank_api.dart';
import 'package:fake_pay_prank/model/bank_model.dart';
import 'package:fake_pay_prank/screens/g_pay/googlepay_screen.dart';
import 'package:fake_pay_prank/screens/paytm/paytm_screen.dart';
import 'package:fake_pay_prank/screens/phone_pay/phone_pay_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountHolderDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bankController = TextEditingController();

  FocusNode nameFn = FocusNode();
  FocusNode phoneFn = FocusNode();
  FocusNode amountFn = FocusNode();
  FocusNode bankFn = FocusNode();

  String nameError = "";
  String phoneError = "";
  String amountError = "";
  String bankError = "";

  bool validate() {
    nameValidation();
    phoneValidation();
    walletValidation();
    bankValidation();
    if (nameError == "" &&
        phoneError == "" &&
        amountError == "" &&
        bankError == "") {
      return true;
    } else {
      return false;
    }
  }

  nameValidation() {
    if (nameController.text.trim() == "") {
      nameError = "Enter the Name";
    } else {
      nameError = "";
    }
    update(["forms"]);
    /*else {
      //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)*/ /*GetUtils.isEmail(emailController.text)*/ /*) {
        emailErrorText = '';
      } else {
        emailErrorText = "Enter valid email";
      }
    }*/
  }

  phoneValidation() {
    if (phoneController.text.trim() == "") {
      phoneError = "Enter Phone No";
    } else {
      if (phoneController.text.length == 10) {
        phoneError = "";
      } else {
        phoneError = "Enter Valid Number";
      }
    }
    update(["forms"]);
  }

  walletValidation() {
    if (amountController.text == "") {
      amountError = "Enter Your Amount";
    } else {
      amountError = "";
    }
    update(["forms"]);
  }

  bankValidation() {
    if (bankController.text == "") {
      bankError = "Please Select Bank";
    } else {
      bankError = "";
    }
    update(["dropDown"]);
  }

  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat("dd MMMM yyyy");

  Future<void> selectDate(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
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

  DateTime now = DateTime.now();
  TimeOfDay selectedTime1 = TimeOfDay(
      hour: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              DateTime.now().minute,
              DateTime.now().second)
          .hour,
      minute: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              DateTime.now().minute,
              DateTime.now().second)
          .minute);

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
      Get.to(() => PaytmScreen());
    } else if (selectMethod[1] == true) {
      Get.to(() => PhonePayScreen());
    } else if (selectMethod[2] == true) {
      Get.to(() => GooglePayScreen());
    }
  }

  bool showDropDown = false;

  // List<String> bank = ["HDFC", "BOB", "AXIS"];

  onTapDropDown() {
    showDropDown = !showDropDown;
    update(["dropDown"]);
  }

  String? bankLogo;
  bool showLogo = false;

  onSelectDropDownItem(String bank, String image) {
    print("SHOW DROP DOWN = $showDropDown");
    onTapDropDown();
    bankController.text = bank;
    showLogo = true;
    bankLogo = image;
    update(["dropDown"]);
  }

  BankModel bankModel = BankModel();
  bool showLoader = false;
  String? initialValueDropDown;
  List<String> bank = [];
  List<String> images = [];

  @override
  void onInit() {
    showLoader = true;
    update(["loader"]);
    GetBankItem.getBankDropDown().then((value) {
      bankModel = value!;
      bank = [];
      images = [];
      for (int i = 0; i < value.data!.length; i++) {
        bank.add(value.data![i].name ?? "");
        images.add(value.data![i].image!);
      }
      print("BANK FROM API $bank \n images $images");

      showLoader = false;
      update(["loader"]);
    });
    super.onInit();
  }

  onChangedDropDown(val) {
    initialValueDropDown = val;
    update(["mDropDown"]);
  }
}
