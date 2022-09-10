import 'package:flutter/material.dart';

import '../../../settings/view/game_settings_view.dart';
import '../../howtopage/view/how_to_page_view.dart';
import 'about_us_view.dart';

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
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Vector.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35,
                        )),
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
                          buildIcon(),
                          SizedBox(height: 70),
                          buildFirstButton(),
                          SizedBox(height: 10),
                          buildSecondButton(),
                          SizedBox(height: 10),
                          buildThirdButton()
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )));
  }

  Widget buildFirstButton() {
    return Container(
      width: 300.0,
      height: 50.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GameSettingsView()));
        },
        child: Container(
          child: Text(
            "Giriş",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(217, 82, 4, 0.9)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
      ),
    );
  }

  Widget buildSecondButton() {
    return Container(
      width: 300.0,
      height: 50.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HowToPageView()));
        },
        child: Container(
            child: Text(
          "Nasıl Oynanır?",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(155, 87, 223, 0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
      ),
    );
  }

  Widget buildThirdButton() {
    return Container(
      width: 300.0,
      height: 50.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUsView()));
        },
        child: Container(
          child: Text(
            "Hakkımızda",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(155, 87, 223, 0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Container(
      child: IconButton(
        icon: Image.asset("assets/images/LogoV1.png"),
        iconSize: 100,
        onPressed: () {},
      ),
    );
  }
}
