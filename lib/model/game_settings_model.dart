import 'package:flutter/material.dart';

class GameSettingsModel with ChangeNotifier {
  int playerCount;
  int timerValue;
  int roundSpeedValue;

  GameSettingsModel({
    required this.playerCount,
    required this.timerValue,
    required this.roundSpeedValue,
  }) {
    playerCount = 1;
    timerValue = 0;
    roundSpeedValue = 0;
  }

  void setPlayerCount(int value) {
    playerCount = value;
    notifyListeners();
  }

  void setTimerValue(int value) {
    timerValue = value;
    notifyListeners();
  }

  void setRoundSpeedValue(int value) {
    roundSpeedValue = value;
    notifyListeners();
  }
}
