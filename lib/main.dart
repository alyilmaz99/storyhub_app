import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storyhub/view/game_page_view.dart';
import 'package:storyhub/view/how_to_detail_view.dart';
import 'package:storyhub/view/how_to_page_view.dart';
import 'package:storyhub/view/selectscenarioview.dart';
import 'package:storyhub/view/sliderinformationview.dart';
import 'package:storyhub/view/splashscreenview.dart';

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
      home: const HowToDetailView(),
    );
  }
}
