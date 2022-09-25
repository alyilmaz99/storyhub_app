import 'package:flutter/material.dart';
import '../../../home/mainpage/view/main_page_view.dart';
import '../view/sliderinformationview.dart';

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
    const inf = <OnboardingItem>[
      OnboardingItem(
        title: "NEDİR?",
        subtitle:
            "Story Hub, grup halinde oynanan zincirleme hikaye yaratma oyunudur.",
        image: "assets/images/slider/1.png",
      ),
      OnboardingItem(
        title: "OYUN KURALLARI",
        subtitle:
            "Oyuncular verilen süre içerisinde kartları kullanarak bağlantılı bir şekilde hikayeyi devam ettirmelidirler.",
        image: "assets/images/slider/2.png",
      ),
      OnboardingItem(
        title: "OYUNCU SAYISI",
        subtitle: "2 ila 8 kişi arasında gruplar halinde oynanır",
        image: "assets/images/slider/3.png",
      ),
      OnboardingItem(
        title: "PUANLAMA TABLOSU",
        subtitle:
            "Oylama sonucunda ek olarak kullanılan kartlar eklenir ve sıralama ile kazanan belirlenir.",
        image: "assets/images/slider/4.png",
      ),
      OnboardingItem(
        title: "KARTLAR",
        subtitle:
            "Oyunun içinde metinlere eklenerek senaryonun devamını sağlar",
        image: "assets/images/slider/5.png",
      ),
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
    return inf;
  }
}

abstract class SliderInformationViewModel extends State<SliderInformationView> {
  final controller = PageController(initialPage: 0);
  final int numPages = 8;
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
