import 'package:flutter/material.dart';
import 'package:storyhub/core/components/playerCarousel/playerCarouselView.dart';
import 'package:storyhub/core/components/playerCarousel/playerCarouselViewModel.dart';

import '../../gamepage/view/CardPAge.dart';
import '../../scenario/view/displayscenario.dart';
import '../view/after_scenario_page_view.dart';

abstract class AfterScenarioViewModel extends State<AfterScenarioView> {}

Widget buildFirstButton(BuildContext context, String text, double height,
    double width, Color color, int function) {
  return SizedBox(
    width: width,
    height: height,
    child: OutlinedButton(
      onPressed: () {
        if (function == 1) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DisplayScenario()));
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => CardPage()),
              (Route<dynamic> route) => false);
        }
      },
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 23, fontFamily: 'GamerStation'),
      ),
    ),
  );
}
