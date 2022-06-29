import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget submitBtn(context,fromScannerPage){
  return GetBuilder<AccountHolderDetailController>(builder: (con) {
    return InkWell(
      onTap: () {
        if(con.validate(fromScannerPage)){
          con.onSubmitTap(context,fromScannerPage);
        }
      },
      child: Container(
        height: 50,
        // width: Get.width * 0.5,
        margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorRes.nBlue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Text(
          Strings.submit,
          style: TextStyle(color: ColorRes.white,fontSize: 20),
        ),
      ),
    );
  });
}