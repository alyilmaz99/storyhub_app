import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../settings/model/game_settings_model.dart';

class Player with ChangeNotifier {
  int? id;
  String? name;
  String? image;
  int? score;
  int? rank;
  final List<bool> textValueisEmpty = [];
  Map<String, dynamic>? playersMap = <String, dynamic>{};
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['score'] = score;
    data['rank'] = rank;
    return data;
  }

  Map<String, dynamic> createPlayerfunc(
    BuildContext context,
    List<TextEditingController> textEditingControllers,
    int? score,
    int? rank,
    Future<String>? getimagepathfunc,
    int id,
  ) {
    for (var i = 1; i <= Provider.of<GameSettingsModel>(context).playerCount; i++) {
      id = i;
      playersMap?['id'] = id;
      playersMap?['name'] = textEditingControllers[i].toString();
      playersMap?['image'] = getimagepathfunc;
      playersMap?['score'] = score;
      playersMap?['rank'] = rank;
    }
    return playersMap!;
  }

  Future<String> getimagePath(int? number) async {
    image = 'assets/images/profiles/$number.png';
    return image!;
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
