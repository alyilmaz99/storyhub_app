import 'package:flutter/material.dart';

class PlayerSelectionModel with ChangeNotifier {
  String imgPath;
  String playerName;

  PlayerSelectionModel({
    required this.imgPath,
    required this.playerName,
  });
}
