import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:storyhub/view/home_page.dart';

class SliderInformationView extends StatefulWidget {
  const SliderInformationView({Key? key}) : super(key: key);

  @override
  State<SliderInformationView> createState() => _SliderInformationViewState();
}

class _SliderInformationViewState extends State<SliderInformationView> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "STORY HUB1",
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/1.png",
        backgroundColor: const Color(0xfff5a623),
      ),
    );
    slides.add(
      Slide(
        title: "STORY HUB2",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "assets/images/2.jpg",
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "STORY HUB3",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/images/3.png",
        backgroundColor: const Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
      autoScroll: true,
      autoScrollInterval: const Duration(seconds: 10),
      hideStatusBar: false,
    );
  }
}
