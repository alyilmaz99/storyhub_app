import 'package:flutter/material.dart';

class GameSettingsModel with ChangeNotifier {
  int playerCount;
  int timerValue;
  int roundSpeedValue;
  int roundCount;

  GameSettingsModel({
    required this.playerCount,
    required this.timerValue,
    required this.roundSpeedValue,
    required this.roundCount,
  }) {
    playerCount = 2;
    timerValue = 20;
    roundSpeedValue = 1;
    roundCount = 3;
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

  void incrementPlayerCount() {
    if (playerCount < 10) {
      playerCount++;
      notifyListeners();
    }
  }

  void decrementPlayerCount() {
    if (playerCount > 2) {
      playerCount--;
      notifyListeners();
    }
  }

  void incrementTimerValue() {
    if (timerValue < 60) {
      timerValue++;
      notifyListeners();
    }
  }

  void decrementTimerValue() {
    if (timerValue > 1) {
      timerValue--;
      notifyListeners();
    }
  }

  void incrementRoundSpeedValue() {
    if (roundSpeedValue < 3) {
      roundSpeedValue++;
      notifyListeners();
    }
  }

  void decrementRoundSpeedValue() {
    if (roundSpeedValue > 1) {
      roundSpeedValue--;
      notifyListeners();
    }
  }

  void incrementRoundCount() {
    if (roundCount < 10) {
      roundCount++;
      notifyListeners();
    }
  }

  void decrementRoundCount() {
    if (roundCount > 1) {
      roundCount--;
      notifyListeners();
    }
  }
  int getTimerValue(){
    return timerValue;
  }
}
