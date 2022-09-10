import 'package:flutter/material.dart';
import '../../gamepage/view/main_page_view.dart';
import '../view/sliderinformationview.dart';

class OnboardingItem {
  final String title;
  final String subtitle;
  final String image;
  final Color color;

  const OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
  });
}

class OnboardingItems {
  static List<OnboardingItem> loadOnboardingItem() {
    const inf = <OnboardingItem>[
      OnboardingItem(
          title: "STORY HUB1",
          subtitle:
              "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          image: "assets/images/splash/1.png",
          color: Color.fromRGBO(255, 255, 255, 1)),
      OnboardingItem(
          title: "STORY HUB2",
          subtitle: "Ye indulgence unreserved connection alteration appearance",
          image: "assets/images/splash/4.png",
          color: Color.fromRGBO(255, 255, 255, 1)),
      OnboardingItem(
          title: "STORY HUB3",
          subtitle:
              "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
          image: "assets/images/splash/3.png",
          color: Color.fromRGBO(255, 255, 255, 1)),
    ];
    return inf;
  }
}

abstract class SliderInformationViewModel extends State<SliderInformationView> {
  final controller = PageController(initialPage: 0);

  @override
  void onDonePress() {
    // Do what you want
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
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
