import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';

class Vote with ChangeNotifier {
  List<Player> playerList = [];
  int? headerPlayer = 0;
  int? counter = 0;
  String? headerImage;
  List<String> names = [];
  Vote({this.counter});

  String getPlayerToHead(BuildContext context) {
    if (playerList[headerPlayer!].isVote == false) {
      Provider.of<Vote>(context, listen: false).headerImage =
          Provider.of<Player>(context).playerList[headerPlayer!].image;
      // Provider.of<Player>(context).playerList[headerPlayer!].isVote = true;
    }

    return headerImage!;
  }

  void changeHead(BuildContext context) {
    for (int i = 0; i < Provider.of<GameSettingsModel>(context, listen: false).playerCount; i++) {
      if (playerList[0].isVote == false) {
        Provider.of<Vote>(context, listen: false).headerImage =
            Provider.of<Player>(context, listen: false).playerList[i].image;
      }
      break;
    }
    notifyListeners();
  }

  void setPlayerList(BuildContext context) {
    playerList = Provider.of<Player>(context, listen: false).playerList;
  }

  String getPlayerName(BuildContext context, int index) {
    names.clear();
    for (int i = 0; i < Provider.of<GameSettingsModel>(context, listen: false).playerCount; i++) {
      if (playerList[i].isVote == false) {
        names.add(playerList[i].playerList[i].name);
      } else if (playerList[i].isVote == true) {
        names.remove(playerList[i].playerList[i].name);
      }
    }

    Future.delayed(Duration.zero, () async {
      notifyListeners();
    });
    print(names);
    return names[index];
  }

  void buttonFunc(BuildContext context) {
    increaseHeaderPlayer(context);
  }

  void increaseHeaderPlayer(BuildContext context) {
    Provider.of<Vote>(context, listen: false).headerPlayer! + 1;
  }
}
