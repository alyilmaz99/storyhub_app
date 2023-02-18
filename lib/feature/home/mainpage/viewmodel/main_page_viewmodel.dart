// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/Service/ad_mob_service.dart';
import 'package:storyhub/feature/auth/howtoplay/view/how_to_play_view.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../view/main_page_view.dart';
import '../../../settings/view/game_settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class MainPageViewModel extends State<MainPage> {
  BannerAd? staticAd;
  BannerAd? inlineAd;
  bool staticAdloaded = false;
  bool inlineAdloaded = false;
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;

  static const AdRequest request = AdRequest();
  @override
  void initState() {
    Provider.of<AdMobService>(context, listen: false).initAd();
    loadStaticBannerAd();

    super.initState();
  }

  void _initAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-2763655103678935/5076059712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void loadStaticBannerAd() {
    staticAd = BannerAd(
      adUnitId: 'ca-app-pub-2763655103678935/6793280075',
      size: AdSize.banner,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(
            () {
              staticAdloaded = true;
            },
          );
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('=========failed ${error.message}');
        },
      ),
    );
    staticAd!.load();
  }

//Button//sound //sound = Button//sound();
  Widget buildFirstButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.4,
      height: MediaQuery.of(context).size.height / 10,
      child: OutlinedButton(
        onPressed: () {
          /*
          if (_interstitialAd == null) {
            _initAd();
            _interstitialAd?.show();
          }
          if (_isAdLoaded) {
            print('==================================yuklendi');
            _interstitialAd?.show();
          }
          */
          setState(() {
            Provider.of<AdMobService>(context, listen: false)
                .showAdInterstitialAd();
          });

          HapticFeedback.lightImpact();
          //System//sound.play(System//soundType.click);
          Provider.of<PlayerCarouselViewModel>(context, listen: false)
              .useForTourCountChechk = 1;
          Provider.of<PlayerCarouselViewModel>(context, listen: false)
              .countTour = 1;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GameSettingsView()));

          //sound.playButton//sound(context);
        },
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(0, 0, 0, 1),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(217, 82, 4, 1)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.mainPageEnter,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'GamerStation',
          ),
        ),
      ),
    );
  }

  Widget buildSecondButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.7,
      height: MediaQuery.of(context).size.height / 16,
      child: OutlinedButton(
        onPressed: () {
          //sound.playButton//sound(context);
          HapticFeedback.lightImpact();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HowToPlayView()));
        },
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(155, 87, 223, 0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
        child: Text(
          AppLocalizations.of(context)!.mainPageHowToPlay,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'GamerStation',
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    return Text(
      AppLocalizations.of(context)!.mainPageTimeToCreateaStory,
      style: const TextStyle(
        fontSize: 19,
        fontFamily: "GamerStation",
        color: Colors.white,
      ),
    );
  }

  Widget buildIcon() {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/images/LogoV1.svg',
      ),
      iconSize: 150,
      onPressed: () {},
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
    _interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
      _interstitialAd?.dispose();
      _interstitialAd = null;
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      _interstitialAd?.dispose();
      _interstitialAd = null;
    });
  }
}
