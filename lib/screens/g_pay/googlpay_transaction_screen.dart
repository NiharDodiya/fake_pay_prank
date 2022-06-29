import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GooglePayTransactionScreen extends StatelessWidget {
  final String amount;
  final String sender;
  final String receiver;
  final String date;
  final String time;
  final bool fromScannerPage;

  const GooglePayTransactionScreen(
      {Key? key,
      required this.amount,
      required this.sender,
      required this.receiver,
      required this.date,
      required this.time, required this.fromScannerPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        color: ColorRes.white,
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight / 4.5,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                AssetRes.approveIcon,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: deviceHeight / 11,
            ),
            Text(
              "₹$amount.00",
              style: TextStyle(
                fontSize: 40,
                fontFamily: AssetRes.fontRobotoRegular,
                color: ColorRes.black.withOpacity(0.6),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Paid to Google Pay Merchant",
              style: TextStyle(
                fontSize: 18,
                fontFamily: AssetRes.ProductSansRegular,
                color: ColorRes.black,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              receiver,
              style: TextStyle(
                fontSize: 18,
                fontFamily: AssetRes.ProductSansRegular,
                color: ColorRes.phoneGray,
              ),
            ),
            Spacer(),
            Text(
              "$date $time",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AssetRes.ProductSansRegular,
                color: ColorRes.black.withOpacity(0.6),
              ),
            ),
            GetBuilder<AccountHolderDetailController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Material(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.onTapGotIt(context,fromScannerPage);
                      },
                      splashColor: ColorRes.nBlue1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      child: Container(
                        height: 40,
                        width: 88,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //color: ColorRes.white,
                          border: Border.all(
                            color: ColorRes.black.withOpacity(0.1),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          "Got it",
                          style: TextStyle(
                            color: ColorRes.nBlue1,
                            fontFamily: AssetRes.ProductSansRegular,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
