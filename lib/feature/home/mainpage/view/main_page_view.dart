import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:storyhub/feature/settings/viewmodel/main_page_settings_viewmodel.dart';

import '../../../settings/view/game_settings_view.dart';
import '../../howtopage/view/how_to_page_view.dart';
import '../../gamepage/view/about_us_view.dart';
import '../../../drawer/viewmodel/drawer_viewmodel.dart';
import '../../../drawer/view/drawer_view.dart';
import '../viewmodel/main_page_viewmodel.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends MainPageViewModel {
  double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(center: Alignment.center, colors: [
            Color.fromRGBO(61, 16, 91, 1),
            Color.fromRGBO(19, 6, 45, 1),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Column(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildIcon(),
                      const SizedBox(height: 10),
                      buildText(),
                      SizedBox(height: MediaQuery.of(context).size.height / 8),
                      buildFirstButton(),
                      SizedBox(height: MediaQuery.of(context).size.height / 15),
                      buildSecondButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
