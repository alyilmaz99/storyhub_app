import 'package:flutter/cupertino.dart';

class Player with ChangeNotifier {
  int? id;
  String? name;
  String? image;
  int? score;
  int? rank;
  Map<dynamic, dynamic>? playersMap = <dynamic, dynamic>{};
  Map<dynamic, dynamic>? backupPlayersMap = <dynamic, dynamic>{};
  Player({this.id, this.name, this.image, this.score, this.rank, this.playersMap, this.backupPlayersMap});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    score = json['score'];
    rank = json['rank'];
    playersMap = json['playersMap'];
    backupPlayersMap = json['backupPlayersMap'];
  }

  Future<String> getimagePath(int? number) async {
    image = 'assets/images/profiles/$number.png';
    return image!;
  }

  Future<Map<dynamic, dynamic>?> createPlayerfunc(
    int userNumber,
    List<TextEditingController> textEditingControllers,
    int? score,
    int? rank,
    Future<String>? getimagepathfunc,
    int id,
  ) async {
    for (var i = 1; i <= userNumber; i++) {
      playersMap!['id'] = i;
      playersMap!['name'] = textEditingControllers[i].toString();
      playersMap!['image'] = getimagepathfunc;
      playersMap!['score'] = score;
      playersMap!['rank'] = rank;
    }
    return playersMap!;
  }

  Future<void> equalMaps() async {
    playersMap = backupPlayersMap;
  }

  Future<List> getPlayerName(int id) async {
    var entryList = playersMap!.entries.toList();
    List playerName = <String>[];
    for (var element in entryList) {
      if (element.key == 'name' && element.key['i'] == id) {
        playerName.add(element.value);
      }
    }
    return playerName;
  }

  Future<List> getPlayerImages(int id) async {
    var entryList = playersMap!.entries.toList();
    List playerImages = <String>[];
    for (var element in entryList) {
      if (element.key == 'image' && element.key['i'] == id) {
        playerImages.add(element.value);
      }
    }
    return playerImages;
  }

  Future<List> getPlayerScore(int id) async {
    var entryList = playersMap!.entries.toList();
    List playerScores = <String>[];
    for (var element in entryList) {
      if (element.key == 'score' && element.key['id'] == id) {
        playerScores.add(element.value);
      }
    }
    return playerScores;
  }

  Future<List> getPlayerRank(int id) async {
    var entryList = playersMap!.entries.toList();
    List playerRank = <String>[];
    for (var element in entryList) {
      if (element.key == 'rank' && element.key['id'] == id) {
        playerRank.add(element.value);
      }
    }
    return playerRank;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['score'] = score;
    data['rank'] = rank;
    return data;
  }

  Future<bool> arePlayerDone(List<bool> textValueisEmpty) async {
    bool? isCheck;
    for (var element in textValueisEmpty) {
      if (element == true) {
        isCheck = true;
      } else if (element == false) {
        isCheck = false;
        break;
      }
    }
    return isCheck!;
  }
}
