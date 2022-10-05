import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../product/model/player_selection_model.dart';

class PlayerCarouselViewModel with ChangeNotifier {
  List<PlayerSelectionModel> playerList;
  String choosenName = "";
  String choosenImgPath = "";
  Map<int, bool> map;

  PlayerCarouselViewModel({
    required this.playerList,
    required this.map,
    required this.choosenName,
    required this.choosenImgPath,
  }) {}

  void carouselNext() {
    int index = 0;
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
    int index = 0;
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
    notifyListeners();
  }

  void changeMap(int index) {
    setMap(playerList);
    map[index] = true;
    choosenName = playerList[index].playerName;
    choosenImgPath = playerList[index].imgPath;
    notifyListeners();
  }

  int selectedIndex() {
    int index = 0;
    for (int i = 0; i < map.length; i++) {
      if (map[i] == true) {
        index = i;
      }
    }
    return index;
  }

  int firstIndex() {
    int index = 0;
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
    int index = 0;
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

  Widget crateHeroImage(BuildContext context, String path, double width,
      double height, double opacity) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              opacity: opacity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side:
                    BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
              ),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              minimumSize: Size(MediaQuery.of(context).size.width / 5,
                  MediaQuery.of(context).size.height / 30)),
          child: const Text(
            "İsim",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
