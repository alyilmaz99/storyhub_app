import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      colorDot: const Color.fromRGBO(189, 189, 189, 1),
      colorActiveDot: const Color.fromRGBO(64, 13, 115, 1),
      nextButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(64, 13, 115, 1)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      ),
      skipButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(64, 13, 115, 1)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      ),
      prevButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(64, 13, 115, 1)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      ),
      doneButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(64, 13, 115, 1)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
