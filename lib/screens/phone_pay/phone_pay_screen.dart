import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
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
        centerTitle: false,
        elevation: 0,
        titleSpacing: 5,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: SizedBox(
            width: 50,
            child: Icon(
              Icons.arrow_back,
              color: ColorRes.white,
            ),
          ),
        ),
        title: ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, 10.0, 100.0, 10.0),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 424,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paid to",
                      style: TextStyle(
                        color: ColorRes.black,
                        fontFamily: AssetRes.fontRobotoMedium,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                          child: CircleAvatar(
                            backgroundColor: ColorRes.blue,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "SP",
                                style: TextStyle(
                                  color: ColorRes.white,
                                  fontFamily: AssetRes.fontRobotoRegular,
                                  fontSize: 18,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "SMART POINT",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontFamily: AssetRes.fontRobotoRegular,
                            fontSize: 18,
                            height: 1,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹ 45",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontFamily: AssetRes.fontRobotoBold,
                            fontSize: 18,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                          child: Image.asset(
                            AssetRes.listIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "Transfer Details",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontFamily: AssetRes.fontRobotoRegular,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_up,
                        )
                      ],
                    ),
                    Text(
                      "Transaction ID",
                      style: TextStyle(
                        color: ColorRes.phoneGray,
                        fontFamily: AssetRes.fontRobotoRegular,
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "T2206271306316980381310",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontFamily: AssetRes.fontRobotoRegular,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 16,
                          child: Image.asset(
                            AssetRes.copyIcon,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Debited from",
                      style: TextStyle(
                        color: ColorRes.phoneGray,
                        fontFamily: AssetRes.fontRobotoRegular,
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(right: 16),
                          child: Image.asset(
                            AssetRes.hdfcIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "********7010",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontFamily: AssetRes.fontRobotoRegular,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹ 45",
                          style: TextStyle(
                            color: ColorRes.black,
                            fontFamily: AssetRes.fontRobotoRegular,
                            fontSize: 18,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(right: 16),
                        ),
                        Text(
                          "UTR: 217867843136",
                          style: TextStyle(
                            color: ColorRes.phoneGray,
                            fontFamily: AssetRes.fontRobotoRegular,
                            fontSize: 14,
                            height: 1,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 16,
                          child: Image.asset(
                            AssetRes.copyIcon,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 7, top: 7, right: 8),
                            height: 42,
                            width: 42,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                color: ColorRes.phoneGray.withOpacity(0.5),
                              ),
                            ),
                            child: Image.asset(
                              AssetRes.swapIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            "View History",
                            style: TextStyle(
                              color: ColorRes.black,
                              fontFamily: AssetRes.fontRobotoRegular,
                              fontSize: 16,
                              height: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 14, bottom: 7, top: 7, right: 8),
                            height: 42,
                            width: 42,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              border: Border.all(
                                color: ColorRes.phoneGray.withOpacity(0.5),
                              ),
                            ),
                            child: Image.asset(
                              AssetRes.shareIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            "Share Receipt",
                            style: TextStyle(
                              color: ColorRes.black,
                              fontFamily: AssetRes.fontRobotoRegular,
                              fontSize: 16,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 58,
                width: double.infinity,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      margin: EdgeInsets.only(right: 16),
                      child: Image.asset(
                        AssetRes.supportIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "Contact PhonePe Support",
                      style: TextStyle(
                        color: ColorRes.black,
                        fontFamily: AssetRes.fontRobotoRegular,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                    )
                  ],
                ),
              ),
              Text(
                "Powered by",
                style: TextStyle(
                  color: ColorRes.phoneGray,
                  height: 1,
                  fontSize: 14,
                  fontFamily: AssetRes.fontRobotoMedium,
                ),
              ),
              Container(
                height: 22,
                child: Image.asset(
                  AssetRes.poweredByIcon,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
