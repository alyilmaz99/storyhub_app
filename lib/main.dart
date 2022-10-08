import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:storyhub/core/components/playerCarousel/playerCarouselViewModel.dart';
import 'package:storyhub/feature/auth/splashscreen/view/splashscreenview.dart';
import 'package:storyhub/feature/home/afterScenarioPage/view/after_scenario_page_view.dart';

import 'package:storyhub/feature/home/scenario/model/select_scenerio_model.dart';

import 'feature/home/createplayer/model/player_model.dart';
import 'product/model/player_selection_model.dart';
import 'feature/home/final/viewmodel/final_page_viewmodel.dart';
import 'feature/settings/model/game_settings_model.dart';
import 'feature/settings/model/settings_model.dart';

void main() {
  /* GELİŞTİRME İÇİN GEÇİCİ LİSTE
     LİSTE GEREKLİ PARAMETLERE DIŞARIDAN VERİLİNCE BU KALDIRILACAK */
  List<PlayerSelectionModel> tempList = [
    PlayerSelectionModel(
        imgPath: "assets/images/profiles/1.png", playerName: "Player 1"),
    PlayerSelectionModel(
        imgPath: "assets/images/profiles/2.png", playerName: "Player 2"),
    PlayerSelectionModel(
        imgPath: "assets/images/profiles/3.png", playerName: "Player 3"),
  ];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PlayerCarouselViewModel>(
          create: (BuildContext context) => PlayerCarouselViewModel(
            playerList: tempList,
            map: {},
            choosenName: "isim",
            choosenImgPath: "assets/images/blankPerson.jpg",
            index: 0,
            countTour: 1,
          ),
        ),
        ChangeNotifierProvider<SelectScenarioModel>(
          create: (BuildContext context) => SelectScenarioModel(),
        ),
        ChangeNotifierProvider<SettingsModel>(
            create: (BuildContext context) => SettingsModel()),
        ChangeNotifierProvider<GameSettingsModel>(
            create: (BuildContext context) => GameSettingsModel(
                playerCount: 3,
                timerValue: 20,
                roundSpeedValue: 1,
                roundCount: 3)),
        ChangeNotifierProvider<FinalPageViewModel>(
            create: (BuildContext context) => FinalPageViewModel(
                isFinal: false,
                playerList: tempList,
                map: {},
                choosenName: "isim",
                choosenImgPath: "assets/images/blankPerson.jpg")),
        ChangeNotifierProvider<PlayerSelectionModel>(
          create: (BuildContext context) => PlayerSelectionModel(
            imgPath: "assets/images/human/human1.png",
            playerName: "Player 1",
          ),
        ),
        ChangeNotifierProvider<Player>(
          create: (BuildContext context) => Player(
            playerList: [],
            backupPlayersMap: {},
            id: 1,
            image: '',
            name: '',
            playersMap: {},
            rank: 1,
            score: 1,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Color.fromARGB(0, 189, 189, 189),
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: const AfterScenarioView(),
    );
  }
}
