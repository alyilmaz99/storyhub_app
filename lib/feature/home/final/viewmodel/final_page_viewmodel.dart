import 'dart:math';
import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/final/model/player_selection_model.dart';

class FinalPageViewModel with ChangeNotifier {
  List<PlayerSelectionModel> playerList;
  String choosenName = "";
  String choosenImgPath = "";
  Map<int, bool> map;

  FinalPageViewModel({
    required this.playerList,
    required this.map,
    required this.choosenName,
    required this.choosenImgPath,
  }) {
    playerList = [];
  }
  void setPlayerList(List<PlayerSelectionModel> list) {
    playerList = list;
  }

  List<PlayerSelectionModel> getPlayerList() {
    return playerList;
  }

  Map getMap() {
    return map;
  }

  void setMap(List<PlayerSelectionModel> playerList) {
    for (int i = 0; i < playerList.length; i++) {
      map[i] = false;
    }
  }

  void randomChoose() {
    int random = (playerList.length * 1.0 * (Random().nextDouble())).toInt();
    setMap(playerList);
    map[random] = true;
    choosenName = playerList[random].playerName;
    choosenImgPath = playerList[random].imgPath;
    notifyListeners();
  }

  void changeMap(int index) {
    setMap(playerList);
    map[index] = true;
    choosenName = playerList[index].playerName;
    choosenImgPath = playerList[index].imgPath;
    notifyListeners();
  }
}
