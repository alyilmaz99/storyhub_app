import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';

import '../../gamepage/view/CardPAge.dart';

class Vote with ChangeNotifier {
  int headerPlayer = 0;
  int? counter = 0;
  String? headerImage;
  List<String> names = [];

  ///FOR MY CODES
  List<double> playerScores = [];
  List<double> playerScoresOrdered = [];
  List<String> playerNamesOrdered = [];
  List<Player> playerList = [];
  int counterForTour = 0;
  List<Player> playerList2 = [];
  List<Player> playerList3 = [];
  List<Player> catcher = [];
  String firstImage = '';
  bool isFinishVote = false;
  List<Player> playerListTemporary = [];
  Vote({this.counter});

  String getPlayerToHead(BuildContext context) {
    if ((headerPlayer <
        Provider.of<GameSettingsModel>(context, listen: false).playerCount)) {
      if (playerList[headerPlayer].isVote == false) {
        Provider.of<Vote>(context, listen: false).headerImage =
            Provider.of<Player>(context).playerList[headerPlayer].image;
        Provider.of<Player>(context).playerList[headerPlayer].isVote = true;
      }
    }
    return headerImage!;
  }

  void changeHead(BuildContext context) {
    for (int i = 0;
        i < Provider.of<GameSettingsModel>(context, listen: false).playerCount;
        i++) {
      if (playerList[0].isVote == false) {
        Provider.of<Vote>(context, listen: false).headerImage =
            Provider.of<Player>(context, listen: false).playerList[i].image;
      }
      break;
    }
    notifyListeners();
  }

  String getPlayerName(BuildContext context, int index) {
    names.clear();
    for (int i = 0;
        i < Provider.of<GameSettingsModel>(context, listen: false).playerCount;
        i++) {
      if (playerList[i].isVote == false) {
        names.add(playerList[i].playerList[i].name);
      } else if (playerList[i].isVote == true) {
        names.remove(playerList[i].playerList[i].name);
        names.add(playerList[i].playerList[i].name);
      }
    }

    Future.delayed(Duration.zero, () async {
      notifyListeners();
    });

    return names[index];
  }

  void buttonFunc(BuildContext context) {
    increaseHeaderPlayer(context);
  }

  void increaseHeaderPlayer(BuildContext context) {
    headerPlayer++;
  }

  void setPlayerList(BuildContext context) {
    playerList = Provider.of<Player>(context, listen: false).playerList;
  }

  void setPlayerSort(BuildContext context) {
    if (counterForTour == 0) {
      for (int i = 1; i < playerList.length; i++) {
        if (i + 1 <= playerList.length) {
          playerList2.add(playerList[i]);
        }
      }
      playerList3.add(playerList[0]);
      playerList[0].isVote = true;
      firstImage = playerList[0].image;
    } else if (counterForTour <
        Provider.of<GameSettingsModel>(context, listen: false).playerCount) {
      for (int i = 0; i < playerList.length; i++) {
        for (var j = 0; j < playerList2.length; j++) {
          playerList3.add(playerList2[j]);
        }

        if (playerList[i].isVote == true) {
          if (playerList2[i].isVote == false) {
            catcher.add(playerList[i]);
            playerList[i] = playerList2[i];
            playerList2[i] = catcher[0];

            playerList[i].isVote = true;
            (Provider.of<Vote>(context, listen: false)
                .playerList
                .forEach((element) {
              print('scoresFromSet ${element.name}: ${element.score}');
            }));
            catcher.clear();
            firstImage = playerList[i].image;
            break;
          }
        }
      }
    } else {
      print("hata var bir yerde");
    }
    Future.delayed(Duration.zero, () async {
      notifyListeners();
    });
  }

  void isFinishVoteFunc(BuildContext context) {
    if (counterForTour ==
        Provider.of<GameSettingsModel>(context, listen: false).playerCount -
            1) {
      isFinishVote = true;
    }
  }

  String sendFirstImage() {
    return firstImage;
  }

  void getScoreToListandOrder(BuildContext context) {
    for (var i = 0;
        i < Provider.of<Vote>(context, listen: false).playerList2.length;
        i++) {
      Provider.of<Vote>(context, listen: false)
          .playerScores
          .add(Provider.of<Vote>(context, listen: false).playerList2[i].score);
    }
  }

/*
  List<String> getNameToListOrder(BuildContext context) {
    for (var i = getScoreToListandOrder(context); i >= 0; i--) {
      
    }
    return Provider.of<Vote>(context).playerNamesOrdered;
  }
*/
  void selectionSort() {
    if (playerList3.isEmpty) return;
    int n = playerList3.length;
    int i, steps;
    for (steps = 0; steps < n; steps++) {
      for (i = steps + 1; i < n; i++) {
        if (playerList3[steps].score > playerList3[i].score) {
          swap(steps, i);
        }
      }
    }
  }

//aliye helal olsun /w apo nuray <3 batu
  void swap(int steps, int i) {
    double temp = playerList3[steps].score;
    playerList3[steps].score = playerList3[i].score;
    playerList3[i].score = temp;
  }

  void printPlayerScoreList(BuildContext context) {
    for (var i = 0;
        i < Provider.of<Vote>(context, listen: false).playerList.length;
        i++) {
      print(Provider.of<Vote>(context, listen: false).playerList[i]);
    }
  }

  void isEqual(BuildContext context) {
    for (int i = 0;
        i < Provider.of<Vote>(context, listen: false).playerList3.length;
        i++) {
      int j = i + 1;
      if (j < Provider.of<Vote>(context, listen: false).playerList3.length) {
        if (Provider.of<Vote>(context, listen: false).playerList3[j].score ==
            Provider.of<Vote>(context, listen: false)
                .playerList3[j - 1]
                .score) {
          Provider.of<Vote>(context, listen: false).playerList3[j - 1].score -
              1;
        }
      }
    }
  }

  String showSortingImage(int index) {
    return playerList3[playerList.length - index - 1].image;
  }

  String showSortingName(int index) {
    return playerList3[playerList.length - index - 1].name;
  }

  String showSortingScore(int index) {
    return playerList3[playerList.length - index - 1].score.toString();
  }

  void orderScore(BuildContext context) {
    for (var i = 0;
        i < Provider.of<Vote>(context, listen: false).playerList.length;
        i++) {
      Provider.of<Vote>(context, listen: false)
          .playerScores
          .add(Provider.of<Vote>(context, listen: false).playerList[i].score);
    }
  }

  void addToAnotherList(BuildContext context) {
    for (var i = 0;
        i < Provider.of<Vote>(context, listen: false).playerList.length;
        i++) {
      Provider.of<Vote>(context, listen: false)
          .playerList3
          .add(Provider.of<Vote>(context, listen: false).playerList[i]);
    }
  }
}
