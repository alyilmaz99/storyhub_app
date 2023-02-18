import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService extends ChangeNotifier {
  BannerAd? staticAd;
  BannerAd? inlineAd;
  bool staticAdloaded = false;
  bool inlineAdloaded = false;
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  static const AdRequest request = AdRequest();

  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2763655103678935~5594934462';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get interstitialAdUnitID {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2763655103678935~5594934462';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2763655103678935~5594934462';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  void initAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-2763655103678935/5076059712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
    _interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
      _interstitialAd!.dispose();
      _interstitialAd = null;
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      _interstitialAd!.dispose();
      _interstitialAd = null;
    });
  }

  void showAdInterstitialAd() {
    if (_interstitialAd == null) {
      initAd();
      _interstitialAd?.show();
    }
    if (_isAdLoaded) {
      print('==================================yuklendi');

      _interstitialAd?.show();
    }
  }
}
