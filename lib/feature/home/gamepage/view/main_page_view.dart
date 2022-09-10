import 'package:flutter/material.dart';

import '../../../settings/view/game_settings_view.dart';
import '../../howtopage/view/how_to_page_view.dart';
import 'about_us_view.dart';
import '../../../drawer/viewmodel/drawer_viewmodel.dart';
import '../../../drawer/view/drawer_view.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 20),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(FullScreenModal());
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35,
                        )),
                  ],
                ),
                const SizedBox(height: 100),
                Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildIcon(),
                          const SizedBox(height: 70),
                          buildFirstButton(),
                          const SizedBox(height: 10),
                          buildSecondButton(),
                          const SizedBox(height: 10),
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
    return SizedBox(
      width: 300.0,
      height: 50.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GameSettingsView()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(217, 82, 4, 0.9)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
        child: const Text(
          "Giriş",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildSecondButton() {
    return SizedBox(
      width: 300.0,
      height: 50.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HowToPageView()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(155, 87, 223, 0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
        child: const Text(
          "Nasıl Oynanır?",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildThirdButton() {
    return SizedBox(
      width: 300.0,
      height: 50.0,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutUsView()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(155, 87, 223, 0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
        child: const Text(
          "Hakkımızda",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return IconButton(
      icon: Image.asset("assets/images/LogoV1.png"),
      iconSize: 100,
      onPressed: () {},
    );
  }
}
