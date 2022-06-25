import 'package:fake_pay_prank/common/text_field.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget accountHolderDetails(BuildContext context) {
  return GetBuilder<AccountHolderDetailController>(builder: (con) {
    return Column(
      children: [
        CommonTextField(
          controller: con.nameController,
          focusNode: con.nameFn,
          hintText: "Name",
          prefixIcon: AssetRes.profile_icon,
        ),
        CommonTextField(
          controller: con.phoneController,
          focusNode: con.phoneFn,
          hintText: "Phone No",
          prefixIcon: AssetRes.call_icon,
        ),
        // const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  con.selectTime(context);
                },
                child: Container(
                    height: 45,
                    // width: Get.width * 0.4,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorRes.blue),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AssetRes.clock_icon,
                          height: 25,
                        ),
                        SizedBox(width: 5),
                        Text(con.formatTime(con.selectedTime1, context),
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    )),
              ),
            ),
            // const Spacer(),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  con.selectDate(context);
                },
                child: Container(
                    height: 45,
                    // width: Get.width * 0.4,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorRes.blue),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetRes.calender_icon,
                          height: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          con.formatter.format(con.selectedDate),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
        CommonTextField(
            controller: con.amountController,
            focusNode: con.amountFn,
            hintText: "Your Wallet Balance",
            prefixIcon: AssetRes.wallet_icon),
      ],
    );
  });
}
