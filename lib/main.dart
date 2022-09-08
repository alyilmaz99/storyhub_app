import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/view/HomeCardsOrder.dart';
import 'package:storyhub/view/about_us_view.dart';
import 'package:storyhub/view/game_page_view.dart';
import 'package:storyhub/view/game_settings_view.dart';
import 'package:storyhub/view/selectscenarioview.dart';
import 'package:storyhub/view/settings_page_view.dart';
import 'package:storyhub/view/stats_page_view.dart';
import 'package:storyhub/view/tappedCard.dart';
import 'package:flutter/services.dart';
import 'package:storyhub/view/tappedCard.dart';

import 'model/game_settings_model.dart';
import 'model/settings_model.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Color.fromARGB(0, 189, 189, 189),
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      //title: 'Flutter Demo',
      home: GameSettingsView(),
    );
  }
}
