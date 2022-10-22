import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SortingPageViewModel extends StatelessWidget {
  const SortingPageViewModel({super.key});
}

Widget buildContainer(BuildContext context, Color color, String image,
    String secondImage, String name) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    width: screenWidth / 1.15,
    height: screenHeight / 8,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 1.0, // soften the shadow
          spreadRadius: 0.5, //extend the shadow
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth / 4.5,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(image),
          )),
        ),
        SizedBox(
          width: screenWidth / 20,
        ),
        Container(
          width: screenWidth / 2.5,
          height: screenHeight / 25,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              name,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth / 25,
        ),
        Container(
          width: screenWidth / 10,
          height: screenHeight / 10,
          child: SvgPicture.asset(secondImage),
        ),
      ],
    ),
  );
}
