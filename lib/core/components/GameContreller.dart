import 'package:flutter/cupertino.dart';

class GameContreller with ChangeNotifier{
  bool cancelFlipCard = false;
  int sayi = 25;

  static final GameContreller _gameContreller= GameContreller._internal();

  GameContreller._internal();

  factory GameContreller() {
    return _gameContreller;
  }

  void setCancelCard(bool cancelFlipCard) {
    sayi = sayi+10;
    print(sayi);
    this.cancelFlipCard = cancelFlipCard;
  }

}