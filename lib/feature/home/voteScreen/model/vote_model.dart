import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';

class Vote with ChangeNotifier {
  int headerPlayer = 0;
  int? counter = 0;
  String? headerImage;
  List<String> names = [];

  ///FOR MY CODES
  List<Player> playerList = [];
  int counterForTour = 0;
  List<Player> playerList2 = [];
  List<Player> catcher = [];
  String firstImage = '';
  bool isFinishVote = false;
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
      playerList[0].isVote = true;
      firstImage = playerList[0].image;
    } else if (counterForTour <
        Provider.of<GameSettingsModel>(context, listen: false).playerCount) {
      for (int i = 0; i < playerList.length; i++) {
        if (playerList[i].isVote == true) {
          if (playerList2[i].isVote == false) {
            catcher.add(playerList[i]);
            playerList[i] = playerList2[i];
            playerList2[i] = catcher[0];
            playerList[i].isVote = true;
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
}
