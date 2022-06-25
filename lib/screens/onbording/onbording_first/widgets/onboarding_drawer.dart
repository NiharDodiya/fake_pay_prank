import 'package:fake_pay_prank/screens/onbording/onbording_first/onboarding_first_controller.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingDrawer extends StatelessWidget {
  const OnBoardingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 90,
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: Image.asset(
                  AssetRes.logo,
                  height: 100,
                ),
              ),
              Divider(color: ColorRes.nBlue),
              GetBuilder<OnBoardingFirstController>(
                  id: "drawers",
                  builder: (con) {
                return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: con.icons.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                          con.onTapDrawerItem(index);
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            decoration: index == con.icons.length - 1
                                ? BoxDecoration()
                                : BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: ColorRes.black))),
                            child: Row(
                              children: [
                                Image.asset(con.icons[index]),
                                SizedBox(width: 10),
                                Text(con.title[index])
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }),
              SizedBox(height: Get.height * 0.09),
              Text(
                Strings.version,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 15),
              Divider(color: ColorRes.blue,thickness: 3,height: 0,),
              Divider(color: ColorRes.nBlue,thickness: 3,height: 3,)
            ],
          ),
        ),
      ),
    );
  }
}
