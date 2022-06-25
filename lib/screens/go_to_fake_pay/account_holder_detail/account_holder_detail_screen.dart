import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/ac_holder_detail_form.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/payment_method.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/submit_btn.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountHolderDetailScreen extends StatelessWidget {
  const AccountHolderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountHolderDetailController());
    return Scaffold(
      body: screenDesign(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            Strings.accountHolderDetails,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          SizedBox(height: 15),
          accountHolderDetails(context),
          paymentMethodList(),
          Spacer(),
          submitBtn()
        ],
      )),
    );
  }
}
