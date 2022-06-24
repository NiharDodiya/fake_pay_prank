import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaytmScreen extends StatelessWidget {
  const PaytmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: ColorRes.black,
            size: deviceWidth / 14,
          ),
        ),
        backgroundColor: ColorRes.white,
        elevation: 0,
        title: text,
        centerTitle: true,
      ),
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Container(
                  height: deviceHeight / 2,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorRes.nBlue,
                        width: 7.0,
                      ),
                    ),
                  ),
                  child: Container(
                    height: (deviceHeight / 2)-20,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    decoration: BoxDecoration(
                      color: ColorRes.blue.withOpacity(0.1),
                      border: Border(
                        bottom: BorderSide(
                          color: ColorRes.blue,
                          width: 7.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundColor: ColorRes.nBlue,
                            child: Text(
                              "PU",
                              style: TextStyle(
                                color: ColorRes.blue,
                                fontSize: 20,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: deviceWidth / 1.55,
                              child: Text(
                                "Paytm User Name",
                                maxLines: 2,
                                style: TextStyle(
                                  color: ColorRes.black,
                                  fontSize: deviceWidth / 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "UPI ID: 7435970660@paytm",
                                  style: TextStyle(
                                    color: ColorRes.black,
                                    fontSize: deviceWidth / 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AssetRes.upiIcon,
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "₹ 1000",
                                    style: TextStyle(
                                      color: ColorRes.black,
                                      fontSize: deviceWidth / 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                )
                              ],
                            ),
                            Text(
                              "24 Jun, 03:21 PM",
                              style: TextStyle(
                                color: ColorRes.black,
                                fontSize: deviceWidth / 22,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "UPI Ref. No: XX 2006",
                                  style: TextStyle(
                                    color: ColorRes.blue,
                                    fontSize: deviceWidth / 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: deviceWidth / 12,
                                  color: ColorRes.blue,
                                )
                              ],
                            ),
                            Spacer(),
                            SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: deviceWidth / 5,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        border: Border.all(
                                          color: ColorRes.black.withOpacity(0.3),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Text(
                                      "Share",
                                      style: TextStyle(
                                          color: ColorRes.black,
                                          fontSize: deviceWidth / 20),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: deviceWidth / 3,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: ColorRes.white,
                                      border: Border.all(
                                        color: ColorRes.black.withOpacity(0.3),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Text(
                                      "Pay Again",
                                      style: TextStyle(
                                          color: ColorRes.black,
                                          fontSize: deviceWidth / 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var text = new RichText(
  text: new TextSpan(
    // Note: Styles for TextSpans must be explicitly defined.
    // Child text spans will inherit styles from parent
    style: new TextStyle(
      fontSize: deviceWidth / 10,
      fontFamily: AssetRes.fontFamilyBold,
      fontWeight: FontWeight.w500,
      color: ColorRes.nBlue,
    ),
    children: <TextSpan>[
      new TextSpan(text: 'pay'),
      new TextSpan(
        text: 'tm',
        style: TextStyle(
            fontSize: deviceWidth / 11,
            fontFamily: AssetRes.fontFamilyBold,
            fontWeight: FontWeight.bold,
            color: ColorRes.blue),
      ),
    ],
  ),
);
