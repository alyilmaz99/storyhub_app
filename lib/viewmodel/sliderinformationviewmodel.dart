import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        styleTitle: TextStyle(color: Colors.black, fontSize: 30),
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/1.png",
        styleDescription: GoogleFonts.montserrat(
          textStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
    );
    slides.add(
      Slide(
        title: "STORY HUB2",
        styleTitle: TextStyle(color: Colors.black, fontSize: 30),
        maxLineTitle: 2,
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: GoogleFonts.montserrat(
          textStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        pathImage: "assets/images/4.png",
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
    );
    slides.add(
      Slide(
        title: "STORY HUB3",
        styleTitle: TextStyle(color: Colors.black, fontSize: 30),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: GoogleFonts.montserrat(
          textStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        pathImage: "assets/images/3.png",
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
