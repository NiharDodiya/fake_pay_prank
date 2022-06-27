import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/common/text_field.dart';
import 'package:fake_pay_prank/screens/g_pay/googlepay_screen.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/ac_holder_detail_form.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/payment_method.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/submit_btn.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountHolderDetailScreen extends StatelessWidget {
  const AccountHolderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountHolderDetailController());
    return Scaffold(
      // bottomNavigationBar:submitBtn(),
      body: screenDesign(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
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
                    /*Container(
                  height: 45,
                  decoration: BoxDecoration(
                      // color: ColorRes.blue,
                      border: Border.all(color: ColorRes.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),*/
                    // GetBuilder<AccountHolderDetailController>(builder: (con) {
                    //   return/* CommonTextField(
                    //     controller: con.bankController,
                    //     hintText: "Select Bank",
                    //     prefixIcon: AssetRes.bank,
                    //     showSuffixIcon: true,
                    //     suffixIcon: AssetRes.drop_down_arrow,
                    //   );*/
                    //     Container(
                    //       // padding:const EdgeInsets.only(left: 10),
                    //       height: 40,
                    //       width: Get.width * 0.42,
                    //       alignment: Alignment.center,
                    //       decoration:  BoxDecoration(
                    //           color: ColorRes.blue,
                    //           borderRadius: BorderRadius.all(Radius.circular(7))),
                    //       child: DropdownButtonHideUnderline(
                    //         child: DropdownButton2(
                    //           buttonPadding: const EdgeInsets.only(left: 10),
                    //           dropdownDecoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(4),
                    //             color: ColorRes.greyColor,
                    //           ),
                    //           icon: Container(
                    //             padding: const EdgeInsets.all(3),
                    //             height: 20,
                    //             width: 20,
                    //             child: Image.asset(
                    //               AssetRes.drop_down_arrow,
                    //               color: Colors.white70,
                    //             ),
                    //           ),
                    //           hint: const Text(
                    //             'Select Person',
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               color: ColorRes.white,
                    //             ),
                    //           ),
                    //           items: con.bank
                    //               .map((item) => DropdownMenuItem<String>(
                    //             value: item,
                    //             child: Text(
                    //               item.toString(),
                    //               style: const TextStyle(
                    //                 fontSize: 14,
                    //                 color: ColorRes.white,
                    //               ),
                    //             ),
                    //           ))
                    //               .toList(),
                    //           value:con.bank[0],
                    //           // onChanged: provider.onTeamSelect,
                    //           buttonHeight: 40,
                    //           buttonWidth: 140,
                    //           itemHeight: 40,
                    //         ),
                    //       ),
                    //     );
                    // }),

                    paymentMethodList(),
                    SizedBox(height: 50),
                    submitBtn()
                    // Spacer(),
                  ],
                ),
                // Positioned(
                //     top:Get.height * 0.55,
                //     child: Container(
                //       height: 200,
                //       width: Get.width,
                //       decoration: BoxDecoration(color: ColorRes.blue),
                //     ))
              ],
            ),
          ),
          ),
    );
  }
}
