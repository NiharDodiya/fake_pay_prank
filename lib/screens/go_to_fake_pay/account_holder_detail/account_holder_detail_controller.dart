import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fake_pay_prank/Services/get_bank_api.dart';
import 'package:fake_pay_prank/model/bank_model.dart';
import 'package:fake_pay_prank/screens/g_pay/googlepay_screen.dart';
import 'package:fake_pay_prank/screens/g_pay/googlpay_transaction_screen.dart';
import 'package:fake_pay_prank/screens/paytm/paytm_screen.dart';
import 'package:fake_pay_prank/screens/phone_pay/phone_pay_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/common_function.dart';

class AccountHolderDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController walletController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController enterAmountController = TextEditingController();

  TextEditingController receiverController = TextEditingController();

  FocusNode nameFn = FocusNode();
  FocusNode phoneFn = FocusNode();
  FocusNode walletFn = FocusNode();
  FocusNode bankFn = FocusNode();
  FocusNode enterAmountFn = FocusNode();
  FocusNode receiverFn = FocusNode();

  String nameError = "";
  String phoneError = "";
  String walletError = "";
  String bankError = "";
  String enterAmount = "";
  String receiverError = "";

  bool validate(fromScannerPage) {
    nameValidation();
    phoneValidation();
    walletValidation();
    bankValidation();
    enterAmountValidate();
    if (fromScannerPage == false) {
      senderValidation();
    } else {
      checkNameAndUpi();
    }
    checkAmountValidate();

    if (fromScannerPage
        ? (nameError == "" &&
            phoneError == "" &&
            walletError == "" &&
            bankError == "" &&
            enterAmount == "" &&
            /*senderError == "" &&*/
            receiverName != "" &&
            upiId != "")
        : (nameError == "" &&
            phoneError == "" &&
            walletError == "" &&
            bankError == "" &&
            enterAmount == "" &&
            receiverError ==
                "" /* &&
            receiverName != "" &&
            upiId != ""*/
        )) {
      return true;
    } else {
      return false;
    }
  }

  String receiverName = "";
  String upiId = "";

  checkNameAndUpi() {
    upiId = qRResult.split("pa=")[1].split("&")[0];
    receiverName =
        qRResult.split("pn=")[1].split("&")[0].replaceAll("%20", " ");
    update(["forms"]);
  }

  nameValidation() {
    if (nameController.text.trim() == "") {
      nameError = "Enter the Name";
    } else {
      nameError = "";
    }
    update(["forms"]);
  }

  senderValidation() {
    if (nameController.text.trim() == "") {
      receiverError = "Enter the Name";
    } else {
      receiverError = "";
    }
    update(["forms"]);
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
    if (walletController.text == "") {
      walletError = "Enter Your Wallet Amount";
    } else {
      walletError = "";
    }
    update(["forms"]);
  }

  enterAmountValidate() {
    if (enterAmountController.text == "") {
      enterAmount = "Enter Your Amount";
    } else {
      enterAmount = "";
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

  checkAmountValidate() {
    if (walletController.text != "" && enterAmountController.text != "") {
      if (int.parse(walletController.text.toString()) <
          int.parse(enterAmountController.text.toString())) {
        enterAmount = "Enter Valid Amount";
      }
    }

    update(["forms"]);
  }

  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat("dd MMMM yyyy");
  DateFormat formatter2 = DateFormat("dd MMM");
  DateFormat formatter3 = DateFormat("MMM dd yyyy");

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

  formatTimeWithAmPm(selectedTime1, context) {
    var displayTime = selectedTime1?.format(context).toString();
    if (kDebugMode) {
      print(selectedTime1?.format(context).toString());
    } //output 10:51 PM
    // var removeAM = displayTime?.split(" ");
    // print("Display Time $displayTime ${removeAM?.first}");
    return displayTime;
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
    // print("SELECT 2 $selectMethod");
    selectMethod.removeAt(index);
    // print("SELECT 1 $selectMethod");
    selectMethod.insert(index, true);
    // print("SELECT $selectMethod");
    update(["radio"]);
  }

  onSubmitTap(context, fromScannerPage) {
    print("SELECTED METHOD $selectMethod");
    if (selectMethod[0] == true) {
      Get.to(() => PaytmScreen(
              fromScannerPage: fromScannerPage,
              upiId: fromScannerPage ? upiId : "",
              phoneNo: phoneController.text.toString(),
              receiverName: fromScannerPage
                  ? receiverName == ""
                      ? receiverController.text.toString()
                      : receiverName
                  : receiverController.text.toString(),
              amount: enterAmountController.text.toString(),
              date: formatter2.format(selectedDate),
              time: formatTimeWithAmPm(selectedTime1, context),
            )
        );
    } else if (selectMethod[1] == true) {
      Get.to(() => PhonePayScreen(
            amount: enterAmountController.text.toString(),
            bankAcDigit: selectAcNumber!,
            bankLogo: bankLogo!,
            date: formatter.format(selectedDate),
            phoneNo: phoneController.text.toString(),
            receiverName: receiverName == ""
                ? receiverController.text.toString()
                : receiverName,
            time: formatTimeWithAmPm(selectedTime1, context),
          ));
    } else if (selectMethod[2] == true) {
      Get.to(() =>
              GooglePayTransactionScreen(
                  fromScannerPage: fromScannerPage,
                  amount: enterAmountController.text.toString(),
                  sender: receiverController.text.toString(),
                  receiver: fromScannerPage
                      ? receiverName
                      : receiverController.text.toString(),
                  date: formatter3.format(selectedDate),
                  time: formatTimeWithAmPm(selectedTime1, context))

          );
    }
  }

  void onTapGotIt(BuildContext context, fromScannerPage) {
    // Get.back();
    ///play audio
    // AssetsAudioPlayer.newPlayer().open(Audio("assets/audio/sound.mp3"),
    //     showNotification: true, autoStart: true,);
    // assetsAudioPlayer.open(Audio("assets/audio/audio.mp3"));
    Get.off(() =>
            GooglePayScreen(
              fromScannerPage: fromScannerPage,
              senderName: nameController.text.toString(),
              receiverName: fromScannerPage
                  ? receiverName
                  : receiverController.text.toString(),
              upiID: fromScannerPage
                  ? upiId == ""
                      ? ""
                      : upiId
                  : "",
              number: phoneController.text.toString(),
              amount: enterAmountController.text.toString(),
              date: formatter.format(selectedDate),
              time: formatTime(selectedTime1, context),
              bankLogo: bankLogo!,
              bankName: bankController.text.toString(),
              bankAcDigit: selectAcNumber!,
            )
        );
  }

  bool showDropDown = false;

  // List<String> bank = ["HDFC", "BOB", "AXIS"];

  onTapDropDown() {
    showDropDown = !showDropDown;
    update(["dropDown"]);
  }

  String? bankLogo;
  bool showLogo = false;

  onSelectDropDownItem(String bank, String image, String acNum) {
    print("SHOW DROP DOWN = $showDropDown");
    onTapDropDown();
    bankController.text = bank;
    showLogo = true;
    bankLogo = image;
    selectAcNumber = acNum;
    update(["dropDown"]);
  }

  BankModel bankModel = BankModel();
  bool showLoader = false;

  // String? initialValueDropDown;
  List<String> bank = [];
  List<String> images = [];
  List<String> accountNum = [];
  String? selectAcNumber;

  // String? upiTransactionId;
  // String? googleTransactionId;

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
        accountNum.add(value.data![i].bankAccount!);
      }
      print("BANK FROM API $bank \n images $images");
      // upiTransactionId = generateUpiTransactionID();
      // googleTransactionId = getRandom(12);
      // print(
      //     "\n\n upiTransactionId : $upiTransactionId \n googleTransactionId : $googleTransactionId \n\n");
      showLoader = false;
      update(["loader"]);
    });
    super.onInit();
  }

// onChangedDropDown(val) {
//   initialValueDropDown = val;
//   update(["mDropDown"]);
// }

}
