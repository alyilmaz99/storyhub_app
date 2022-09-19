import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storyhub/core/components/card/CardGame.dart';

import '../view/CardPAge.dart';
import '../view/HomeCardsOrder.dart';
import '../view/tappedCard.dart';

abstract class HomeCardsOrderViewModel extends State<HomeCardsOrder> {

  var jsonst;
  late List<CardGame> cards;
  bool isLoadedCards = false;

  late List<TappedCard> tappedCards;

  late TappedCard newCard;
  late TappedCard newCard2;
  late TappedCard newCard3;
  late TappedCard newCard4;
  late TappedCard newCard5;
  late TappedCard newCard6;



  void initCards() async {

    jsonst = await rootBundle.loadString('assets/cards.json');

    setState(() {
      Iterable iterateCards = json.decode(jsonst);
      cards = List<CardGame>.from(iterateCards.map((model)=> CardGame.fromJson(model)));

      newCard = createTappedCards(cards);
      newCard2 = createTappedCards(cards);
      newCard3 = createTappedCards(cards);
      newCard4 = createTappedCards(cards);
      newCard5 = createTappedCards(cards);
      newCard6 = createTappedCards(cards);

      isLoadedCards = true;
    });
  }

  TappedCard createTappedCards(List<CardGame> cardsParam){
    final _random = new Random();
    var cardFront = cardsParam[_random.nextInt(cardsParam.length)];

    String backCardImageUrl = cardsParam.firstWhere((element) => element.cardNumber == 7).imageUrl;

    TappedCard newTappedCard = TappedCard(
      assetImageCardBack: "assets/images/cards/" + backCardImageUrl,
      assetImageCardFront: "assets/images/cards/"+ cardFront.imageUrl,
      routeToPage: CardPage(assetImageCardBack: "assets/images/"+ backCardImageUrl,assetImageCardFront: "assets/images/cards/"+ cardFront.imageUrl),
    );

    return newTappedCard;
  }
}