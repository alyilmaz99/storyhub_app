// ignore: file_names
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/components/GameContreller.dart';
import 'package:storyhub/feature/home/final/viewmodel/final_page_viewmodel.dart';
import 'package:storyhub/feature/home/gamepage/view/game_page_w_timer_view.dart';
import '../viewmodel/CartPageViewModel.dart';

class CardPage extends StatefulWidget {
  String? assetImageCardBack;
  String? assetImageCardFront;

  CardPage({
    Key? key,
  }) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends CartPageViewModel {
  _CardPageState({Key? key}) : super();

  Widget? currentPage;
  bool _isCardTurned = false;
  bool _isTimeUp = false;

  @override
  void initState() {
    super.initState();
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

    loadCards(callback);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            colors: [
              Color.fromRGBO(59, 52, 114, 1),
              Color.fromRGBO(42, 37, 80, 1),
              Color.fromRGBO(37, 29, 58, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenWidth / 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 18,
                  top: screenHeight / 10,
                  right: screenWidth / 12),
              child: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Stack(children: [
                          Center(
                            child: Container(
                              width: screenWidth / 4,
                              height: screenHeight / 8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(isFinalRouter(
                                      Provider.of<FinalPageViewModel>(context)
                                          .isFinal)),
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
                                    width: screenWidth / 4,
                                    height: screenHeight / 8,
                                    duration: 3,
                                    fillColor: Colors.red,
                                    ringColor: Colors.green,
                                    strokeWidth: 6,
                                    isTimerTextShown: false,
                                    onComplete: () {
                                      HapticFeedback.lightImpact();
                                      GameContreller().setCancelCard(false);

                                      Future.delayed(
                                        const Duration(seconds: 0),
                                        () {
                                          Navigator.of(context).pushAndRemoveUntil(
                                              PageAnimationTransition(
                                                  page:
                                                      const GamePageWithTimer(),
                                                  pageAnimationType:
                                                      FadeAnimationTransition()),
                                              (Route<dynamic> route) => false);
                                        },
                                      );
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
                              onSurface: Colors.white
                                  .withOpacity(0.38)
                                  .withOpacity(0.38),
                              // disabledBackgroundColor: Colors.white
                              //     .withOpacity(0.38)
                              //     .withOpacity(0.12),
                              // disabledBackgroundColor:
                              //     Colors.white.withOpacity(0.12),
                              minimumSize:
                                  Size(screenWidth / 4, screenHeight / 40)),
                          child: Text(
                            isFinalRouterName(Provider.of<FinalPageViewModel>(
                                    context,
                                    listen: false)
                                .isFinal),
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(19, 6, 5, 1)),
                          ),
                        ),
                      ],
                    ),
                    _isCardTurned == false
                        ? const Text(
                            "Kart Seçimi",
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
            Padding(
              padding: EdgeInsets.only(
                  top: screenWidth / 20, bottom: screenWidth / 20),
              child: SizedBox(
                width: screenWidth / 1.6,
                height: screenHeight / 2,
                child: isLoaded ? newCard : Container(),
              ),
            ),
            /*
              SizedBox(
              height: screenHeight / 10,
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 20,
                    child: _isCardTurned
                        ? ElevatedButton(
                            onPressed: () => {
                                  if (_isTimeUp)
                                    {
                                      GameContreller().setCancelCard(false),
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GamePageWithTimer()),
                                          (Route<dynamic> route) => false),
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
                              "Kartı kullanarak senaryoyu bağla.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(251, 251, 251, 0.9)),
                            ))
                        : const SizedBox()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
