import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../../../core/components/GameContreller.dart';

import 'CardPAge.dart';

class TappedCard extends StatefulWidget {
  Function callback;
  String? assetImageCardBack;
  String? assetImageCardFront;
  Widget? routeToPage;
  TappedCard({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
    required this.routeToPage,
    required this.callback,
  }) : super(key: key);
  @override
  _TappedCardState createState() => _TappedCardState(
      assetImageCardFront: assetImageCardFront,
      routeToPage: routeToPage,
      assetImageCardBack: assetImageCardBack);
}

class _TappedCardState extends State<TappedCard> {
  String? assetImageCardBack;
  String? assetImageCardFront;
  Widget? routeToPage;

  _TappedCardState({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
    required this.routeToPage,
  });

  @override
  Widget build(BuildContext context) {
    bool isFlipped = true;
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,
      flipOnTouch: !(GameContreller().cancelFlipCard),
      onFlipDone: (status) {
        print(status);
        var secondNameForCount = assetImageCardFront!.split('.jpg');
        var testF = secondNameForCount[0].split('assets/images/cards/');
        print(secondNameForCount);
        print(testF);
        GameContreller().setCancelCard(true);
        Provider.of<PlayerCarouselViewModel>(context, listen: false).cardName =
            testF[1].toUpperCase();
        setState(() {});

        // sleep(Duration(seconds:1));
        // await Future.delayed(Duration(seconds: 1))
        if (isFlipped == true) {
          // _navigateToNextScreen(context);
          // Navigator.push(context, ScaleRoute(page: this.routeToPage!));
          widget.callback();

          isFlipped = false;
        } else {
          isFlipped = true;
        }
      },
      front: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
              image: AssetImage(assetImageCardBack!), fit: BoxFit.cover),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
              image: AssetImage(assetImageCardFront!), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
