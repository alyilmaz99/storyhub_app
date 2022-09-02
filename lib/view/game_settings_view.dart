import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:ui';

class GameSettingsView extends StatefulWidget {
  const GameSettingsView({Key? key}) : super(key: key);

  @override
  State<GameSettingsView> createState() => _GameSettingsViewState();
}

class _GameSettingsViewState extends State<GameSettingsView> {
  var playerCount = 1;
  var timerValue = 0;
  var roundSpeedValue = 0;
  var roundSpeedString = '';
  var diffuciltyValue = 0;
  var diffuciltyString = '';

  void incrementPlayerCount() {
    if (playerCount < 4) {
      setState(() {
        playerCount++;
      });
    }
  }

  void decrementPlayerCount() {
    if (playerCount > 1) {
      setState(() {
        playerCount--;
      });
    }
  }

  void incrementTimerValue() {
    if (timerValue <= 60) {
      setState(() {
        timerValue++;
      });
    }
  }

  void decrementTimerValue() {
    if (timerValue > 1) {
      setState(() {
        timerValue--;
      });
    }
  }

  void incrementRoundSpeedValue() {
    if (roundSpeedValue < 3) {
      setState(() {
        roundSpeedValue++;
        roundSpeedName(roundSpeedValue);
      });
    }
  }

  void decrementRoundSpeedValue() {
    if (roundSpeedValue > 1) {
      setState(() {
        roundSpeedValue--;
        roundSpeedName(roundSpeedValue);
      });
    }
  }

  void roundSpeedName(roundSpeedValue) {
    switch (roundSpeedValue) {
      case 1:
        roundSpeedString = 'Yavaş';
        break;

      case 2:
        roundSpeedString = 'Orta';
        break;
      case 3:
        roundSpeedString = 'Hızlı';
        break;
      default:
    }
  }

  void incrementDiffuciltyValue() {
    if (diffuciltyValue < 3) {
      setState(() {
        diffuciltyValue++;
        diffuciltyName(diffuciltyValue);
      });
    }
  }

  void decrementDiffuciltyValue() {
    if (diffuciltyValue > 1) {
      setState(() {
        diffuciltyValue--;
        diffuciltyName(diffuciltyValue);
      });
    }
  }

  void diffuciltyName(diffuciltyValue) {
    switch (diffuciltyValue) {
      case 1:
        diffuciltyString = 'Kolay';
        break;

      case 2:
        diffuciltyString = 'Orta';
        break;
      case 3:
        diffuciltyString = 'Zor';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: screenWidth / 20,
                    left: screenWidth / 15,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(radius: 1, colors: [
            Color.fromARGB(255, 255, 149, 113),
            Color.fromARGB(255, 216, 91, 47),
            Color.fromARGB(255, 216, 91, 47)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Oyun Ayarları",
                    style: TextStyle(
                        fontFamily: 'GamerStation',
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(50, 217, 217, 217),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth / 10,
                            child: Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          Container(
                              width: screenWidth / 1.5,
                              height: screenHeight / 10,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Oyuncu Sayısı",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          decrementPlayerCount();
                                        },
                                      ),
                                      Text(
                                        playerCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          incrementPlayerCount();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(50, 217, 217, 217),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: Column(children: [
                      Container(
                          width: screenWidth / 1.5,
                          height: screenHeight / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Süre",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      decrementTimerValue();
                                    },
                                  ),
                                  Text(
                                    timerValue.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      incrementTimerValue();
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(50, 217, 217, 217),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: Column(children: [
                      Container(
                          width: screenWidth / 1.5,
                          height: screenHeight / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Tur",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      decrementRoundSpeedValue();
                                    },
                                  ),
                                  Text(
                                    roundSpeedString,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      incrementRoundSpeedValue();
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenWidth / 2.2,
                    height: screenHeight / 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 19, 6, 45),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Text(
                      "Başla",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'GamerStation',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
