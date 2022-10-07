import 'package:flutter/material.dart';
import 'package:storyhub/core/Service/SenaryoServise.dart';

import '../../../../core/Service/CardService.dart';
import '../view/CardPAge.dart';
import '../view/tappedCard.dart';

abstract class CartPageViewModel extends State<CardPage> {
  late TappedCard newCard;
  String? assetImageCardBack;
  String? assetImageCardFront;
  bool isLoaded = false;
  CardService cardService = CardService();
  SenaryoService senaryoService = SenaryoService();

  CartPageViewModel({
    Key? key,
  });

  void loadCards(Function callback) async {
    await cardService.initCards();
    await senaryoService.initSenaryolar();

    setState(() {
      var cards = cardService.getCards();

      newCard = cardService.createTappedCards(cards, callback);
      isLoaded = true;
    });
  }
}
