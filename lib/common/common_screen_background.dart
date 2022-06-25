import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget screenDesign({required Widget child}) {
  return Stack(
    children: [
      Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorRes.gradiant2, ColorRes.gradiant2],
          ),
        ),
      ),
      Positioned(
        top: 0,
        child: Stack(
          children: [
            Container(
              height: 90,
              padding: EdgeInsets.only(top: 45, bottom: 15),
              width: Get.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorRes.gradiant1, ColorRes.gradiant2],
                ),
              ),
              child: Container(
                child: Image.asset(AssetRes.logo),
              ),
            ),
            Positioned(
              top: 50,
              left: 15,
              child:InkWell(
                onTap: (){
                  Get.back();
                },
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: Image.asset(
                    AssetRes.back_arrow,
                    // height: 19,
                    // width: 19,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
      Positioned(
        top: 90,
        child: Container(
            height: Get.height - 90,
            width: Get.width,
            decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: child),
      )
    ],
  );
}