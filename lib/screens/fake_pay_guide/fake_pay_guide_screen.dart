import 'package:fake_pay_prank/screens/fake_pay_guide/fake_pay_guide_controller.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:fake_pay_prank/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FakePayGuide extends StatelessWidget {
  const FakePayGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FakePayController());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorRes.blue,
        title: const Text(Strings.fakePayGuide,
            style: TextStyle(color: ColorRes.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
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
              GetBuilder<FakePayController>(builder: (con) {
                return Column(
                  children: [
                    Container(
                      height: 45,
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 1),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: ColorRes.offWhite,
                          border: Border.all(color: ColorRes.blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: ColorRes.offWhite,
                          border: Border.all(color: ColorRes.blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: ColorRes.offWhite,
                          border: Border.all(color: ColorRes.blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                          onTap: () {

                          },
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
        ),
      ),
    );
  }
}
