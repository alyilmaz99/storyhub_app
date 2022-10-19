import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:storyhub/feature/auth/howtoplay/how_to_play_view.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../../../core/const/text_const/textconst.dart';
import '../../../auth/splashscreen/view/splashscreenview.dart';
import '../view/main_page_view.dart';

import '../../../settings/view/game_settings_view.dart';
import '../../howtopage/view/how_to_page_view.dart';

abstract class MainPageViewModel extends State<MainPage> {
  Widget buildFirstButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 12,
      child: OutlinedButton(
        onPressed: () {
          Provider.of<PlayerCarouselViewModel>(context, listen: false)
              .useForTourCountChechk = 1;
          Provider.of<PlayerCarouselViewModel>(context, listen: false)
              .countTour = 1;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GameSettingsView()));
        },
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(0, 0, 0, 1),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(217, 82, 4, 1)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: const Text(
          "Giriş",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  Widget buildSecondButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 17,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HowToPlayView()));
        },
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(155, 87, 223, 0.5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
        ),
        child: const Text(
          "Nasıl Oynanır?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    return const Text(
      "HİKAYE YARATMA ZAMANI!",
      style: TextStyle(
        fontSize: 19,
        fontFamily: "GamerStation",
        color: Colors.white,
      ),
    );
  }

  Widget buildIcon() {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/images/LogoV1.svg',
      ),
      iconSize: 150,
      onPressed: () {},
    );
  }
}
