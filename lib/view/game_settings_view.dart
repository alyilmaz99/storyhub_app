import 'dart:developer';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Container(
                padding: EdgeInsets.only(
                  right: screenWidth / 10,
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Oyun Ayarları",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth / 10,
                child: Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              Container(
                  width: screenWidth / 1.5,
                  height: screenHeight / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Oyuncu Sayısı",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.black,
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
                                color: Colors.black),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
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
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth / 10,
                child: Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              Container(
                  width: screenWidth / 1.5,
                  height: screenHeight / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Süre",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.black,
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
                                color: Colors.black),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
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
            ],
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth / 10,
                child: Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              Container(
                  width: screenWidth / 1.5,
                  height: screenHeight / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Tur",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.black,
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
                                color: Colors.black),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.black,
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
            ],
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth / 10,
                child: Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              Container(
                  width: screenWidth / 1.5,
                  height: screenHeight / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Zorluk",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              decrementDiffuciltyValue();
                            },
                          ),
                          Text(
                            diffuciltyString,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              incrementDiffuciltyValue();
                            },
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
