import 'package:flutter/material.dart';

import '../../../home/mainpage/view/main_page_view.dart';
import '../view/how_to_play_view.dart';

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
            " Oyuncular okunan senaryonun devamını verilen kartları da kullanarak belirlenen süre bitene kadar devam ettirmeye çalışır ",
        image: "assets/images/slider/cards.png",
        number: 2,
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle:
            "Son tur da tamamlandığında belirlenen ya da rastgele bir oyuncu oyunu finale bağlar",
        image: "assets/images/slider/bayrak.png",
        number: 3,
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle:
            "Tüm oyuncular yıldızlar ile oylanır ve en iyi anlatıcı belirlenir",
        image: "assets/images/slider/cakbeslik.png",
        number: 4,
      ),
      OnboardingItem(
        title: "NASIL OYNANIR?",
        subtitle: "En iyi anlatıcıyı belirleme zamanı",
        image: "assets/images/slider/bosluk.png",
        number: 4,
      ),
    ];
    return hwplay;
  }
}

abstract class HowToPlayViewModel extends State<HowToPlayView> {
  final controller = PageController(initialPage: 0);

  final int numPages = 5;
  int currentPage = 0;
  //Button//sound //sound = Button//sound();
  void onDonePress() {
    // Do what you want
    // //sound.playButton//sound(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
    currentPage = 0;
  }

  void previousSlide() {
    ////sound.playButton//sound(context);
    controller.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    currentPage--;
  }

  void nextSlide() {
    // //sound.playButton//sound(context);
    controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    currentPage++;
  }

  void endSlide() {
    // //sound.playButton//sound(context);
    controller.jumpToPage(5);
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
