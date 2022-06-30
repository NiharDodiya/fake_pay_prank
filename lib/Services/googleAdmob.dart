import 'dart:io';
import 'dart:ui';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static const AdRequest adRequest = AdRequest(
  keywords: <String>['foo', 'bar'],
  contentUrl: 'http://foo.com/bar.html',
  nonPersonalizedAds: true,
  );

  static String rewardAdId = RewardedAd.testAdUnitId;
  static String interstitialAdId =InterstitialAd.testAdUnitId;// change interstitialAdId from here
  static String bannerAdId = BannerAd.testAdUnitId; // change bannerAdId from here

  // rewardAdId : ca-app-pub-3940256099942544/5224354917
  // interstitialAdId : ca-app-pub-3940256099942544/1033173712
  // bannerAdId : ca-app-pub-3940256099942544/6300978111



  static RewardedAd? _rewardedAd;
  static InterstitialAd? _interstitialAd;

  static int _interstitialCounter = 0;
  static int _rewardedCounter = 0;

  static Future<void> init() async {
    await MobileAds.instance.initialize();
    print("rewardAdId : $rewardAdId \n interstitialAdId : $interstitialAdId  \n bannerAdId : $bannerAdId");
/*    bannerAdId = Platform.isIOS ? BannerAd.testAdUnitId: BannerAd.testAdUnitId;
    interstitialAdId = Platform.isIOS?InterstitialAd.testAdUnitId:InterstitialAd.testAdUnitId;
    rewardAdId = RewardedAd.testAdUnitId;*/
    _createRewardedAd();
    _createInterstitialAd();
  }

  /* static Future<void> putAppIdInManifest() async {
    const platform = MethodChannel('Application_ID');
    try {
       // final String appId = await UserService.getApplicationId();
      final String appId = '207512873';
      await platform.invokeMethod('getBatteryLevel', appId);
    } on PlatformException catch (e) {
      print("====> flutter = $e");
    }
  }*/

  static void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdService.rewardAdId,
      request: AdService.adRequest,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _rewardedAd = null;
        },
      ),
    );
  }

  static void showRewardedAd(VoidCallback onAdClose) {
/*    if (kDebugMode) {
      _rewardedCounter++;
      onAdClose();
      return;
    }*/
    if (_rewardedAd == null) {
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        _rewardedCounter++;
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
        _createRewardedAd();
        onAdClose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
        _createRewardedAd();
        onAdClose();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
    _rewardedAd = null;
  }

  static void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdService.interstitialAdId,
        request: AdService.adRequest,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            _interstitialAd = null;
            _createInterstitialAd();
          },
        ));
  }

  static void showInterstitialAd(VoidCallback onAdClose, {bool? skipCounter}) {
/*    if (kDebugMode) {
      _interstitialCounter++;
      onAdClose();
      return;
    }*/
    if (_interstitialAd == null) {
      onAdClose();
      return ;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        if (skipCounter != true) {
          _interstitialCounter++;
        }
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        _createInterstitialAd();
        onAdClose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        _createInterstitialAd();
        onAdClose();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}