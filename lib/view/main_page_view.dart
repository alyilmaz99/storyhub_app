import 'package:flutter/material.dart';
import 'package:storyhub/view/HomeCardsOrder.dart';
import 'package:storyhub/view/about_us_view.dart';
import 'package:storyhub/view/game_settings_view.dart';
import 'package:storyhub/view/how_to_page_view.dart';
import 'package:storyhub/view/main_page_settings.dart';
import 'package:storyhub/view/selectscenarioview.dart';
import 'package:storyhub/view/settings_page_view.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(Object context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20),
        Column(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            IconButton(onPressed: () {}, icon: Icon(Icons.border_all_rounded))
          ],
        ),
        SizedBox(height: 100),
        Column(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: 150),
                  SizedBox(height: 50),
                  buildFirstButton(),
                  buildSecondButton(),
                  buildThirdButton()
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget buildFirstButton() {
    return Container(
      width: 300.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GameSettingsView()));
        },
        child: Container(
          child: Text("Oyna"),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
        ),
      ),
    );
  }

  Widget buildSecondButton() {
    return Container(
      width: 300.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HowToPageView()));
        },
        child: Container(
          child: Text("Nasıl Oynanır"),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
        ),
      ),
    );
  }

  Widget buildThirdButton() {
    return Container(
      width: 300.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUsView()));
        },
        child: Container(
          child: Text("Hakkımızda"),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
        ),
      ),
    );
  }
}
