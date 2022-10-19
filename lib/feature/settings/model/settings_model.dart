import 'package:flutter/material.dart';

class SettingsModel with ChangeNotifier {
  double gameVolumeVal = 0.0;
  double buttonVolumeVal = 0.0;
  double bgMusicVolumeVal = 0.0;
  String bgMusicName = "Fear";
  String language = "TR";
  bool status = false;

  void setGameVolumeVal(double val) {
    gameVolumeVal = val;
    notifyListeners();
  }

  void setButtonVolumeVal(double val) {
    buttonVolumeVal = val;
    notifyListeners();
  }

  void setBgMusicVolumeVal(double val) {
    bgMusicVolumeVal = val;
    notifyListeners();
  }

  void setBgMusicName(String val) {
    bgMusicName = val;
    notifyListeners();
  }

  void setLanguage(String val) {
    language = val;
    notifyListeners();
  }
}
