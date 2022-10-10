import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';

class Vote with ChangeNotifier {
  int? headerPlayer = 0;
  int? counter = 0;
  String? headerImage;
  List<String>? imageList;
  List<Player>? secondPlayerList;
  Vote({this.counter});

  String getPlayerToHead(BuildContext context, List<Player> playerList) {
    if (playerList[headerPlayer!].isVote == false) {
      Provider.of<Vote>(context).headerImage = Provider.of<Player>(context).playerList[headerPlayer!].image;
      Provider.of<Player>(context).playerList[headerPlayer!].isVote = true;
    }
    headerPlayer! + 1;
    Future.delayed(Duration.zero, () async {
      notifyListeners();
    });

    return headerImage!;
  }

  List<Player> addToSecondList(BuildContext context) {
    secondPlayerList!.add(Provider.of<Player>(context).playerList[headerPlayer!]);
    return secondPlayerList!;
  }

  List<String> getImageToList(BuildContext context) {
    for (var i = 0; i < Provider.of<GameSettingsModel>(context).playerCount; i++) {
      imageList!.add(Provider.of<Player>(context).playerList[i].image);
    }
    return imageList!;
  }

  void buttonFunc(BuildContext context) {
    for (var i = 0; i < Provider.of<GameSettingsModel>(context).playerCount; i++) {}
  }

  void increaseCounter() {
    counter = counter! + 1;
    notifyListeners();
  }
}
