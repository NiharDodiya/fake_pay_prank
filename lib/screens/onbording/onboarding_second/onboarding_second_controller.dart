import 'package:fake_pay_prank/Services/googleAdmob.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OnBoardingSecondController extends GetxController{
  BannerAd? bannerAd;
  RxBool bannerLoaded = false.obs;

  @override
  void onInit() {
    AdService.showInterstitialAd(() {
      init(showAd: true);
    });
    super.onInit();
  }
  void dispose() {
    super.dispose();
    bannerAd!.dispose();
  }


  Future<void> init({bool? showAd}) async {
    if (showAd == true) {
      Future.delayed(1.seconds, () {
        loadBannerAd();
      });
    }
  }


  Future<void> loadBannerAd() async {
/*    if (kDebugMode) {
      return;
    }*/
    final AnchoredAdaptiveBannerAdSize? size =
    await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        Get.width.truncate());
    if (size == null) {
      return;
    }

    bannerAd = BannerAd(
      adUnitId: AdService.bannerAdId,
      size: size,
      request: AdService.adRequest,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          bannerAd = ad as BannerAd;
          bannerLoaded.value = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          loadBannerAd();
        },
      ),
    );
    return bannerAd!.load();
  }
}