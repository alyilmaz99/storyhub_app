import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../view/game_settings_view.dart';

abstract class GameSettingsViewModel extends State<GameSettingsView> {
  int timer = 25;
  String showtimer = "25";
  bool canceltimer = false;

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          //tur dönecek
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void increaseTimer() {
    setState(() {
      timer += 5;
      showtimer = timer.toString();
    });
  }

  void decreaseTimer() {
    setState(() {
      timer -= 5;
      showtimer = timer.toString();
    });
  }
}
