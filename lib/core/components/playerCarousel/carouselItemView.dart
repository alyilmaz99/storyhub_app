import 'package:flutter/material.dart';
import '../../../feature/home/afterScenarioPage/view/after_scenario_page_view.dart';

abstract class CarouselItemView extends State<AfterScenarioView> {}

Widget carouselItem(BuildContext context, String path, double width,
    double height, double opacity, String name) {
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
        child: Text(
          name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}
