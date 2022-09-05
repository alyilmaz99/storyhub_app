import 'package:flutter/material.dart';
import '../viewmodel/game_settings_viewmodel.dart';
import 'selectscenarioview.dart';

class GameSettingsView extends StatefulWidget {
  int startTimer =20;
  @override
  State<GameSettingsView> createState() => _GameSettingsViewState(startTimer);
}

class _GameSettingsViewState extends GameSettingsViewModel {
  _GameSettingsViewState(super.startTime);

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
            children: const [
              Text(
                "Oyun Ayarları",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: screenWidth / 10,
                child: const Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              SizedBox(
                  width: screenWidth / 1.5,
                  height: screenHeight / 8,
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
                        children: const [
                          Icon(
                            Icons.remove_circle_outline,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: screenHeight / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: screenWidth / 10,
                child: const Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              SizedBox(
                  width: screenWidth / 1.5,
                  height: screenHeight / 8,
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
                            ),
                            iconSize: 30.0,
                            onPressed: () {
                              decreaseTimer();
                              print(TimerText());
                            },
                          ),
                          Text(
                            TimerText(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                            ),
                            iconSize: 30.0,
                            onPressed: () {
                              increaseTimer();
                              print(TimerText());
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
              SizedBox(
                width: screenWidth / 10,
                child: const Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              SizedBox(
                  width: screenWidth / 1.5,
                  height: screenHeight / 8,
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
                        children: const [
                          Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          Text(
                            "Hızlı",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                            size: 30.0,
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
              SizedBox(
                width: screenWidth / 10,
                child: const Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              SizedBox(
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
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectScenarioView()));
              },
              child: const Text("START")),
        ],
      ),
    );
  }
}
