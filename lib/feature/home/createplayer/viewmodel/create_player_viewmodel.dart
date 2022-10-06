import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/scenario/view/selectscenarioview.dart';
import '../view/create_player_view.dart';

abstract class CreatePlayerViewModel extends State<CreatePlayerView> {
  static bool isEmpty = false;
  static bool isReady = false;

  TextField playerNameCreateTextField(
    BuildContext context,
    List<TextEditingController>? textEditingControllers,
    List<bool>? textValueisEmpty,
    int? order,
  ) {
    return TextField(
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            textValueisEmpty![order!] = false;
          } else {
            textValueisEmpty![order!] = true;
          }
        });
      },
      maxLines: 1,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
      controller: textEditingControllers![order!],
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: "İsim",
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Color.fromRGBO(223, 97, 50, 1),
              width: 4,
            )),
        fillColor: Colors.red,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(223, 97, 50, 1),
            width: 1.1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  BoxDecoration playerNameCreateContainerDecoration() {
    return const BoxDecoration(
      color: Color.fromRGBO(218, 153, 115, 0.8),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
  }
}

Widget buildFirstButton(
  BuildContext context,
  bool isCheck,
  Future function,
  Future writefunc,
) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.4,
    height: MediaQuery.of(context).size.height / 13,
    child: OutlinedButton(
      onPressed: () {
        if (isCheck == true) {
          function;
          writefunc;
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectScenarioView()));
        }
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5),
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(0, 82, 4, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            isCheck ? const Color.fromRGBO(143, 85, 203, 1) : const Color.fromRGBO(219, 96, 52, 1)),
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
