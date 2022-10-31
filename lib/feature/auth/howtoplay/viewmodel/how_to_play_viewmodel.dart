import 'package:flutter/material.dart';
import 'package:storyhub/feature/auth/howtoplay/view/how_to_play_view.dart';

import '../../../home/mainpage/view/main_page_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingItem {
  final String title;
  final String subtitle;
  final String image;
  final int number;
  const OnboardingItem({
    required this.number,
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
        number: 0,
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle: "Bir kişi seçilen senaryoyu okuyarak oyunu başlatır.",
        image: "assets/images/slider/card.png",
        number: 1,
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle:
            "Grup üyeleri kartlarda bulunan kelimelerle oyunu devam ettirir.",
        image: "assets/images/slider/cards.png",
        number: 2,
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle:
            "Oyun öncesinde belirlenen süre içinde anlatımın bitirilmesi gerekir.",
        image: "assets/images/slider/9.png",
        number: 3,
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
    currentPage = 0;
  }

  void previousSlide() {
    controller.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    currentPage--;
  }

  void nextSlide() {
    controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    currentPage++;
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
