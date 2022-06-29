import 'package:fake_pay_prank/common/text_field.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget accountHolderDetails(BuildContext context, bool fromScannerPage) {
  return GetBuilder<AccountHolderDetailController>(
      id: "forms",
      builder: (con) {
        return Column(
          children: [
            CommonTextField(
              controller: con.nameController,
              focusNode: con.nameFn,
              hintText: "Enter Name",
              prefixIcon: AssetRes.profile_icon,
              iconColor: con.nameController.text.isEmpty
                  ? ColorRes.greyColorIcon
                  : Colors.black,
            ),
            con.nameError == ""
                ? SizedBox(height: 15)
                : Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.topLeft,
                    height: 25,
                    child: Text(
                      con.nameError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            fromScannerPage
                ? SizedBox()
                : CommonTextField(
                    controller: con.receiverController,
                    focusNode: con.receiverFn,
                    hintText: "Enter Receiver Name",
                    prefixIcon: AssetRes.profile_icon,
                    iconColor: con.receiverController.text.isEmpty
                        ? ColorRes.greyColorIcon
                        : Colors.black,
                  ),
            con.receiverError == ""
                ? fromScannerPage ? SizedBox(height: 0):SizedBox(height: 15)
                : Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.topLeft,
                    height: 25,
                    child: Text(
                      con.receiverError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            CommonTextField(
              controller: con.phoneController,
              focusNode: con.phoneFn,
              hintText: "Phone No",
              prefixIcon: AssetRes.call_icon,
              textInputType: TextInputType.number,
              iconColor: con.phoneController.text.isEmpty
                  ? ColorRes.greyColorIcon
                  : Colors.black,
            ),
            con.phoneError == ""
                ? SizedBox(height: 15)
                : Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.topLeft,
                    height: 25,
                    child: Text(
                      con.phoneError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            CommonTextField(
              controller: con.enterAmountController,
              focusNode: con.enterAmountFn,
              hintText: "Amount",
              prefixIcon: AssetRes.rupee_icon,
              textInputType: TextInputType.number,
              iconColor: con.enterAmountController.text.isEmpty
                  ? ColorRes.greyColorIcon
                  : Colors.black,
            ),
            con.enterAmount == ""
                ? SizedBox(height: 15)
                : Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.topLeft,
                    height: 25,
                    child: Text(
                      con.enterAmount,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
              controller: con.walletController,
              focusNode: con.walletFn,
              hintText: "Your Wallet Balance",
              prefixIcon: AssetRes.wallet_icon,
              textInputType: TextInputType.number,
              iconColor: con.walletController.text.isEmpty
                  ? ColorRes.greyColorIcon
                  : Colors.black,
            ),
            con.walletError == ""
                ? SizedBox(height: 15)
                : Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.topLeft,
                    height: 25,
                    child: Text(
                      con.walletError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
          ],
        );
      });
}
