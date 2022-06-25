import 'package:fake_pay_prank/common/helper.dart';
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
            width: deviceWidth/9,
            alignment: Alignment.center,
            child: Icon(
              Icons.share_outlined,
              color: ColorRes.black.withOpacity(0.5),
              size: deviceWidth / 14,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: deviceWidth/9,
            child: Icon(
              Icons.more_horiz,
              color: ColorRes.black.withOpacity(0.5),
              size: deviceWidth / 14,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: deviceHeight,
            width: deviceWidth,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: ColorRes.nBlue,
                  child: Text(
                    "PU",
                    style: TextStyle(
                      color: ColorRes.blue,
                      fontSize: deviceWidth / 16,
                      height: 1,
                    ),
                  ),
                ),
                Text("To")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
