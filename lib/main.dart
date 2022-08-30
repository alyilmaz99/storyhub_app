import 'package:flutter/material.dart';
import 'package:storyhub/view/CardPAge.dart';
import 'package:storyhub/view/HomeCardsOrder.dart';
import 'package:storyhub/view/splashscreenview.dart';
import 'package:flutter/services.dart';

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

      home: CardPage(),
    );
  }
}
