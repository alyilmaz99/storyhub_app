import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:storyhub/view/HomeCardsOrder.dart';
import 'package:storyhub/view/tappedCard.dart';

import 'view/home_page.dart';
=======
import 'package:flutter/services.dart';
import 'package:storyhub/view/game_page_view.dart';
import 'package:storyhub/view/game_settings_view.dart';
import 'package:storyhub/view/how_to_detail_view.dart';
import 'package:storyhub/view/how_to_page_view.dart';
import 'package:storyhub/view/main_page_settings.dart';
import 'package:storyhub/view/selectscenarioview.dart';
import 'package:storyhub/view/settings_page_view.dart';
import 'package:storyhub/view/sliderinformationview.dart';
import 'package:storyhub/view/splashscreenview.dart';
>>>>>>> 23b4c18a148d1c009b0b4c9d2dafbbf3ac5b80cf

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
<<<<<<< HEAD
      title: 'Flutter Demo',
      // home: HomePage(),
      // home: TappedCard(),
      home: HomeCardsOrder(),
=======
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

      home: MainPageSettings(),
>>>>>>> 23b4c18a148d1c009b0b4c9d2dafbbf3ac5b80cf
    );
  }
}
