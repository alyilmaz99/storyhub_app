// ignore: file_names
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/core/components/GameContreller.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:storyhub/feature/home/gamepage/view/game_page_w_timer_view.dart';
import 'package:storyhub/feature/home/gamepage/view/tappedCard.dart';

import '../../scenario/view/selectscenarioview.dart';
import '../viewmodel/CartPageViewModel.dart';

class CardPage extends StatefulWidget {
  String? assetImageCardBack;
  String? assetImageCardFront;

  CardPage({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
  }) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState(
      assetImageCardBack: assetImageCardBack,
      assetImageCardFront: assetImageCardFront);
}

class _CardPageState extends CartPageViewModel {
  _CardPageState(
      {required super.assetImageCardBack, required super.assetImageCardFront});

  Widget? currentPage;
  bool _isCardTurned = false;
  bool _isTimeUp = false;

  @override
  void initState() {
    super.initState();
    TappedCard tappedCard = TappedCard(
      assetImageCardBack: assetImageCardBack,
      assetImageCardFront: assetImageCardFront,
      routeToPage: null,
      callback: () => {callback()},
    );

    currentPage = tappedCard;
  }

  void callback() {
    setState(() {
      _isCardTurned = true;
    });
  }

  void timeUp() {
    setState(() {
      _isTimeUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(37, 29, 58, 1),
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            colors: [
              Color.fromRGBO(59, 52, 114, 1),
              Color.fromRGBO(37, 29, 58, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 18,
                  top: screenHeight / 50,
                  right: screenWidth / 12),
              child: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Stack(children: [
                          Center(
                            child: Container(
                              width: screenWidth / 5,
                              height: screenHeight / 10,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/human/human3.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: _isCardTurned
                                ? CircularCountDownTimer(
                                    autoStart: true,
                                    isReverse: true,
                                    width: screenWidth / 5,
                                    height: screenHeight / 10,
                                    duration: 5,
                                    fillColor: Colors.red,
                                    ringColor: Colors.green,
                                    strokeWidth: 6,
                                    isTimerTextShown: false,
                                    onComplete: () {
                                      setState(() {
                                        timeUp();
                                      });
                                    },
                                  )
                                : Container(),
                          ),
                        ]),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(251, 251, 251, 0.9),
                              disabledForegroundColor: Colors.white
                                  .withOpacity(0.38)
                                  .withOpacity(0.38),
                              disabledBackgroundColor: Colors.white
                                  .withOpacity(0.38)
                                  .withOpacity(0.12),
                              // disabledBackgroundColor:
                              //     Colors.white.withOpacity(0.12),
                              minimumSize:
                                  Size(screenWidth / 4, screenHeight / 40)),
                          child: const Text(
                            TextConst.nameTxt,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(19, 6, 5, 1)),
                          ),
                        ),
                      ],
                    ),
                    _isCardTurned == false
                        ? const Text(
                            TextConst.chooseCardTxt,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.transparent,
                width: screenWidth / 2.1,
                height: screenHeight / 2.6,
                child: currentPage),
            /*  SizedBox(
              height: screenHeight / 30,
            ),*/
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 20,
              child: _isCardTurned
                  ? ElevatedButton(
                      onPressed: () => {
                            if (_isTimeUp)
                              {
                                Navigator.push(context,
                                    ScaleRoute(page: const GamePageWithTimer()))
                              }
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isTimeUp
                            ? const Color.fromRGBO(223, 105, 64, 1)
                            : const Color.fromRGBO(251, 251, 251, 0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                      ),
                      child: const Text(
                        TextConst.scenarioConnectionExpTxt,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(251, 251, 251, 0.9)),
                      ))
                  : const SizedBox(),
            ),
            SizedBox(
              height: screenHeight / 30,
            ),
          ],
        ),
      ),
    );
  }
}
