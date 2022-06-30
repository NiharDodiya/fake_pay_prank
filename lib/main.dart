import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fake_pay_prank/Services/googleAdmob.dart';
import 'package:fake_pay_prank/screens/splash/splash_screen.dart';
import 'package:fake_pay_prank/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  AdService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
      /* statusBarBrightness: Brightness.dark,
      statusBarIconBrightness:  Brightness.dark*/ //font and icon color

    ));
    return GetMaterialApp(
      title: 'Fake Pay : Prank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
      ),
      home: SplashScreen()
    );
  }
}


