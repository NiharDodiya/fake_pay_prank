import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GooglePayScreen extends StatelessWidget {
  const GooglePayScreen({Key? key}) : super(key: key);

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
              Icons.more_horiz,
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
                  radius: 23,
                  backgroundColor: ColorRes.nBlue,
                  child: Text(
                    "JM",
                    style: TextStyle(
                      color: ColorRes.blue,
                      fontSize: deviceWidth / 16,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "To Jaydip Maniya (jd king)",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontFamily: AssetRes.SFProTextMedium,
                      fontSize: deviceWidth / 30,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "+91 74359 70660",
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
                        "60",
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
                        height: deviceWidth / 28,
                        width: deviceWidth / 28,
                      ),
                      Text(
                        "  Completed • 25 June 2022 at 21:50",
                        style: TextStyle(
                          color: ColorRes.black,
                          fontSize: deviceWidth / 31,
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
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: ColorRes.greyColor.withOpacity(0.3),
                                ),
                              ),
                              child: Image.asset(
                                AssetRes.bobIcon,
                              ),
                            ),
                            Text(
                              "Bank of Baroda XXXXXX3032",
                              style: TextStyle(
                                color: ColorRes.black,
                                fontFamily: AssetRes.fontRobotoMedium,
                                fontWeight: FontWeight.w500,
                                fontSize: deviceWidth / 28,
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
                              height: 10,
                            ),
                            Text(
                              "UPI transaction ID",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 28,
                                fontFamily: AssetRes.fontRobotoRegular,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "217685353013",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 30,
                                color: ColorRes.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "To: JAYDEEP ISHWARBHAI MANIYA",
                              style: TextStyle(
                                fontSize: deviceWidth / 28,
                                fontFamily: AssetRes.fontRobotoRegular,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "jaydipmaniya21@okhdfcbank",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 30,
                                color: ColorRes.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "From: RUPESH JAYESHBHAI KALKANI (Bank of Baroda)",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 28,
                                fontFamily: AssetRes.fontRobotoRegular,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "rupeshkalkani@okaxis",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 30,
                                color: ColorRes.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Google transaction ID",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 28,
                                fontFamily: AssetRes.fontRobotoRegular,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "CICAgODfkpvhdg",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: deviceWidth / 30,
                                color: ColorRes.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                        width: deviceWidth/2.8,
                        margin: EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 5),
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
                        width: deviceWidth/2.5,
                        margin: EdgeInsets.only(left: 5,bottom: 15,top: 15,right: 15),
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
