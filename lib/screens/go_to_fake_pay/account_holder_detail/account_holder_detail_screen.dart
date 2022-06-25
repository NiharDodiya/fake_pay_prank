import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/guide/guide_screen.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountHolderDetailScreen extends StatelessWidget {
  const AccountHolderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountHolderDetailController());
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
                Positioned(
                  top: 50,
                  left: 15,
                  child: GetBuilder<AccountHolderDetailController>(
                    builder: (con) => GestureDetector(
                      // onTap: con.onMenuBtnTap,
                      child: SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset(
                          AssetRes.back_arrow,
                          // height: 19,
                          // width: 19,
                        ),
                      ),
                    ),
                  ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    Strings.accountHolderDetails,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(height: 15),
                  GetBuilder<AccountHolderDetailController>(builder: (con) {
                    return Column(
                      children: [
                        Container(
                          height: 45,
                          width: Get.width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 1),
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              // color: ColorRes.offWhite,
                              border: Border.all(color: ColorRes.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: con.nameController,
                            focusNode: con.nameFn,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Name",
                                prefixIcon: Container(
                                    height: 15,
                                    width: 15,
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset(AssetRes.profile_icon,
                                        height: 5, width: 5)),
                                contentPadding: EdgeInsets.only(top: 0)),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: Get.width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 1),
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              // color: ColorRes.offWhite,
                              border: Border.all(color: ColorRes.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: con.phoneController,
                            focusNode: con.phoneFn,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone No",
                                prefixIcon: Container(
                                    height: 15,
                                    width: 15,
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset(AssetRes.call_icon,
                                        height: 5, width: 5)),
                                contentPadding: EdgeInsets.only(top: 0)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  con.selectTime(context);
                                },
                                child: Container(
                                    height: 45,
                                    // width: Get.width * 0.4,
                                    padding: EdgeInsets.only(left: 10),
                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: ColorRes.blue),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AssetRes.clock_icon,
                                          height: 25,
                                        ),
                                        SizedBox(width: 5),
                                        Text("2:00",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500))
                                      ],
                                    )),
                              ),
                            ),
                            // const Spacer(),
                            SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  con.selectDate(context);
                                },
                                child: Container(
                                    height: 45,
                                    // width: Get.width * 0.4,
                                    padding: EdgeInsets.only(left: 10),
                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: ColorRes.blue),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetRes.calender_icon,
                                          height: 25,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          con.formatter
                                              .format(con.selectedDate),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: Get.width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 1),
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              // color: ColorRes.offWhite,
                              border: Border.all(color: ColorRes.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: con.amountController,
                            focusNode: con.amountFn,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Your Wallet Balance",
                                prefixIcon: Container(
                                    height: 15,
                                    width: 15,
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset(AssetRes.wallet_icon,
                                        height: 5, width: 5)),
                                contentPadding: EdgeInsets.only(top: 0)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    );
                  }),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      print("Change ");
                      Get.to(() => GuideScreen());
                    },
                    child: Container(
                      height: 50,
                      // width: Get.width * 0.5,
                      margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorRes.nBlue,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        Strings.submit,
                        style: TextStyle(color: ColorRes.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget oldPage() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Name",
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<AccountHolderDetailController>(builder: (con) {
          return Column(
            children: [
              Container(
                height: 45,
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: ColorRes.offWhite,
                    border: Border.all(color: ColorRes.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  controller: con.nameController,
                  focusNode: con.nameFn,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      suffixIcon: CircleAvatar(
                          radius: 8,
                          backgroundColor: ColorRes.blue,
                          child: Icon(Icons.perm_contact_cal)),
                      prefixIcon: CircleAvatar(
                          radius: 8,
                          backgroundColor: ColorRes.blue,
                          child: Icon(Icons.person))),
                ),
              ),
              Container(
                height: 45,
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: ColorRes.offWhite,
                    border: Border.all(color: ColorRes.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  controller: con.phoneController,
                  focusNode: con.phoneFn,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone No*",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 45,
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: ColorRes.offWhite,
                    border: Border.all(color: ColorRes.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  controller: con.amountController,
                  focusNode: con.amountFn,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Amount*",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: Get.width * 0.03),
                  Container(
                    height: 60,
                    width: Get.width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorRes.blue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: ColorRes.offWhite),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Time"),
                            SizedBox(
                              width: 3,
                            ),
                            RotatedBox(
                              quarterTurns: -3,
                              child: CircleAvatar(
                                  backgroundColor: ColorRes.blue,
                                  radius: 8,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: ColorRes.white,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Text("10:03 AM"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: ColorRes.offWhite),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Date"),
                              SizedBox(
                                width: 3,
                              ),
                              RotatedBox(
                                quarterTurns: -3,
                                child: CircleAvatar(
                                    backgroundColor: ColorRes.blue,
                                    radius: 8,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10,
                                      color: ColorRes.white,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Text("23 February 2022"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.03)
                ],
              )
            ],
          );
        })
      ],
    ),
  );
}
