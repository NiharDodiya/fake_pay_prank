import 'package:fake_pay_prank/common/common_function.dart';
import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/utils/asset_res.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaytmScreen extends StatelessWidget {
  final String senderName;
  final String phoneNo;
  final String amount;
  final String date;
  final String time;
  final String upiId;
  final bool fromScannerPage;

  const PaytmScreen(
      {Key? key,
      required this.senderName,
      required this.amount,
      required this.date,
      required this.time,
      required this.phoneNo, required this.upiId,required this.fromScannerPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: SizedBox(
          child: SizedBox(
            height: 22,
            child: Image.asset(AssetRes.paytmLogo),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: ColorRes.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                // height: deviceHeight,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: Container(
                        height: 380,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorRes.nBlue,
                              width: 7.0,
                            ),
                          ),
                        ),
                        child: Container(
                          height: 380,
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 30),
                          decoration: BoxDecoration(
                            color: ColorRes.blue.withOpacity(0.1),
                            border: const Border(
                              bottom: BorderSide(
                                color: ColorRes.blue,
                                width: 7.0,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: deviceWidth / 7,
                                    width: deviceWidth / 7,
                                    child: CircleAvatar(
                                      backgroundColor: ColorRes.nBlue,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          (getInitials(senderName))
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: ColorRes.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: deviceWidth / 20,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      SizedBox(
                                        width: deviceWidth / 1.55,
                                        child: Text(
                                          capitalize(senderName),
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: ColorRes.black,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: deviceWidth / 1.55,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "UPI ID: $upiId",
                                              style: TextStyle(
                                                color: ColorRes.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              AssetRes.upiIcon,
                                              height: 20,
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "₹ $amount",
                                      style: TextStyle(
                                        color: ColorRes.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    AssetRes.completeGif,
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$date, $time",
                                    style: TextStyle(
                                      color: ColorRes.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "UPI Ref. No: XX ${generateUpiTransactionID(4)}",
                                    style: TextStyle(
                                      color: ColorRes.blue,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 24,
                                    color: ColorRes.blue,
                                  )
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 42,
                                      width: deviceWidth / 5,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        border: Border.all(
                                          color:
                                              ColorRes.black.withOpacity(0.1),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        "Share",
                                        style: TextStyle(
                                            color: ColorRes.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 42,
                                      width: deviceWidth / 3,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        border: Border.all(
                                          color:
                                              ColorRes.black.withOpacity(0.1),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        "Pay Again",
                                        style: TextStyle(
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        border: Border.all(
                          color: ColorRes.black.withOpacity(0.1),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AssetRes.flashIcon,
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Your Payment took just 2.74 seconds!",
                                style: TextStyle(
                                    color: ColorRes.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Incite your friends to the blazing fast paytm UPI experiences and earn up to ₹100 cashback.",
                            style: TextStyle(
                                color: ColorRes.black,
                                fontSize: deviceWidth / 25),
                          ),
                          Container(
                            height: 50,
                            width: deviceWidth / 2.6,
                            margin: const EdgeInsets.only(
                                right: 10, top: 15, bottom: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorRes.white,
                              border: Border.all(
                                color: ColorRes.blue,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Invite and Earn",
                              style: TextStyle(
                                  color: ColorRes.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: deviceWidth / 23),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 168,
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: Image.asset(
                          AssetRes.layer2,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: deviceWidth - 30,
                // margin: const EdgeInsets.only(
                //   left: 15,
                //   right: 15,
                //   bottom:15,
                // ),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                decoration: const BoxDecoration(
                  color: ColorRes.nBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    bottomNavigationMenu(AssetRes.homeIcon, "Home"),
                    bottomNavigationMenu(AssetRes.qrIcon, "Scan"),
                    bottomNavigationMenu(AssetRes.cashbackIcon, "Cashback"),
                    bottomNavigationMenu(AssetRes.passbookIcon, "passbook"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomNavigationMenu(String image, String title) {
  return Column(
    children: [
      SizedBox(
        height: deviceWidth / 18,
        width: deviceWidth / 18,
        child: Image.asset(
          image,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        title,
        style: TextStyle(
            color: ColorRes.white, fontSize: deviceWidth / 28, height: 1),
      ),
    ],
  );
}
