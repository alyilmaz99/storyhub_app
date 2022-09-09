import 'package:flutter/cupertino.dart';
import 'package:storyhub/core/components/GameContreller.dart';
import 'package:storyhub/feature/home/view/tappedCard.dart';

import '../view/CardPAge.dart';
import '../view/HomeCardsOrder.dart';
import '../view/gameTimeVİew.dart';

abstract class HomeCardsOrderViewModel extends State<HomeCardsOrder> {
  Map<int, String> ImageList = {
    1: "assets/images/front.png",
    2: "assets/images/back.png",
  };

  String? RandomImageFunction(Map<int, String> imageList) {
    var values = imageList.values.toList()..shuffle();
    return imageList[0];
  }

  TappedCard newCard = TappedCard(
    assetImageCardBack: "assets/images/cardBack.png",
    assetImageCardFront: "assets/images/card1.png",
    routeToPage: CardPage(assetImageCardBack: "assets/images/cardBack.png",assetImageCardFront: "assets/images/card1.png"),
  );

  TappedCard newCard2 = TappedCard(
    assetImageCardBack: "assets/images/cardBack.png",
    assetImageCardFront: "assets/images/card2.png",
    routeToPage: CardPage(assetImageCardBack: "assets/images/cardBack.png",assetImageCardFront: "assets/images/card2.png"),
  );

  TappedCard newCard3 = TappedCard(
    assetImageCardBack: "assets/images/cardBack.png",
    assetImageCardFront: "assets/images/card3.png",
    routeToPage: CardPage(assetImageCardBack: "assets/images/cardBack.png",assetImageCardFront: "assets/images/card3.png"),
  );
}
