import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Service/ad_mob_service.dart';
import '../../../home/mainpage/view/main_page_view.dart';
import '../../slider/view/sliderinformationview.dart';
import '../view/gradientsplashscreenview.dart';

abstract class GradientSplashScreenViewModel
    extends State<GradientSplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(const Duration(seconds: 2), () async {
      final prefs2 = await SharedPreferences.getInstance();
      final showMainPage = prefs2.getBool('showMainPage') ?? false;
      print("showpage is : $showMainPage");
      showMainPage
          ? Navigator.of(context).pushReplacement(PageAnimationTransition(
              page: const MainPage(),
              pageAnimationType: FadeAnimationTransition()))
          : Navigator.of(context).pushReplacement(PageAnimationTransition(
              page: const SliderInformationView(),
              pageAnimationType: FadeAnimationTransition()));

      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SliderInformationView())); */
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('showMainPage', true);
    });
  }
}
