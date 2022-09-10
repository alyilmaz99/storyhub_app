import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'CardPAge.dart';

class TappedCard extends StatelessWidget {
  String? assetImageCardBack;
  String? assetImageCardFront;
  TappedCard({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
  }) : super(key: key);
  _renderContent(context) {
    bool isFlipped = true;

    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,
      onFlipDone: (status) {
        print(status);

        sleep(Duration(seconds:1));
        // await Future.delayed(Duration(seconds: 1))
        if (isFlipped == true) {
          // _navigateToNextScreen(context);
          Navigator.push(context, ScaleRoute(page: CardPage()));
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
              image: AssetImage(assetImageCardFront!), fit: BoxFit.contain),
        ),
      ),
    );
  }

  // void _navigateToNextScreen(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageRoute()));
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: _renderContent(context),
        ),
      ],
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

// class CardPage extends StatelessWidget {
//   const CardPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 150,
//           height: 200,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(8.0)),
//               image: DecorationImage(
//                   image:AssetImage("assets/images/front.png"),
//                   fit: BoxFit.cover
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PageRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }


