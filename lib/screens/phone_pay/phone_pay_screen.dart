import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhonePayScreen extends StatelessWidget {
  const PhonePayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.green,
        elevation: 0,
        title: ListTile(
          textColor: ColorRes.white,
          title: Text(
            "Transaction Successful",
            style: TextStyle(color: ColorRes.white),
          ),
          subtitle: Text(
            "01:06 PM on 27 Jun 2022",
            style: TextStyle(color: ColorRes.ofWhite),
          ),
        ),
      ),
      body: Container(
        color: ColorRes.lightPink,
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorRes.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: -2,
                    blurRadius: 2,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
