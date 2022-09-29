import 'package:flutter/material.dart';

class SelectScenarioModel with ChangeNotifier{
  
  int scenarioIndex = 0;

  void setScenarioIndex(int myIndex) {
    scenarioIndex = myIndex;
    notifyListeners();
  }

  int getIndex(){
    return scenarioIndex;
  }
}