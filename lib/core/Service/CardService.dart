import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../feature/home/gamepage/view/CardPAge.dart';
import '../../feature/home/gamepage/view/tappedCard.dart';
import '../components/card/CardGame.dart';

class CardService {

  var jsonst;
  late List<CardGame> _cards;
  bool isLoadedCards = false;

  List<CardGame> get cards => _cards;
  set cards(List<CardGame> cards) {
    _cards = cards;
  }

  static final CardService _cardService= CardService._internal();

  CardService._internal();

  factory CardService() {
    return _cardService;
  }

  Future<bool> initCards() async {
    jsonst = await rootBundle.loadString('assets/cards.json');

    Iterable iterateCards = json.decode(jsonst);
    cards = List<CardGame>.from(iterateCards.map((model)=> CardGame.fromJson(model)));

    isLoadedCards = true;

    return true;
  }

  List<CardGame> getCards() {
    if(cards.isEmpty)
      {
        initCards();
      }

    return cards;
  }

  TappedCard createTappedCards(List<CardGame> cardsParam){
    final _random = new Random();
    var cardFront = cardsParam[_random.nextInt(cardsParam.length)];

    String backCardImageUrl = cardsParam.firstWhere((element) => element.cardNumber == 7).imageUrl;

    TappedCard newTappedCard = TappedCard(
      assetImageCardBack: "assets/images/cards/" + backCardImageUrl,
      assetImageCardFront: "assets/images/cards/"+ cardFront.imageUrl,
      routeToPage: CardPage(assetImageCardBack: "assets/images/"+ backCardImageUrl,assetImageCardFront: "assets/images/cards/"+ cardFront.imageUrl),
      callback: () => {},
    );

    return newTappedCard;
  }


}