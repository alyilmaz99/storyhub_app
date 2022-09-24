import 'package:flutter/material.dart';

class PlayerSelectionModel with ChangeNotifier {
  bool selected;
  final String imgPath;
  final String playerName;

  PlayerSelectionModel({
    required this.selected,
    required this.imgPath,
    required this.playerName,
  }) {
    selected = false;
  }
}
