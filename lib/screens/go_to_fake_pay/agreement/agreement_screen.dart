import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/strings.dart';
class AgreementScreen extends StatelessWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                ],
              )),
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
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    height: 70,
                    width: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey.withOpacity(0.4)
                    ),
                    child: Image.asset(AssetRes.logo_text,height: 30,),
                  ),
                  SizedBox(height: 20,),
                  Text(Strings.thisApp,style: TextStyle(fontSize: 12),),
                  Spacer(),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 50,
                      // width: Get.width * 0.5,
                      margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorRes.blue,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        Strings.agreeAndContinue,
                        style: TextStyle(color: ColorRes.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
