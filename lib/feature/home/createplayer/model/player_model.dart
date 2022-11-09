// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/settings/model/settings_model.dart';

import '../../../settings/model/game_settings_model.dart';

class Player with ChangeNotifier {
  double playerVoteNumber = 3;
  List<Player> playerList = [];
  int? id;
  String name = '';
  String image = '';
  double score = 0;
  int rank = 1;
  bool isVote = false;
  final List<bool> textValueisEmpty = [];
  Map<String, dynamic>? playersMap = <String, dynamic>{};
  Map<dynamic, dynamic>? backupPlayersMap = <dynamic, dynamic>{};
  Player(
      {this.id,
      required this.playerVoteNumber,
      required this.playerList,
      required this.name,
      required this.image,
      required this.score,
      required this.rank,
      required this.isVote,
      this.playersMap,
      this.backupPlayersMap});
  Player.fromJson(Map<String, dynamic> json) {
    playerVoteNumber = json["playerVoteNumber"];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    score = json['score'];
    rank = json['rank'];
    playersMap = json['playersMap'];
    backupPlayersMap = json['backupPlayersMap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['playerVoteNumber'] = playerVoteNumber;
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['score'] = score;
    data['rank'] = rank;
    return data;
  }

  Map<String, dynamic> createPlayerfunc(
    BuildContext context,
    String text,
    double? score,
    int? rank,
    String getimagepathfunc,
    int id,
    double playerVoteNumber,
  ) {
    for (var i = 1;
        i <= Provider.of<GameSettingsModel>(context).playerCount;
        i++) {
      id = i;
      playersMap?['playerVoteNumber'] = playerVoteNumber;
      playersMap?['id'] = id;
      playersMap?['name'] = text;
      playersMap?['image'] = getimagepathfunc;
      playersMap?['score'] = score;
      playersMap?['rank'] = rank;
    }
    return playersMap!;
  }

  void createList(
    BuildContext context,
    List<TextEditingController> textEditingControllers,
    int rank,
    double score,
  ) {
    for (int i = 1;
        i <= Provider.of<GameSettingsModel>(context, listen: false).playerCount;
        i++) {
      playerList.add(
        Player(
          playerVoteNumber: playerVoteNumber,
          playerList: playerList,
          image: getimagePath(i),
          name: textEditingControllers[i].text,
          rank: rank,
          score: score,
          isVote: false,
        ),
      );
    }
  }

  String getimagePath(int? number) {
    image = 'assets/images/profiles/$number.png';
    return image;
  }
}
