import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FakePayController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  FocusNode nameFn = FocusNode();
  FocusNode phoneFn = FocusNode();
  FocusNode amountFn = FocusNode();

  DateTime selectedDate = DateTime.now();

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
      selectedDate = picked;
    }
  }
}
