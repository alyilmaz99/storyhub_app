import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/Service/CardService.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../final/viewmodel/final_page_viewmodel.dart';
import '../view/CardPAge.dart';
import '../view/tappedCard.dart';

abstract class CartPageViewModel extends State<CardPage> {
  late TappedCard newCard;
  String? assetImageCardBack;
  String? assetImageCardFront;
  bool isLoaded = false;
  CardService cardService = CardService();

  CartPageViewModel({
    Key? key,
  });

  String isFinalRouter(bool isFinal) {
    if (!isFinal) {
      return Provider.of<PlayerCarouselViewModel>(context)
          .playerList[
              Provider.of<PlayerCarouselViewModel>(context).selectedIndex()]
          .imgPath;
    } else {
      return Provider.of<FinalPageViewModel>(context).choosenImgPath;
    }
  }

  String isFinalRouterName(bool isFinal) {
    if (!isFinal) {
      return Provider.of<PlayerCarouselViewModel>(context)
          .playerList[
              Provider.of<PlayerCarouselViewModel>(context).selectedIndex()]
          .playerName;
    } else {
      return Provider.of<FinalPageViewModel>(context).choosenName;
    }
  }

  void loadCards(Function callback) async {
    await cardService.initCards();
    setState(() {
      var cards = cardService.getCards();

      newCard = cardService.createTappedCards(cards, callback);
      isLoaded = true;
    });
  }
}
