import 'package:flutter/material.dart';
import 'package:storyhub/view/tappedCard.dart';

class HomeCardsOrder extends StatelessWidget {
  const HomeCardsOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.centerStart,
          children: const [
            SizedBox(
                height: 100,
                width: 80,
                child: TappedCard(),
              ),
            Positioned(
              left: 50,
              height: 100,
              width: 80,
              child: TappedCard()
            ),
            Positioned(
              left: 100,
              height: 100,
              width: 80,
              child: TappedCard()
            ),
            Positioned(
              left: 150,
              height: 100,
              width: 80,
              child: TappedCard()
            ),
          ],
        ),
      )
    );

  }
}