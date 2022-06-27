import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/asset_res.dart';
import '../utils/color_res.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String prefixIcon;
  FocusNode? focusNode;
  bool? obscure;
  bool? error;
  bool? enable;
  String? suffixIcon;
  bool? showSuffixIcon;
  bool? read;

  final Function(String? value)? onChange;
  final Function()? onTap;
  final TextInputType? textInputType;

  CommonTextField({
    required this.controller,
    this.obscure = false,
    required this.hintText,
    this.error,
    this.enable,
    this.focusNode,
    Key? key,
    this.onChange,
    this.onTap,
    this.textInputType,
    required this.prefixIcon,
    this.showSuffixIcon = false,
    this.suffixIcon,
    this.read = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: Get.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      // margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          // color: ColorRes.offWhite,
          border: Border.all(color: ColorRes.blue),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextField(
        onTap: (){
          onTap!();
        },
        enabled: enable,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: ColorRes.black,
        ),
        keyboardType: textInputType,
        onChanged: onChange,
        controller: controller,
        focusNode: focusNode,
        readOnly: read!,
        obscureText: obscure ?? false,
        obscuringCharacter: "⬤",
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 4.11),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorRes.greyColor,
              fontSize: Get.width / 28,
              fontWeight: FontWeight.w600),
          prefixIcon: Container(
              height: 15,
              width: 15,
              padding: EdgeInsets.all(5),
              child: Image.asset(prefixIcon, height: 5, width: 5)),
          suffixIcon: showSuffixIcon == false ? SizedBox():Container(
              height: 15,
              width: 15,
              padding: EdgeInsets.all(12),
              child: Image.asset(suffixIcon!, height: 5, width: 5))
        ),
      ),
    );
  }
}
