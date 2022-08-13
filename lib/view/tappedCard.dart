import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

// class TappedCard extends StatelessWidget {
//   const TappedCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: CardFlip(),
//     );
//   }
// }

class TappedCard extends StatelessWidget {
  const TappedCard({Key? key}) : super(key: key);


  _renderContent(context) {
    return FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                  image:AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover
              ),
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                image:AssetImage("assets/images/front.png"),
                fit: BoxFit.cover
              ),
            ),
          ),
    );
  }

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



