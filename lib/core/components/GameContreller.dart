// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class GameContreller with ChangeNotifier {
  bool cancelFlipCard = false;

  static final GameContreller _gameContreller = GameContreller._internal();

  GameContreller._internal();

  factory GameContreller() {
    return _gameContreller;
  }

  void setCancelCard(bool cancelFlipCard) {
    this.cancelFlipCard = cancelFlipCard;
  }
}
