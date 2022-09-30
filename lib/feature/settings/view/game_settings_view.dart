import 'package:flutter/material.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:storyhub/feature/home/createplayer/view/create_player_view.dart';
import 'package:storyhub/feature/home/gamepage/view/game_page_w_timer_view.dart';
import '../../home/scenario/view/selectscenarioview.dart';
import 'package:provider/provider.dart';
import '../model/game_settings_model.dart';

import '../../../core/components/popup/DifficultyPopup.dart';

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
              padding: EdgeInsets.only(right: screenWidth / 7),
              height: screenHeight / 17,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/LogoV1.png'),
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            colors: [
              Color.fromRGBO(255, 149, 113, 1),
              Color.fromRGBO(216, 91, 47, 1)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight / 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  TextConst.gameSettingsTxt,
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
                        // Container(
                        //   child: Image(
                        //     image:
                        //         AssetImage('assets/images/human/human1.png'),
                        //     fit: BoxFit.cover,
                        //     height: screenHeight / 10,
                        //   ),
                        // ),
                        SizedBox(
                            width: screenWidth / 1.3,
                            height: screenHeight / 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  TextConst.howToPageTitleGamer,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                    width: screenWidth / 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          onPressed: () {
                                            Provider.of<GameSettingsModel>(
                                                    context,
                                                    listen: false)
                                                .decrementPlayerCount();
                                          },
                                        ),
                                        Text(
                                          Provider.of<GameSettingsModel>(
                                                  context)
                                              .playerCount
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'GamerStation',
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(129, 77, 58, 1),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: Colors.white,
                                            size: 35.0,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 217, 217, 217),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: Column(children: [
                    SizedBox(
                        width: screenWidth / 1.3,
                        height: screenHeight / 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: TextConst.timeTxt,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: TextConst.secondTxt,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                            SizedBox(
                                width: screenWidth / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.white,
                                        size: 35.0,
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
                                        fontSize: 30,
                                        fontFamily: 'GamerStation',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(129, 77, 58, 1),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      onPressed: () {
                                        Provider.of<GameSettingsModel>(context,
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
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 217, 217, 217),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: Column(children: [
                    SizedBox(
                        width: screenWidth / 1.3,
                        height: screenHeight / 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(TextConst.tourInfo,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white)),
                            SizedBox(
                                width: screenWidth / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      onPressed: () {
                                        Provider.of<GameSettingsModel>(context,
                                                listen: false)
                                            .decrementRoundCount();
                                      },
                                    ),
                                    Text(
                                      Provider.of<GameSettingsModel>(context)
                                          .roundCount
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'GamerStation',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(129, 77, 58, 1),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      onPressed: () {
                                        Provider.of<GameSettingsModel>(context,
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
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 217, 217, 217),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: Column(children: [
                    SizedBox(
                        width: screenWidth / 1.3,
                        height: screenHeight / 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: screenHeight / 25,
                              padding: EdgeInsets.only(
                                left: screenWidth / 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    TextConst.difficultyTxt,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.info,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      showGeneralDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        barrierLabel:
                                            MaterialLocalizations.of(context)
                                                .modalBarrierDismissLabel,
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                DifficultyPopup(),
                                        transitionDuration:
                                            const Duration(milliseconds: 250),
                                        transitionBuilder:
                                            (context, a1, a2, widget) {
                                          return Transform.scale(
                                            scale: a1.value,
                                            child: Opacity(
                                              opacity: a1.value,
                                              child: widget,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width: screenWidth / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      icon:
                                          Image.asset('assets/images/left.png'),
                                      onPressed: () {
                                        Provider.of<GameSettingsModel>(context,
                                                listen: false)
                                            .decrementRoundSpeedValue();
                                      },
                                    ),
                                    Text(
                                      roundSpeedName(
                                          Provider.of<GameSettingsModel>(
                                                  context)
                                              .roundSpeedValue),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'GamerStation',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(129, 77, 58, 1),
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 30,
                                      icon: Image.asset(
                                          'assets/images/right.png'),
                                      onPressed: () {
                                        Provider.of<GameSettingsModel>(context,
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
              height: sizedBoxHeight * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 19, 6, 45)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const /*SelectScenarioView*/ SelectScenarioView()));
                  },
                  child: Container(
                    width: screenWidth / 2.2,
                    height: screenHeight / 30,
                    alignment: Alignment.center,
                    child: const Text(
                      TextConst.startCapsLockOffTxt,
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
      ),
    );
  }
}
