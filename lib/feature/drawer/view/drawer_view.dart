// ignore_for_file: overridden_fields

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/afterScenarioPage/view/after_scenario_page_view.dart';
import 'package:storyhub/feature/home/final/viewmodel/final_page_viewmodel.dart';
import '../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../viewmodel/drawer_viewmodel.dart';
import '../../home/mainpage/view/main_page_view.dart';

class FullScreenModal extends DrawerViewModel {
  @override
  CountDownController controller2;
  CircularCountDownTimer? timer;
  FullScreenModal({required this.controller2, this.timer});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    /* TimerDesign timer = TimerDesign(
      myController: controller2,
      seconds: 20,
    ); */
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.black12.withOpacity(0.4),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight / 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'DURAKLATILDI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'GamerStation'),
                ),
                SizedBox(
                  height: screenHeight / 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    controller2.resume();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.38),
                      backgroundColor: const Color.fromRGBO(223, 105, 64, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onSurface: Colors.white.withOpacity(0.9),
                      //disabledBackgroundColor: Colors.white.withOpacity(0.9),
                      minimumSize: Size(screenWidth / 1.3, screenHeight / 12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("DEVAM ET",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'GamerStation',
                            color: Colors.white,
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: SizedBox(
                            width: 20,
                            child: Icon(
                              Icons.play_arrow_sharp,
                              color: Colors.white,
                              size: 90,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<FinalPageViewModel>(context, listen: false)
                        .isFinal = false;
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AfterScenarioView()));
                    Provider.of<FinalPageViewModel>(
                      context,
                      listen: false,
                    ).isFinal = false;
                    Provider.of<PlayerCarouselViewModel>(context, listen: false)
                        .countTour = 1;
                    Provider.of<PlayerCarouselViewModel>(context, listen: false)
                        .useForTourCountChechk = 1;
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.38),
                      backgroundColor: const Color.fromRGBO(177, 113, 199, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onSurface: Colors.white,
                      //disabledBackgroundColor: Colors.white,
                      minimumSize: Size(screenWidth / 1.8, screenHeight / 14)),
                  child: const Text(
                    "Sıfırla",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'GamerStation',
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<FinalPageViewModel>(context, listen: false)
                        .isFinal = false;
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.38),
                      backgroundColor: const Color.fromRGBO(177, 113, 199, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onSurface: Colors.white,
                      //disabledBackgroundColor: Colors.white,
                      minimumSize: Size(screenWidth / 1.8, screenHeight / 14)),
                  child: const Text(
                    "Yeni Oyun",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'GamerStation',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
