import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/components/playerCarousel/carouselItemView.dart';
import 'package:storyhub/feature/home/final/viewmodel/final_page_viewmodel.dart';
import '../../../../core/components/playerCarousel/playerCarouselView.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../../settings/model/game_settings_model.dart';
import '../viewmodel/game_page_w_timer_viewmodel.dart';
import '../../../drawer/view/drawer_view.dart';

class GamePageWithTimer extends StatefulWidget {
  const GamePageWithTimer({super.key});

  @override
  State<GamePageWithTimer> createState() => _GamePageWithTimerState();
}

class _GamePageWithTimerState extends GamePageWithTimerViewModel {
  bool isFinish = false;
  void callback() {
    setState(() {
      isFinish = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    int userNumber = Provider.of<GameSettingsModel>(context).playerCount;
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(37, 29, 58, 1),
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth / 6,
              height: screenHeight / 16,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                // height: screenHeight / 10,
                width: screenWidth / 4,
                child: Image.asset(
                  'assets/images/LogoV1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Provider.of<PlayerCarouselViewModel>(context, listen: false)
                      .controller2
                      .pause();
                  //timer.stopEnable1 == false;

                  Navigator.of(context).push(FullScreenModal(
                      controller2: Provider.of<PlayerCarouselViewModel>(context,
                              listen: false)
                          .controller2));
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
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
              Color.fromRGBO(42, 37, 80, 1),
              Color.fromRGBO(37, 29, 58, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight / 30,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      Provider.of<PlayerCarouselViewModel>(context,
                              listen: false)
                          .cardName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'GamerStation',
                        fontSize: 20,
                      ),
                    ),
                    isFinalSizedBox(),
                    Provider.of<FinalPageViewModel>(context).isFinal == true
                        ? carouselItem(
                            context,
                            isFinalRouter(
                                Provider.of<FinalPageViewModel>(context)
                                    .isFinal),
                            MediaQuery.of(context).size.width / 4,
                            MediaQuery.of(context).size.height / 8,
                            1.0,
                            isFinalRouterName(
                                Provider.of<FinalPageViewModel>(context)
                                    .isFinal),
                          )
                        : carousel(
                            context, screenHeight, (screenWidth / 5) * 3),
                    SizedBox(
                      height: screenHeight / 70,
                    ),
                  ],
                ),
              ),
            ),
            Stack(children: [
              Center(
                child: SizedBox(
                  height: screenHeight / 2.7,
                  //width: screenHeight /2.2,
                  child: Image.asset(
                    'assets/images/timerlast.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 11.5),
                  child: Consumer<GameSettingsModel>(
                    builder: (context, value, child) {
                      return Center(
                        child: CircularCountDownTimer(
                            controller: Provider.of<PlayerCarouselViewModel>(
                                    context,
                                    listen: false)
                                .controller2,
                            isReverse: true,
                            width: screenWidth * 0.40,
                            height: screenWidth * 0.40,
                            duration: Provider.of<FinalPageViewModel>(context)
                                        .isFinal ==
                                    true
                                ? value.getTimerValue() * 2
                                : value.getTimerValue(),
                            fillColor: Colors.red,
                            ringColor: Colors.green,
                            strokeWidth: 16,
                            textStyle: TextStyle(
                              textBaseline: TextBaseline.alphabetic,
                              color: Colors.white,
                              fontFamily: 'GamerStation',
                              fontSize: screenWidth / 5,
                            ),
                            onChange: (value) {
                              Provider.of<FinalPageViewModel>(context)
                                          .isFinal ==
                                      true
                                  ? halfTimerChechk2(value, callback)
                                  : halfTimerChechk(value, callback);
                            },
                            onComplete: () => {
                                  setState(() {
                                    if (Provider.of<FinalPageViewModel>(
                                      context,
                                      listen: false,
                                    ).isFinal) {
                                      finishGame(isFinish);
                                    } else {
                                      nextPlayerFunctions(isFinish);
                                    }
                                  }),
                                }),
                      );
                    },
                  ),
                ),
              )
            ]),
            SizedBox(
              height: screenHeight / 90,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width / 1.7,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      print(
                        "Tur: ${Provider.of<PlayerCarouselViewModel>(context, listen: false).countTour}",
                      );
                      print(
                        "isFinal: ${Provider.of<FinalPageViewModel>(
                          context,
                          listen: false,
                        ).isFinal}",
                      );
                      print(
                        "Tour game count: ${Provider.of<PlayerCarouselViewModel>(context, listen: false).useForTourCountChechk}",
                      );

                      if (Provider.of<FinalPageViewModel>(
                        context,
                        listen: false,
                      ).isFinal) {
                        finishGame(isFinish);
                      } else {
                        nextPlayerFunctions(isFinish);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isFinish
                        ? const Color.fromRGBO(223, 105, 64, 1)
                        : const Color.fromRGBO(251, 251, 251, 0.4)
                            .withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "SONRAKİ",
                        style: TextStyle(
                            fontFamily: "GamerStation",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(251, 251, 251, 0.9)),
                      ),
                      Text(
                        "OYUNCU",
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: "GamerStation",
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(251, 251, 251, 0.9)),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            Text(
              Provider.of<FinalPageViewModel>(context).isFinal == true
                  ? 'FINAL TURU'
                  : 'TUR ${Provider.of<PlayerCarouselViewModel>(context, listen: false).countTour}',
              style: const TextStyle(
                  fontFamily: 'Montserrat', fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
