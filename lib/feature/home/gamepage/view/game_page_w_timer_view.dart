import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/gamepage/view/CardPAge.dart';

import 'package:storyhub/product/widgets/timer/timer_design.dart';

import '../viewmodel/game_page_w_timer_viewmodel.dart';

import '../../../drawer/view/drawer_view.dart';
import 'HomeCardsOrder.dart';

class GamePageWithTimer extends StatefulWidget {
  const GamePageWithTimer({super.key});

  @override
  State<GamePageWithTimer> createState() => _GamePageWithTimerState();
}

class _GamePageWithTimerState extends GamePageWithTimerViewModel {
  @override
  Widget build(BuildContext context) {
    bool isFinish = false;
    void callback() {
      setState(() {
        isFinish = true;
      });
    }

    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    CountDownController controller = CountDownController();
    TimerDesign timer = TimerDesign(
      myController: controller,
      seconds: 20,
    );

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
                  timer.pauseTimer();
                  //timer.stopEnable1 == false;

                  Navigator.of(context).push(
                      FullScreenModal(controller2: controller, timer: timer));
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
                    SizedBox(
                      height: screenHeight / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                              size: screenWidth / 20,
                            )),
                        crateHeroImage(
                            context,
                            'assets/images/question.png',
                            MediaQuery.of(context).size.width / 6,
                            MediaQuery.of(context).size.height / 12,
                            0.5),
                        SizedBox(
                          width: screenWidth / 23,
                        ),
                        crateHeroImage(
                            context,
                            'assets/images/profiles/2.png',
                            MediaQuery.of(context).size.width / 4,
                            MediaQuery.of(context).size.height / 8,
                            1.0),
                        SizedBox(
                          width: screenWidth / 23,
                        ),
                        crateHeroImage(
                            context,
                            'assets/images/profiles/3.png',
                            MediaQuery.of(context).size.width / 6,
                            MediaQuery.of(context).size.height / 12,
                            0.5),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: screenWidth / 20,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight / 40,
                    ),
                  ],
                ),
              ),
            ),
            timer,
            SizedBox(
              height: screenHeight / 40,
            ),
            buildFirstButton(
              context,
              'SONRAKI',
              MediaQuery.of(context).size.height / 12,
              MediaQuery.of(context).size.width / 1.7,
              timer.myController.isPaused
                  ? const Color.fromRGBO(223, 105, 64, 1).withOpacity(0.9)
                  : const Color.fromRGBO(251, 251, 251, 0.5),
              () {
                if (timer.myController.getTime() == '20') {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardPage(),
                    ),
                  );
                }
              },
              'OYUNCU',
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
