import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/final/model/player_selection_model.dart';
import 'package:storyhub/feature/home/final/view/final_page_view.dart';
import 'package:storyhub/feature/home/final/viewmodel/final_page_viewmodel.dart';
import 'package:storyhub/feature/home/gamepage/view/HomeCardsOrder.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';
import 'package:storyhub/feature/settings/view/game_settings_view.dart';
import 'package:storyhub/feature/settings/view/settings_page_view.dart';
import 'package:storyhub/feature/settings/viewmodel/game_settings_viewmodel.dart';
import 'feature/settings/model/game_settings_model.dart';
import 'feature/settings/model/settings_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsModel>(
            create: (BuildContext context) => SettingsModel()),
        ChangeNotifierProvider<GameSettingsModel>(
            create: (BuildContext context) => GameSettingsModel(
                playerCount: 2,
                timerValue: 20,
                roundSpeedValue: 1,
                roundCount: 3)),
        ChangeNotifierProvider<FinalPageViewModel>(
            create: (BuildContext context) => FinalPageViewModel(
                playerList: [],
                map: {},
                choosenName: "isim",
                choosenImgPath: "assets/images/blankPerson.jpg")),
        ChangeNotifierProvider<PlayerSelectionModel>(
            create: (BuildContext context) => PlayerSelectionModel(
                imgPath: "assets/images/human/human1.png",
                playerName: "Player 1")),
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
      home: FinalPageView(),
    );
  }
}
