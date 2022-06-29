import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_function.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class GooglePayScreen extends StatelessWidget {
  final String receiverName;
  final String senderName;
  final String number;
  final String amount;
  final String date;
  final String time;
  final String bankLogo;
  final String bankName;
  final String upiID;
  // final String upiTransactionId;
  // final String googleTransactionId;

  // final String upiTranslateId;
  final String bankAcDigit;

  const GooglePayScreen(
      {Key? key,
      required this.receiverName,
      required this.number,
      required this.amount,
      required this.date,
      required this.time,
      required this.bankLogo,
      required this.bankName,
      required this.senderName,
      // required this.upiTranslateId,
      required this.bankAcDigit, required this.upiID,
      // required this.upiTransactionId,
      // required this.googleTransactionId
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
            // Get.off(OnBoardingSecondController());
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: ColorRes.black.withOpacity(0.7),
            size: deviceWidth / 14,
          ),
        ),
        actions: [
          Container(
            width: deviceWidth / 9,
            alignment: Alignment.center,
            child: Icon(
              Icons.share_outlined,
              color: ColorRes.black.withOpacity(0.5),
              size: deviceWidth / 18,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: deviceWidth / 9,
            child: Icon(
              Icons.more_vert,
              color: ColorRes.black.withOpacity(0.5),
              size: deviceWidth / 18,
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorRes.nBlue,
                  child: Text(
                    "${receiverName[0].toUpperCase()}",
                    style: TextStyle(
                      color: ColorRes.blue,
                      fontSize: 34,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                 "To ${toBeginningOfSentenceCase("$receiverName")}",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontFamily: AssetRes.SFProTextRegular,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "+91 $number",
                  style: TextStyle(
                    color: ColorRes.black,
                    fontSize: deviceWidth / 27,
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "₹",
                        style: TextStyle(
                          color: ColorRes.black,
                          fontSize: deviceWidth / 12,
                        ),
                      ),
                      Text(
                        "$amount",
                        style: TextStyle(
                          fontFamily: AssetRes.OxygenRegular,
                          color: ColorRes.black,
                          fontSize: deviceWidth / 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetRes.completeIcon,
                        height: 15,
                        width: 15,
                      ),
                      Text(
                        "  Completed • $date at $time",
                        style: TextStyle(
                          color: ColorRes.black,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: ColorRes.greyColor.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8, left: 15, right: 12),
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 28,
                                width: 45,
                                margin: EdgeInsets.only(right: 15),
                                // padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(
                                    color: ColorRes.greyColor.withOpacity(0.3),
                                  ),
                                ),
                                child: /*Image.asset(
                                AssetRes.bobIcon,
                              ),*/
                                    Image.network(bankLogo)),
                            Text(
                              "$bankName XXXXXX$bankAcDigit",
                              style: TextStyle(
                                color: ColorRes.lightGray,
                                fontFamily: AssetRes.fontRobotoMedium,
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Image.asset(
                              AssetRes.downAro,
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorRes.greyColor.withOpacity(0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "UPI transaction ID",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AssetRes.fontRobotoMedium,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.lightGray,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              generateUpiTransactionID(12),
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.gray,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "To: $receiverName",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AssetRes.fontRobotoMedium,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.lightGray,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              upiID
                              /*"${receiverName.removeAllWhitespace.toLowerCase()}@ok${bankName.removeAllWhitespace.toLowerCase()}"*/,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.gray,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "From: $senderName ($bankName)",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AssetRes.fontRobotoMedium,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.lightGray,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${senderName.removeAllWhitespace.toLowerCase()}@ok${bankName.removeAllWhitespace.toLowerCase()}",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.gray,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Google transaction ID",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: AssetRes.fontRobotoMedium,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.lightGray,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              getRandom(12),
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorRes.gray,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "POWERED BY",
                      style: TextStyle(
                        fontSize: 8,
                        color: ColorRes.black.withOpacity(0.5),
                      ),
                    ),
                    Image.asset(
                      AssetRes.upiIcon2,
                      height: 20,
                    )
                  ],
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 38,
                        width: deviceWidth / 2.8,
                        margin: EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 5),
                        decoration: BoxDecoration(
                          color: ColorRes.blue1,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: ColorRes.greyColor.withOpacity(0.3),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Having issues?",
                          style: TextStyle(
                            color: ColorRes.white,
                            fontSize: deviceWidth / 28,
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        width: deviceWidth / 2.5,
                        margin: EdgeInsets.only(
                            left: 5, bottom: 15, top: 15, right: 15),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(
                            color: ColorRes.greyColor.withOpacity(0.3),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Split with friends",
                          style: TextStyle(
                            color: ColorRes.blue1,
                            fontSize: deviceWidth / 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
