import 'package:flutter/material.dart';
import 'package:storyhub/view/HomeCardsOrder.dart';
import 'package:storyhub/view/about_us_view.dart';
import 'package:storyhub/view/game_page_view.dart';
import 'package:storyhub/view/main_page_view.dart';
import 'package:storyhub/view/settings_page_view.dart';
import 'package:storyhub/view/splashscreenview.dart';
import 'package:storyhub/view/stats_page_view.dart';
import 'package:storyhub/view/tappedCard.dart';
import 'package:flutter/services.dart';
import 'package:storyhub/view/game_screen.view.dart';

void main() {
  runApp(const MyApp());
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
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.grey.shade400,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      //title: 'Flutter Demo',

      home: MainPage(),
    );
  }
}
