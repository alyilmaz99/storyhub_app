import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../view/tappedCard.dart';

abstract class HomeCardsOrderViewModel extends StatelessWidget {
  HomeCardsOrderViewModel(Key? key) : super(key: key);
  Map<int, String> ImageList = {
    1: "assets/images/front.png",
    2: "assets/images/back.png",
  };

  String? RandomImageFunction(Map<int, String> imageList) {
    var values = imageList.values.toList()..shuffle();
    return imageList[0];
  }

  TappedCard newCard = TappedCard(
    assetImageCardBack: "assets/images/back.png",
    assetImageCardFront: "assets/images/front.png",
  );
}
