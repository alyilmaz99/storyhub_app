// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:storyhub/core/components/button/normal_button.dart';
import 'package:storyhub/core/components/card/game_screen_card.dart';
import 'package:storyhub/core/components/text/game_screen_card_text.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:storyhub/feature/home/gamepage/viewmodel/game_screen.viewmodel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends GameScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            right: -100,
            child: Transform.translate(
              offset:
                  Offset(translateValueXone.value, translateValueYone.value),
              child: SizedBox(
                height: 300,
                width: 200,
                child: GameScreenCard(
                  myColor: Colors.black,
                  childWidget: Column(
                    children: [
                      GameScreenCardText(
                        myText: TextConst.cardOne,
                        myStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Image.asset("assets/images/kovboy.png"),
                      NormalButton(
                        myFunction: () {
                          setState(() {
                            selectCardone();
                          });
                        },
                        myWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GameScreenCardText(
                                myText: TextConst.buttonText,
                                myTextAlign: TextAlign.center,
                                myStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                    ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 75,
            right: -100,
            child: Transform.translate(
              offset:
                  Offset(translateValueXtwo.value, translateValueYtwo.value),
              child: SizedBox(
                height: 300,
                width: 200,
                child: GameScreenCard(
                  myColor: Colors.grey,
                  childWidget: Column(
                    children: [
                      GameScreenCardText(
                        myText: TextConst.cardOne,
                        myStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Image.asset("assets/images/kovboy.png"),
                      NormalButton(
                        myFunction: () {
                          setState(() {
                            selectCardtwo();
                          });
                        },
                        myWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GameScreenCardText(
                                myText: TextConst.buttonText,
                                myTextAlign: TextAlign.center,
                                myStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                    ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
