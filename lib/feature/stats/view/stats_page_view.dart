import 'package:flutter/material.dart';

import '../../../core/const/text_const/textconst.dart';
import '../viewmodel/stats_page_viewmodel.dart';

class StatsPageView extends StatefulWidget {
  const StatsPageView({Key? key}) : super(key: key);

  @override
  State<StatsPageView> createState() => _StatsPageViewState();
}

class _StatsPageViewState extends StatsPageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(61, 16, 91, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.white,
                  size: screenWidth / 6,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: screenWidth / 6,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.tour,
                  color: Colors.white,
                  size: screenWidth / 6,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.book,
                  color: Colors.white,
                  size: screenWidth / 6,
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: screenWidth / 6,
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 22,
              ),
              Text(
                TextConst.timeInfo,
                style:
                    TextStyle(fontSize: screenWidth / 12, color: Colors.white),
              ),
              Text(
                " 10 sn",
                style:
                    TextStyle(fontSize: screenWidth / 16, color: Colors.grey),
              ),
              SizedBox(
                height: screenHeight / 13,
              ),
              Text(
                TextConst.gamerInfo,
                style:
                    TextStyle(fontSize: screenWidth / 12, color: Colors.white),
              ),
              Text(
                " 15",
                style:
                    TextStyle(fontSize: screenWidth / 16, color: Colors.grey),
              ),
              SizedBox(
                height: screenHeight / 14,
              ),
              Text(
                TextConst.tourInfo,
                style:
                    TextStyle(fontSize: screenWidth / 12, color: Colors.white),
              ),
              Text(
                " 20 tur",
                style:
                    TextStyle(fontSize: screenWidth / 16, color: Colors.grey),
              ),
              SizedBox(
                height: screenHeight / 14,
              ),
              Text(
                TextConst.scenarioInfo,
                style:
                    TextStyle(fontSize: screenWidth / 12, color: Colors.white),
              ),
              Text(
                "Senaryo 1",
                style:
                    TextStyle(fontSize: screenWidth / 16, color: Colors.grey),
              ),
              SizedBox(
                height: screenHeight / 14,
              ),
              Text(
                TextConst.levelInfo,
                style:
                    TextStyle(fontSize: screenWidth / 12, color: Colors.white),
              ),
              Text(
                "Seviye 3",
                style:
                    TextStyle(fontSize: screenWidth / 16, color: Colors.grey),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      onSurface: Colors.black,
                      primary: const Color.fromRGBO(217, 82, 4, 1),
                      minimumSize: Size(screenWidth / 2, screenHeight / 18)),
                  child: const Text(
                    "Devam Et",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
