import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';
import 'package:storyhub/feature/stats/viewmodel/sorting_table_viewmodel.dart';

import '../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../home/voteScreen/model/vote_model.dart';
import '../../settings/model/game_settings_model.dart';

class SortingTableView extends StatefulWidget {
  const SortingTableView({super.key});

  @override
  State<SortingTableView> createState() => _SortingTableViewState();
}

class _SortingTableViewState extends State<SortingTableView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              Color.fromARGB(255, 253, 163, 133),
              Color.fromRGBO(216, 91, 47, 1),
            ],
            radius: 0.7,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 13),
                    child: SizedBox(
                      // height: screenHeight / 10,
                      width: screenWidth / 3,
                      height: screenHeight / 10,
                      child: SvgPicture.asset(
                        'assets/images/LogoV1.svg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 40,
            ),
            Scrollbar(
              radius: const Radius.circular(20.0),
              thumbVisibility: true,
              thickness: 5,
              child: SizedBox(
                height: screenHeight / 1.6,
                width: screenWidth / 1.05,
                child: ListView.builder(
                  itemCount:
                      Provider.of<GameSettingsModel>(context).playerCount,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: screenHeight / 40, left: screenHeight / 40),
                      child: buildContainers(
                          context,
                          Provider.of<Vote>(context, listen: false)
                              .playerList3[index]
                              .image,
                          'assets/images/third.png',
                          index),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Vote>(context, listen: false).playerList.clear();
                Provider.of<Vote>(context, listen: false).playerList2.clear();
                Provider.of<Vote>(context, listen: false).playerScores.clear();
                Provider.of<Vote>(context, listen: false).playerList3.clear();
                Provider.of<Vote>(context, listen: false).valueChanged.clear();
                Provider.of<PlayerCarouselViewModel>(context, listen: false)
                    .playerList
                    .clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainPage()),
                    (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(143, 85, 203, 1),
                  backgroundColor: const Color.fromRGBO(143, 85, 203, 1),
                  elevation: 5,
                  minimumSize: Size(
                    screenWidth / 1.6,
                    screenHeight / 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: const Text(
                'YENİ OYUN',
                style: TextStyle(
                    fontFamily: 'GamerStation',
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
