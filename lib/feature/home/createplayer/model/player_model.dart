import 'package:flutter/cupertino.dart';

class Player with ChangeNotifier {
  int? id;
  String? name;
  String? image;
  int? score;
  int? rank;
  Map<dynamic, dynamic>? playersMap = <dynamic, dynamic>{};
  Player(
      {this.id, this.name, this.image, this.score, this.rank, this.playersMap});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    score = json['score'];
    rank = json['rank'];
  }

  Future<void> createPlayerfunc(
      int userNumber, TextEditingController textFieldController) async {
    for (var i = 1; i <= userNumber; i++) {
      playersMap![i] = i;
      playersMap!["name"] = textFieldController.value.text;
    }
    notifyListeners();
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
}
