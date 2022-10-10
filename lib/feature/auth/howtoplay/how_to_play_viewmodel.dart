import 'package:flutter/material.dart';
import 'package:storyhub/feature/auth/howtoplay/how_to_play_view.dart';

import '../../home/mainpage/view/main_page_view.dart';

class OnboardingItem {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class OnboardingItems {
  static List<OnboardingItem> loadOnboardingItem() {
    const hwplay = <OnboardingItem>[
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle: "Story Hub grup halinde oynanan bir oyundur",
        image: "assets/images/slider/6.png",
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle: "Bir kişi seçilen senaryoyu okuyarak oyunu başlatır.",
        image: "assets/images/slider/7.png",
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle:
            "Grup üyeleri kartlarda bulunan kelimelerle oyunu devam ettirir.",
        image: "assets/images/slider/8.png",
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle:
            "Oyun öncesinde belirlenen süre içinde anlatımın bitirilmesi gerekir.",
        image: "assets/images/slider/9.png",
      ),
    ];
    return hwplay;
  }
}

abstract class HowToPlayViewModel extends State<HowToPlayView> {
  final controller = PageController(initialPage: 0);
  final int numPages = 3;
  int currentPage = 0;

  void onDonePress() {
    // Do what you want
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  void previousSlide() {
    controller.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void nextSlide() {
    controller.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void endSlide() {
    controller.jumpToPage(3);
  }
}

class TextArea extends StatelessWidget {
  const TextArea({Key? key, this.textPadding, this.myHeight, this.myWidth})
      : super(key: key);
  final Widget? textPadding;
  final double? myWidth;
  final double? myHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: myWidth,
        height: myHeight,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(216, 96, 52, 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.2, 0.3),
                spreadRadius: 5,
                blurRadius: 7,
              )
            ]),
        child: textPadding);
  }
}
