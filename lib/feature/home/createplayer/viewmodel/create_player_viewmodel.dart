import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/scenario/view/selectscenarioview.dart';

import '../view/create_player_view.dart';

abstract class CreatePlayerViewModel extends State<CreatePlayerView> {}

Widget buildFirstButton(context, isCheck) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.4,
    height: MediaQuery.of(context).size.height / 13,
    child: OutlinedButton(
      onPressed: () {
        if (isCheck == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SelectScenarioView()));
        }
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5),
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(0, 82, 4, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(isCheck
            ? const Color.fromRGBO(143, 85, 203, 1)
            : const Color.fromRGBO(219, 96, 52, 1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      child: const Text(
        "DEVAM",
        style: TextStyle(
          fontFamily: 'GamerStation',
          color: Colors.white,
          fontSize: 35,
        ),
      ),
    ),
  );
}
