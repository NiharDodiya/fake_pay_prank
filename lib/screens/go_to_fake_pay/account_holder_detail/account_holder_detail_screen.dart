import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_controller.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/ac_holder_detail_form.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/payment_method.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/widgets/submit_btn.dart';
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
      // bottomNavigationBar:submitBtn(),
      body: screenDesign(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              GetBuilder<AccountHolderDetailController>(
                  id: "loader",
                  builder: (con) {
                    return (con.bankModel.data == null ||
                                con.bankModel.data!.length == 0) &&
                            con.showLoader == true
                        ? Container(
                            height: Get.height * 0.5,
                            width: Get.width,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Container(
                                  width: Get.width,
                                  margin: EdgeInsets.only(left: 10),
                                  // padding:EdgeInsets.only(left: 10),
                                  child: Text(
                                    Strings.accountHolderDetails,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(height: 15),
                                accountHolderDetails(context),
                                ///Drop Down button
                                /* GetBuilder<AccountHolderDetailController>(
                                  id: "mDropDown",
                                    builder: (con) {
                                  return Container(
                                    height: 45,
                                    width: Get.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        // color: ColorRes.blue,
                                        border: Border.all(color: ColorRes.blue),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(7))),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          child: Image.asset(AssetRes.bank,height: 25,),
                                        ),
                                        Container(
                                            // padding:const EdgeInsets.only(left: 10),
                                            width: Get.width - 65,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                value: con.initialValueDropDown,
                                                isExpanded: true,
                                                icon: Container(
                                                    margin: EdgeInsets.only(right: 15),
                                                    child: Image.asset(
                                                      AssetRes.drop_down_arrow,
                                                      height: 10,
                                                    )),
                                                hint: Text("Select Bank"),
                                                items: con.bank
                                                    .map((item) =>
                                                        DropdownMenuItem<String>(
                                                          value: item,
                                                          child: Container(
                                                            height: 45,
                                                            decoration: BoxDecoration(
                                                                border: Border(
                                                                    bottom: BorderSide(
                                                                        color: ColorRes.blue))),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width: 5),
                                                                Image.network(
                                                                  "https://pbs.twimg.com/profile_images/880333363982159872/lA3myMTv_400x400.jpg",
                                                                  height: 40,
                                                                ),
                                                                SizedBox(width: 5),
                                                                Text(item.toString(),
                                                                    style: TextStyle(
                                                                        color: ColorRes.black,
                                                                        fontSize: 12,
                                                                        fontWeight:
                                                                        FontWeight.w500))
                                                              ],
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                onChanged: (String? value) {
                                                  con.onChangedDropDown(value);
                                                },
                                                alignment: AlignmentDirectional.centerStart,
                                                  style: TextStyle(color: ColorRes.black,fontWeight: FontWeight.w500),
                                                // selectedItemBuilder:(val){
                                                //   return con.bank.map<Widget>((String item) {
                                                //     return Container(
                                                //       height: 45,
                                                //       decoration: BoxDecoration(
                                                //           border: Border(
                                                //               bottom: BorderSide(
                                                //                   color: ColorRes.blue))),
                                                //       child: Row(
                                                //         children: [
                                                //           SizedBox(width: 5),
                                                //           Image.network(
                                                //             "https://pbs.twimg.com/profile_images/880333363982159872/lA3myMTv_400x400.jpg",
                                                //             height: 40,
                                                //           ),
                                                //           SizedBox(width: 5),
                                                //           Text("HDFC",
                                                //               style: TextStyle(
                                                //                   color: ColorRes.black,
                                                //                   fontSize: 12,
                                                //                   fontWeight:
                                                //                   FontWeight.w500))
                                                //         ],
                                                //       ),
                                                //     );
                                                //   }).toList();
                                                // }
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                                }),*/
                                ///true
                                GetBuilder<AccountHolderDetailController>(
                                    id: "dropDown",
                                    builder: (con) {
                                      return Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 45,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 1),
                                                // margin: const EdgeInsets.only(bottom: 15),
                                                decoration: BoxDecoration(
                                                    // color: ColorRes.offWhite,
                                                    border: Border.all(
                                                        color: ColorRes.blue),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(10))),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 43,
                                                    ),
                                                    SizedBox(
                                                      width: Get.width - 80,
                                                      child: TextField(
                                                        controller:
                                                            con.bankController,
                                                        focusNode: con.bankFn,
                                                        decoration: InputDecoration(
                                                          contentPadding:
                                                              const EdgeInsets.only(
                                                                  left: 4.11),
                                                          border:
                                                              const OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(8),
                                                            ),
                                                            borderSide:
                                                                BorderSide.none,
                                                          ),
                                                          hintText: "Select Bank",
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  ColorRes.greyColor,
                                                              fontSize:
                                                                  Get.width / 28,
                                                              fontWeight:
                                                                  FontWeight.w600),
                                                          enabled: true,
                                                          // prefix: Container(
                                                          //     height: 20,
                                                          //     width: 20,
                                                          //     margin: EdgeInsets.only(
                                                          //         left: 10, right: 10),
                                                          //     child: Image.asset(AssetRes.bank,
                                                          //         height: 5, width: 5)),
                                                          suffixIcon: Container(
                                                              height: 15,
                                                              width: 15,
                                                              padding:
                                                                  EdgeInsets.all(12),
                                                              child: Image.asset(
                                                                  AssetRes
                                                                      .drop_down_arrow,
                                                                  height: 5,
                                                                  width: 5)),
                                                        ),
                                                        readOnly: true,
                                                        onChanged: (val) {},
                                                        onTap: () {
                                                          con.onTapDropDown();
                                                        },
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                          color: ColorRes.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              con.bankError == ""?SizedBox(height: 15):
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding:EdgeInsets.only(left: 10),
                                                child: Text(con.bankError,style: TextStyle(color: Colors.red)))
                                            ],
                                          ),

                                          Positioned(
                                              top: 10,
                                              left: 5,
                                              child: Container(
                                                  // decoration: BoxDecoration(
                                                  //     border: Border.all()),
                                                  height: 25,
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: con.showLogo
                                                      ? Image.network(
                                                          con.bankLogo!)
                                                      : Image.asset(AssetRes.bank,
                                                          height: 5, width: 5)))
                                        ],
                                      );
                                    }),

                                paymentMethodList(),
                                SizedBox(height: 50),
                                submitBtn()
                                // Spacer(),
                              ],
                            ),
                        );
                  }),
              GetBuilder<AccountHolderDetailController>(
                  id: "dropDown",
                  builder: (con) {
                    return con.showDropDown
                        ? Positioned(
                            top: con.nameError == "" &&
                                    con.phoneError == "" &&
                                    con.amountError == ""
                                ? 287//Get.height * 0.48 //345
                                : 287 + 13,//Get.height * 0.48 ,//+ 15,
                            child: Container(
                              alignment: Alignment.topLeft,
                              // height: 200,
                              width: Get.width - 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: ColorRes.blue),
                              ),
                              child: Card(
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.builder(
                                      itemCount: con.bank.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            con.onSelectDropDownItem(
                                                con.bank[index],
                                                con.images[index]);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            height: 45,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: ColorRes.blue))),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 5),
                                                Image.network(
                                                  con.images[index],
                                                  height: 40,
                                                ),
                                                SizedBox(width: 5),
                                                Text(con.bank[index],
                                                    style: TextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600))
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ))
                        : SizedBox();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
