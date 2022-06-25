import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget paymentMethodList(){
  return  GetBuilder<AccountHolderDetailController>(
      id: "radio",
      builder: (con) {
        return Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: con.logos.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: Get.width * 0.31,
                  // decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        con.logos[index],
                        height: 25,
                      ),
                      SizedBox(height: 5),
                      Text(
                        con.paymentMethods[index],
                        style: TextStyle(
                            color: ColorRes.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      GestureDetector (
                        onTap: () {
                          con.onTapSelectMethod(index);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: con.selectMethod[index]
                                      ? ColorRes.nBlue
                                      : ColorRes.greyColor,
                                  width: 2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15))),
                          padding: EdgeInsets.all(3),
                          child: con.selectMethod[index]
                              ? CircleAvatar(
                            radius: 3,
                            backgroundColor: ColorRes.nBlue,
                          )
                              : SizedBox(),
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      });
}