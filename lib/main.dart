import 'package:fake_pay_prank/common/helper.dart';
import 'package:fake_pay_prank/screens/fake_pay_guide/fake_pay_guide_screen.dart';
import 'package:fake_pay_prank/screens/paytm/paytm_screen.dart';
import 'package:fake_pay_prank/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
    );
  }
}


