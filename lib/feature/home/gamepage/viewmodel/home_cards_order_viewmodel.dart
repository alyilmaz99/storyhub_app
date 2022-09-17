import 'package:flutter/cupertino.dart';

import '../view/CardPAge.dart';
import '../view/HomeCardsOrder.dart';
import '../view/tappedCard.dart';

abstract class HomeCardsOrderViewModel extends State<HomeCardsOrder> {
  Map<int, String> ImageList = {
    1: "assets/images/cards/front.png",
    2: "assets/images/cards/back.png",
  };

  String? RandomImageFunction(Map<int, String> imageList) {
    var values = imageList.values.toList()..shuffle();
    return imageList[0];
  }

  TappedCard newCard = TappedCard(
    assetImageCardBack: "assets/images/cards/CardBack.png",
    assetImageCardFront: "assets/images/cards/card2.png",
    routeToPage: CardPage(assetImageCardBack: "assets/images/CardBack.png",assetImageCardFront: "assets/images/cards/card2.png"),
  );

  TappedCard newCard2 = TappedCard(
    assetImageCardBack: "assets/images/cards/CardBack.png",
    assetImageCardFront: "assets/images/cards/card2.png",
    routeToPage: CardPage(assetImageCardBack: "assets/images/cards/CardBack.png",assetImageCardFront: "assets/images/cards/card2.png"),
  );

  TappedCard newCard3 = TappedCard(
    assetImageCardBack: "assets/images/cards/CardBack.png",
    assetImageCardFront: "assets/images/cards/card3.png",
    routeToPage: CardPage(assetImageCardBack: "assets/images/cards/CardBack.png",assetImageCardFront: "assets/images/cards/card3.png"),
  );
}