import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:storyhub/product/widgets/timer/timer_design.dart';

import '../../../../core/components/playerCarousel/playerCarouselView.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../../settings/model/game_settings_model.dart';
import '../viewmodel/game_page_w_timer_viewmodel.dart';
import '../../../drawer/view/drawer_view.dart';
import 'CardPAge.dart';

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
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    CountDownController controller = CountDownController();
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
                width: screenWidth / 4.5,
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
                  controller.pause();
                  //timer.stopEnable1 == false;

                  Navigator.of(context)
                      .push(FullScreenModal(controller2: controller));
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
                    const Text(
                      "MEZAR TASI",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GamerStation',
                        fontSize: 20,
                      ),
                    ),
                    carousel(context, screenHeight, (screenWidth / 5) * 3),
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
                            controller: controller,
                            isReverse: true,
                            width: screenWidth * 0.40,
                            height: screenWidth * 0.40,
                            duration: value.getTimerValue(),
                            fillColor: Colors.red,
                            ringColor: Colors.green,
                            strokeWidth: 16,
                            textStyle: TextStyle(
                              textBaseline: TextBaseline.alphabetic,
                              color: Colors.white,
                              fontFamily: 'GamerStation',
                              fontSize: screenWidth / 5,
                            ),
                            onComplete: () => {
                                  setState(() {
                                    callback();
                                  }),
                                  print(value.getTimerValue()),
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
                    if (isFinish == true) {
                      Provider.of<PlayerCarouselViewModel>(context,
                              listen: false)
                          .carouselNext();
                      Provider.of<PlayerCarouselViewModel>(context,
                              listen: false)
                          .countCheck(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFinish
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
            const Text(
              'TUR 1',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
