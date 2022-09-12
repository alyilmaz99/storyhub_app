import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';
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
                playerCount: 1, timerValue: 20, roundSpeedValue: 1)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      home: const MainPage(),
    );
  }
}
