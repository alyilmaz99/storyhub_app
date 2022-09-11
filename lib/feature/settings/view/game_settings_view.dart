import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../model/game_settings_model.dart';

class GameSettingsView extends StatefulWidget {
  const GameSettingsView({Key? key}) : super(key: key);

  @override
  State<GameSettingsView> createState() => _GameSettingsViewState();
}

class _GameSettingsViewState extends State<GameSettingsView> {
  var roundSpeedString = '';
  var diffuciltyValue = 0;

  String roundSpeedName(roundSpeedValue) {
    switch (roundSpeedValue) {
      case 1:
        return 'Yavaş';
      case 2:
        return 'Orta';
      case 3:
        return 'Hızlı';
      default:
        return 'Yavaş';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                  padding: EdgeInsets.only(
                    top: screenWidth / 20,
                    right: screenWidth / 15,
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
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
                children: const [
                  Text(
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
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(50, 217, 217, 217),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth / 10,
                            child: const Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
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
                                          Provider.of<GameSettingsModel>(
                                                  context,
                                                  listen: false)
                                              .decrementPlayerCount();
                                        },
                                      ),
                                      Text(
                                        Provider.of<GameSettingsModel>(context)
                                            .playerCount
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
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
                                          Provider.of<GameSettingsModel>(
                                                  context,
                                                  listen: false)
                                              .incrementPlayerCount();
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
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(50, 217, 217, 217),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: Column(children: [
                      SizedBox(
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
                                      Provider.of<GameSettingsModel>(context,
                                              listen: false)
                                          .decrementTimerValue();
                                    },
                                  ),
                                  Text(
                                    Provider.of<GameSettingsModel>(context)
                                        .timerValue
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 22,
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
                                      Provider.of<GameSettingsModel>(context,
                                              listen: false)
                                          .incrementTimerValue();
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
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(50, 217, 217, 217),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: Column(children: [
                      SizedBox(
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
                                      Provider.of<GameSettingsModel>(context,
                                              listen: false)
                                          .decrementRoundSpeedValue();
                                    },
                                  ),
                                  Text(
                                    roundSpeedName(
                                        Provider.of<GameSettingsModel>(context)
                                            .roundSpeedValue),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 22,
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
                                      Provider.of<GameSettingsModel>(context,
                                              listen: false)
                                          .incrementRoundSpeedValue();
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
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 19, 6, 45),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: const Text(
                      "Başla",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'GamerStation',
                          fontSize: 22,
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
