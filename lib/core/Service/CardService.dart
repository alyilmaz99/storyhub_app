import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../components/playerCarousel/playerCarouselViewModel.dart';
import '../../feature/home/gamepage/view/CardPAge.dart';
import '../../feature/home/gamepage/view/tappedCard.dart';
import '../components/card/CardGame.dart';
import '../components/senaryo/Senaryo.dart';
import 'package:firebase_storage/firebase_storage.dart';

enum Difficulty { kolay, orta, zor, none }

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

  Future<bool> initCardFromFirebase() async {
    Iterable iterateCards = new Iterable.empty();

    final storageRef = FirebaseStorage.instance.ref();
    Reference? pathReference = storageRef.child("cards.json");

    try {
      const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await pathReference.getData(oneMegabyte);
      String dataString = String.fromCharCodes(data ?? []);
      iterateCards = json.decode(dataString);
      // Data for "images/island.jpg" is returned, use this as needed.
    } on FirebaseException catch (e) {
      // Handle any errors.
    }

    // jsonst = await rootBundle.loadString('assets/cards.json');

    cards = List<CardGame>.from(
        iterateCards.map((model) => CardGame.fromJson(model)));

    isLoadedCards = true;

    return true;
  }

  List<CardGame> getCards() {
    if (cards.isEmpty) {
      initCardFromFirebase();
    }

    return cards;
  }

  T randomChoice<T>(Iterable<T> options,
      [Iterable<double> weights = const []]) {
    if (options.isEmpty) {
      throw ArgumentError.value(
          options.toString(), 'options', 'must be non-empty');
    }
    if (weights.isNotEmpty && options.length != weights.length) {
      throw ArgumentError.value(weights.toString(), 'weights',
          'must be empty or match length of options');
    }

    if (weights.isEmpty) {
      return options.elementAt(Random().nextInt(options.length));
    }

    double sum = weights.reduce((val, curr) => val + curr);
    double randomWeight = Random().nextDouble() * sum;

    int i = 0;
    for (int l = options.length; i < l; i++) {
      randomWeight -= weights.elementAt(i);
      if (randomWeight <= 0) {
        break;
      }
    }

    return options.elementAt(i);
  }

  CardGame randomCard(List<Senaryo> scenariosParam, int percentTip1,
      int percentTip2, int otherTips) {
    // String nameCard = scenariosParam[0].tip1![0] != null ? scenariosParam[1].tip1![0] : "asa.jpg" ;
    String nameImageCard = "asa.jpg";

    String selectionrandomCard = randomChoice(['tip1', 'tip2', 'other'],
        [percentTip1 / 100, percentTip2 / 100, otherTips / 100]);

    final _random = Random();
    final _random2 = Random();

    if (selectionrandomCard == 'tip1') {
      int numrandom = _random.nextInt(scenariosParam.length);
      int numrandom2 = _random2.nextInt(scenariosParam[numrandom].tip1.length);
      nameImageCard = scenariosParam[numrandom].tip1[numrandom2];
      // nameImageCard = scenariosParam[numrandom].tip1[numrandom2] != null ? scenariosParam[numrandom].tip1[numrandom2] : "asa.jpg" ;
    }
    if (selectionrandomCard == 'tip2') {
      int numrandom = _random.nextInt(scenariosParam.length);
      int numrandom2 = _random2.nextInt(scenariosParam[numrandom].tip2.length);
      nameImageCard = scenariosParam[numrandom].tip2[numrandom2];
    }
    if (selectionrandomCard == 'other') {
      String selectionrandomCard2 = randomChoice(
          ['tip1', 'tip2'], [percentTip1 / 100, percentTip2 / 100]);
      if (selectionrandomCard2 == 'tip1') {
        int numrandom = _random.nextInt(scenariosParam.length);
        int numrandom2 =
            _random2.nextInt(scenariosParam[numrandom].tip2.length);
        nameImageCard = scenariosParam[numrandom].tip2[numrandom2];
      }
      if (selectionrandomCard2 == 'tip2') {
        int numrandom = _random.nextInt(scenariosParam.length);
        int numrandom2 =
            _random2.nextInt(scenariosParam[numrandom].tip2.length);
        nameImageCard = scenariosParam[numrandom].tip2[numrandom2];
      }
    }

    String nameCard = nameImageCard.replaceAll(RegExp('[.jpg]'), '');
    return CardGame(nameCard, true, nameImageCard);
  }

  TappedCard randomScenaricCards(
      List<Senaryo> scenariosParam,
      Function callback,
      int level,
      Difficulty difficulty,
      BuildContext context) {
    if (difficulty == Difficulty.none) {
      difficulty = Difficulty.kolay;
    }

    CardGame cardGame;

    if (difficulty == Difficulty.kolay) {
      if (level == 1) {
        cardGame = randomCard(scenariosParam, 55, 30, 15);
      } else if (level == 2) {
        cardGame = randomCard(scenariosParam, 20, 50, 30);
      } else if (level == 3) {
        cardGame = randomCard(scenariosParam, 10, 50, 40);
      }
    } else if (difficulty == Difficulty.orta) {
      if (level == 2) {
        cardGame = randomCard(scenariosParam, 20, 50, 30);
      } else if (level == 3) {
        cardGame = randomCard(scenariosParam, 10, 50, 40);
      }
    } else if (difficulty == Difficulty.zor) {
      if (level == 3) {
        cardGame = randomCard(scenariosParam, 10, 50, 40);
      }
    }

    if (level == 3) {
      cardGame = randomCard(scenariosParam, 10, 40, 50);
    } else if (level == 4) {
      cardGame = randomCard(scenariosParam, 5, 30, 65);
    } else if (level == 5) {
      cardGame = randomCard(scenariosParam, 0, 35, 65);
    } else if (level == 6) {
      cardGame = randomCard(scenariosParam, 0, 30, 70);
    } else if (level == 7) {
      cardGame = randomCard(scenariosParam, 0, 10, 90);
    } else {
      cardGame = randomCard(scenariosParam, 100, 100, 100);
    }

    String backCardImageUrl =
        cards.firstWhere((element) => element.name == "arka kart").imageUrl;

    TappedCard newTappedCard = TappedCard(
      assetImageCardBack: "assets/images/cards/$backCardImageUrl",
      assetImageCardFront: "assets/images/cards/${cardGame.imageUrl}",
      routeToPage: CardPage(),
      callback: callback,
    );

    return newTappedCard;
  }

  TappedCard createTappedCards(List<CardGame> cardsParam, Function callback) {
    final _random = Random();
    var cardFront = cardsParam[_random.nextInt(cardsParam.length)];

    String backCardImageUrl = cardsParam
        .firstWhere((element) => element.name == "arka kart")
        .imageUrl;

    TappedCard newTappedCard = TappedCard(
      assetImageCardBack: "assets/images/cards/$backCardImageUrl",
      assetImageCardFront: "assets/images/cards/${cardFront.imageUrl}",
      routeToPage: CardPage(),
      callback: callback,
    );

    return newTappedCard;
  }
}
