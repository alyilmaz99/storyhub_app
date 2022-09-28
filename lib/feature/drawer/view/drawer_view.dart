import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/timer/timer_design.dart';
import '../viewmodel/drawer_viewmodel.dart';
import '../../home/mainpage/view/main_page_view.dart';

class FullScreenModal extends DrawerViewModel {
  CountDownController controller2;
  TimerDesign? timer;
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
    TimerDesign timer = TimerDesign(myController: controller2, seconds: 20);
    return Material(
      type: MaterialType.transparency,
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
                ),
              ),
              SizedBox(
                height: screenHeight / 8,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  timer.resumeTimer();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white.withOpacity(0.38),
                    backgroundColor: const Color.fromRGBO(223, 105, 64, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    disabledForegroundColor:
                        Colors.white.withOpacity(0.12).withOpacity(0.38),
                    disabledBackgroundColor:
                        Colors.white.withOpacity(0.12).withOpacity(0.12),
                    minimumSize: Size(screenWidth / 1.8, screenHeight / 14)),
                child: const Text(
                  "DEVAM ET",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GamerStation',
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
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
                    disabledForegroundColor:
                        Colors.white.withOpacity(0.12).withOpacity(0.38),
                    disabledBackgroundColor:
                        Colors.white.withOpacity(0.12).withOpacity(0.12),
                    minimumSize: Size(screenWidth / 1.8, screenHeight / 14)),
                child: const Text(
                  "Yeni Oyun",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GamerStation',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
