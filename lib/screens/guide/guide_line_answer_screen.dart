import 'package:fake_pay_prank/common/common_screen_background.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class GuideLineAnswerScreen extends StatelessWidget {
  final String answer;

  const GuideLineAnswerScreen({Key? key, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenDesign(
          child: SingleChildScrollView(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(height: 15),
            Text("Answer",style: TextStyle(color: ColorRes.black,fontWeight: FontWeight.w600,fontSize: 22),),
            SizedBox(height: 15),
            HtmlWidget(this.answer),
        ],
      ),
          )),
    );
  }
}
