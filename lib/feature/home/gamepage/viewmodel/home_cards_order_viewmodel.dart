import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/Service/CardService.dart';
import '../../../../core/components/card/CardGame.dart';

import '../view/CardPAge.dart';
import '../view/HomeCardsOrder.dart';
import '../view/tappedCard.dart';

abstract class HomeCardsOrderViewModel extends State<HomeCardsOrder> {
  late TappedCard newCard;
  late TappedCard newCard2;
  late TappedCard newCard3;
  late TappedCard newCard4;
  late TappedCard newCard5;
  late TappedCard newCard6;

  bool isLoaded = false;

  CardService cardService = CardService();

  void loadCards() async {
    await cardService.initCards();
    setState(() {
      var cards = cardService.getCards();
/*
      newCard = cardService.createTappedCards(cards);
      newCard2 = cardService.createTappedCards(cards);
      newCard3 = cardService.createTappedCards(cards);
      newCard4 = cardService.createTappedCards(cards);
      newCard5 = cardService.createTappedCards(cards);
      newCard6 = cardService.createTappedCards(cards);
*/
      isLoaded = true;
    });
  }
}
