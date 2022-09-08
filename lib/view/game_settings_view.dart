import 'dart:developer';
import 'package:flutter/material.dart';
import '../viewmodel/game_settings_viewmodel.dart';
import 'selectscenarioview.dart';

import 'package:provider/provider.dart';
import 'package:storyhub/model/game_settings_model.dart';

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
    var sizedBoxHeight = screenHeight / 40;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight / 20,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/LogoV1.png'),
                ),
              )
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
                height: sizedBoxHeight,
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
                height: sizedBoxHeight,
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
                            child: Image(
                              image: AssetImage('assets/images/human1.png'),
                              fit: BoxFit.cover,
                              height: screenHeight / 10,
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
                                  Container(
                                      width: screenWidth / 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                            '${Provider.of<GameSettingsModel>(context).playerCount.toString()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: 'GamerStation',
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
                                      )),
                                ],
                              )),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: sizedBoxHeight,
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
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Süre",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: ' (sn.)',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                              Container(
                                  width: screenWidth / 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              .decrementTimerValue();
                                        },
                                      ),
                                      Text(
                                        '${Provider.of<GameSettingsModel>(context).timerValue.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'GamerStation',
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
                                              .incrementTimerValue();
                                        },
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: sizedBoxHeight,
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
                              Text("Tur Sayısı",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)),
                              Container(
                                  width: screenWidth / 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              .decrementRoundCount();
                                        },
                                      ),
                                      Text(
                                        '${Provider.of<GameSettingsModel>(context).roundCount.toString()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'GamerStation',
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
                                              .incrementRoundCount();
                                        },
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: sizedBoxHeight,
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
                          height: screenHeight / 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: screenHeight / 20,
                                padding: EdgeInsets.only(
                                  left: screenWidth / 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Zorluk",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    "Zorluk Seviyesi"),
                                                content: const Text(
                                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"),
                                                actions: [
                                                  TextButton(
                                                    child: const Text("Tamam"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: screenWidth / 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.chevron_left,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          Provider.of<GameSettingsModel>(
                                                  context,
                                                  listen: false)
                                              .decrementRoundSpeedValue();
                                        },
                                      ),
                                      Text(
                                        '${roundSpeedName(Provider.of<GameSettingsModel>(context).roundSpeedValue)}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'GamerStation',
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
                                          Provider.of<GameSettingsModel>(
                                                  context,
                                                  listen: false)
                                              .incrementRoundSpeedValue();
                                        },
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 19, 6, 45)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: screenWidth / 2.2,
                      height: screenHeight / 30,
                      alignment: Alignment.center,
                      child: Text(
                        "Başla",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'GamerStation',
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
