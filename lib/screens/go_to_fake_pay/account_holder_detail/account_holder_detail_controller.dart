import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    var displayTime = pickedTime?.format(context).toString();
    if (kDebugMode) {
      print(pickedTime?.format(context).toString());
    } //output 10:51 PM
    var removeAM = displayTime?.split(" ");
    print("Display Time $displayTime ${removeAM?.first}");
    // selectT1.text = displayTime!;
  }

  formatTime(pickedTime){
    
  }

}
