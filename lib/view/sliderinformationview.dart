import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:storyhub/viewmodel/sliderinformationviewmodel.dart';

class SliderInformationView extends StatefulWidget {
  const SliderInformationView({Key? key}) : super(key: key);

  @override
  State<SliderInformationView> createState() => _SliderInformationViewState();
}

class _SliderInformationViewState extends SliderInformationViewModel {
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
