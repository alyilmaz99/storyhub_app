import 'package:flutter/material.dart';
import '../core/const/text_const/textconst.dart';
import '../product/model/game_screen_card_modal.dart';
import '../view/game_screen.view.dart';

abstract class GameScreenViewModel extends State<GameScreen>
    with TickerProviderStateMixin {
  bool isAnimated = false;

  late AnimationController myAnimationControllerone;
  late AnimationController myAnimationControllertwo;
  late AnimationController myAnimationControllerthree;
  late AnimationController myAnimationControllerfour;
  late AnimationController myAnimationControllerfive;
  late AnimationController myAnimationControllersix;

  late Animation<double> translateValueXone;
  late Animation<double> translateValueYone;

  late Animation<double> translateValueXtwo;
  late Animation<double> translateValueYtwo;

  late Animation<double> translateValueXthree;
  late Animation<double> translateValueYthree;

  late Animation<double> translateValueXfour;
  late Animation<double> translateValueYfour;

  late Animation<double> translateValueXfive;
  late Animation<double> translateValueYfive;

  late Animation<double> translateValueXsix;
  late Animation<double> translateValueYsix;

  List<GameScreenCardModel>? myCardList;
  @override
  void initState() {
    super.initState();
    myAnimationControllerone =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    myAnimationControllertwo =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    myAnimationControllerthree =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    myAnimationControllerfour =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    myAnimationControllerfive =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    myAnimationControllersix =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    translateValueXone =
        Tween(begin: 0.0, end: -250.0).animate(myAnimationControllerone)
          ..addListener(() {
            setState(() {});
          });
    translateValueYone =
        Tween(begin: 0.0, end: 100.0).animate(myAnimationControllerone)
          ..addListener(() {
            setState(() {});
          });
    translateValueXtwo =
        Tween(begin: 0.0, end: -250.0).animate(myAnimationControllertwo)
          ..addListener(() {
            setState(() {});
          });
    translateValueYtwo =
        Tween(begin: 0.0, end: 100.0).animate(myAnimationControllertwo)
          ..addListener(() {
            setState(() {});
          });
    translateValueXthree =
        Tween(begin: 0.0, end: -250.0).animate(myAnimationControllerthree)
          ..addListener(() {
            setState(() {});
          });
    translateValueYthree =
        Tween(begin: 0.0, end: 100.0).animate(myAnimationControllerthree)
          ..addListener(() {
            setState(() {});
          });
    translateValueXfour =
        Tween(begin: 0.0, end: -250.0).animate(myAnimationControllerfour)
          ..addListener(() {
            setState(() {});
          });
    translateValueYfour =
        Tween(begin: 0.0, end: 100.0).animate(myAnimationControllerfour)
          ..addListener(() {
            setState(() {});
          });
    translateValueXfive =
        Tween(begin: 0.0, end: -250.0).animate(myAnimationControllerfive)
          ..addListener(() {
            setState(() {});
          });
    translateValueYfive =
        Tween(begin: 0.0, end: 100.0).animate(myAnimationControllerfive)
          ..addListener(() {
            setState(() {});
          });
    translateValueXsix =
        Tween(begin: 0.0, end: -250.0).animate(myAnimationControllersix)
          ..addListener(() {
            setState(() {});
          });
    translateValueYsix =
        Tween(begin: 0.0, end: 100.0).animate(myAnimationControllersix)
          ..addListener(() {
            setState(() {});
          });
  }

  Future<void> selectCardone() async {
    myAnimationControllerone.forward();
  }

  Future<void> selectCardtwo() async {
    myAnimationControllertwo.forward();
  }

  Future<void> selectCardthree() async {
    myAnimationControllerthree.forward();
  }

  Future<void> selectCardfour() async {
    myAnimationControllerfour.forward();
  }

  Future<void> selectCardfive() async {
    myAnimationControllerfive.forward();
  }

  Future<void> selectCardsix() async {
    myAnimationControllersix.forward();
  }

  var card1 = GameScreenCardModel(
      TextConst.cardOne,
      "assets/images/kovboy.png",
      ElevatedButton(
        onPressed: () {},
        child: const Text("SELECT CARD"),
      ));
  var card2 = GameScreenCardModel(
      TextConst.cardOne,
      "assets/images/kovboy.png",
      ElevatedButton(
        onPressed: () {},
        child: const Text("SELECT CARD"),
      ));
  var card3 = GameScreenCardModel(
      TextConst.cardOne,
      "assets/images/kovboy.png",
      ElevatedButton(
        onPressed: () {},
        child: const Text("SELECT CARD"),
      ));
  var card4 = GameScreenCardModel(
      TextConst.cardOne,
      "assets/images/kovboy.png",
      ElevatedButton(
        onPressed: () {},
        child: const Text("SELECT CARD"),
      ));

  Future<List<GameScreenCardModel>?> addItemtoList() async {
    myCardList?.add(card1);
    myCardList?.add(card2);
    myCardList?.add(card3);
    myCardList?.add(card4);
    return myCardList;
  }
}
