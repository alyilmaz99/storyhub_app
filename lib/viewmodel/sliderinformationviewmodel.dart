import 'package:flutter/material.dart';
import 'package:storyhub/view/game_page_view.dart';
import 'package:storyhub/view/sliderinformationview.dart';
import 'package:intro_slider/intro_slider.dart';

abstract class SliderInformationViewModel extends State<SliderInformationView> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "STORY HUB1",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/1.png",
        backgroundColor: const Color(0xfff5a623),
      ),
    );
    slides.add(
      Slide(
        title: "STORY HUB2",
        description:
            "Ye indulgence unreserved connection alteration appearance",
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
