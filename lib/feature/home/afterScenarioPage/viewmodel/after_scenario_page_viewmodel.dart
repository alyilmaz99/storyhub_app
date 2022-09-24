import 'package:flutter/material.dart';
import '../../gamepage/view/HomeCardsOrder.dart';

import '../view/after_scenario_page_view.dart';

abstract class AfterScenarioViewModel extends State<AfterScenarioView> {}

Widget crateHeroImage(BuildContext context, String path, double width,
    double height, double opacity) {
  return Column(
    children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
            opacity: opacity,
            fit: BoxFit.fill,
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            minimumSize: Size(MediaQuery.of(context).size.width / 5,
                MediaQuery.of(context).size.height / 30)),
        child: const Text(
          "İsim",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

Widget buildFirstButton(BuildContext context, String text, double height,
    double width, Color color, Function function) {
  return SizedBox(
    width: width,
    height: height,
    child: OutlinedButton(
      onPressed: () {
        function;
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
