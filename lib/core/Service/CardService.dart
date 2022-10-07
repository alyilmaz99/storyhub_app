import 'dart:convert';
// import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../feature/home/gamepage/view/CardPAge.dart';
import '../../feature/home/gamepage/view/tappedCard.dart';
import '../components/card/CardGame.dart';
import '../components/senaryo/Senaryo.dart';

class CardService {
  var jsonst;
  var jsonst2;
  late List<CardGame> _cards;
  late List<Senaryo> _senaryolar;
  bool isLoadedCards = false;

  List<CardGame> get cards => _cards;
  set cards(List<CardGame> cards) {
    _cards = cards;
  }

  List<Senaryo> get senaryolar => _senaryolar;
  set senaryolar(List<Senaryo> senaryolar) {
    _senaryolar = senaryolar;
  }

  static final CardService _cardService = CardService._internal();

  CardService._internal();

  factory CardService() {
    return _cardService;
  }

  Future<bool> initCards() async {
    jsonst = await rootBundle.loadString('assets/cards.json');

    Iterable iterateCards = json.decode(jsonst);
    cards = List<CardGame>.from(
        iterateCards.map((model) => CardGame.fromJson(model)));

    isLoadedCards = true;

    return true;
  }

  List<CardGame> getCards() {
    if (cards.isEmpty) {
      initCards();
    }

    return cards;
  }

  Future<CardGame> randomCard(List<Senaryo> scenariosParam, int percentTip1, int percentTip2, int otherTips)
  async {

    String nameCard = scenariosParam[0].tip1![0] != null ? scenariosParam[1].tip1![0] : "asa.png" ;

    // isLoadedCards = true;

    //
    // var tagsJson = jsonDecode(arrayText)['tags'];
    // List<String> tags = tagsJson != null ? List.from(tagsJson) : null;

    return new CardGame("bos", true, nameCard);
  }

  TappedCard randomScenaricCards(List<Senaryo> scenariosParam, Function callback, int level, String difficulty) {
    // final _random = new Random();
    // var cardFront = scenariosParam[_random.nextInt(scenariosParam.length)];

    CardGame cardGame;

    if(level == 1)
      cardGame = randomCard(scenariosParam, 55,30,15) as CardGame;
    else if(level == 2)
      cardGame = randomCard(scenariosParam, 40, 40, 20) as CardGame;
    else if(level == 3)
      cardGame = randomCard(scenariosParam, 25, 45, 30) as CardGame;
    else if(level == 4)
      cardGame = randomCard(scenariosParam, 10, 40, 50) as CardGame;
    else if(level == 5)
      cardGame = randomCard(scenariosParam, 10, 40, 50) as CardGame;
    else if(level == 6)
      cardGame = randomCard(scenariosParam, 0, 30, 70) as CardGame;
    else if(level == 7)
      cardGame = randomCard(scenariosParam, 0, 10, 90) as CardGame;
    else
      cardGame = randomCard(scenariosParam, 100, 100, 100) as CardGame;

    // String backCardImageUrl =
    //     scenariosParam.firstWhere((element) => element.name == "arka kart").imageUrl;
    String backCardImageUrl = cardGame.imageUrl;

    TappedCard newTappedCard = TappedCard(
      assetImageCardBack: "assets/images/cards/" + backCardImageUrl,
      // assetImageCardFront: "assets/images/cards/" + cardFront.imageUrl,
      assetImageCardFront: "assets/images/cards/" + backCardImageUrl,
      routeToPage: CardPage(),
      callback: callback,
    );

    return newTappedCard;
  }

  TappedCard createTappedCards(List<CardGame> cardsParam, Function callback) {
    final _random = new Random();
    var cardFront = cardsParam[_random.nextInt(cardsParam.length)];

    String backCardImageUrl =
        cardsParam.firstWhere((element) => element.name == "arka kart").imageUrl;

    TappedCard newTappedCard = TappedCard(
      assetImageCardBack: "assets/images/cards/" + backCardImageUrl,
      assetImageCardFront: "assets/images/cards/" + cardFront.imageUrl,
      routeToPage: CardPage(),
      callback: callback,
    );

    return newTappedCard;
  }
}
