import 'dart:math';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../product/model/player_selection_model.dart';

class PlayerCarouselViewModel with ChangeNotifier {
  List<PlayerSelectionModel> playerList;
  String choosenName = "";
  String choosenImgPath = "";
  Map<int, bool> map;
  int index;
  int countTour;
  CountDownController controller2 = CountDownController();
  String cardName = 'KART İSMİ';
  PlayerCarouselViewModel({
    required this.playerList,
    required this.map,
    required this.choosenName,
    required this.choosenImgPath,
    required this.index,
    required this.countTour,
  });
  int useForTourCountChechk = 1;
  int counter = 0;
  void countCheck(context) {
    print(counter.toString());
    if (counter < 0) {
      for (int i = counter; i < 0; i++) {
        Provider.of<PlayerCarouselViewModel>(context, listen: false)
            .carouselNext();
      }
    } else if (counter > 0) {
      for (int i = counter; i > 0; i--) {
        Provider.of<PlayerCarouselViewModel>(context, listen: false)
            .carouselPrevious();
      }
    } else {
      print("everthing is okay");
    }
    counter = 0;
  }

  List<PlayerSelectionModel> postPlayerList() {
    return playerList;
  }

  void carouselNext() {
    for (int i = 0; i < map.length; i++) {
      if (map[i] == true) {
        index = i;
      }
    }
    if (index == map.length - 1) {
      map[index] = false;
      map[0] = true;
      choosenName = playerList[0].playerName;
      choosenImgPath = playerList[0].imgPath;
    } else {
      map[index] = false;
      map[index + 1] = true;
      choosenName = playerList[index + 1].playerName;
      choosenImgPath = playerList[index + 1].imgPath;
    }
    notifyListeners();
  }

  void carouselPrevious() {
    for (int i = 0; i < map.length; i++) {
      if (map[i] == true) {
        index = i;
      }
    }
    if (index == 0) {
      map[index] = false;
      map[map.length - 1] = true;
      choosenName = playerList[map.length - 1].playerName;
      choosenImgPath = playerList[map.length - 1].imgPath;
    } else {
      map[index] = false;
      map[index - 1] = true;
      choosenName = playerList[index - 1].playerName;
      choosenImgPath = playerList[index - 1].imgPath;
    }
    notifyListeners();
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
    Future.delayed(Duration.zero, () async {
      notifyListeners();
    });
  }

  int selectedIndex() {
    for (int i = 0; i < map.length; i++) {
      if (map[i] == true) {
        index = i;
      }
    }
    return index;
  }

  int firstIndex() {
    for (int i = 0; i < map.length; i++) {
      if (map[i] == true) {
        index = i;
      }
    }
    if (index == 0) {
      return map.length - 1;
    } else {
      return index - 1;
    }
  }

  int thirdIndex() {
    for (int i = 0; i < map.length; i++) {
      if (map[i] == true) {
        index = i;
      }
    }
    if (index == map.length - 1) {
      return 0;
    } else {
      return index + 1;
    }
  }
}
