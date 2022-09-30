import 'package:flutter/material.dart';

import '../viewmodel/how_to_page_viewmodel.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';

class HowToPageView extends StatefulWidget {
  const HowToPageView({Key? key}) : super(key: key);

  @override
  State<HowToPageView> createState() => _HowToPageViewState();
}

class _HowToPageViewState extends HowToPageViewModal {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 61, 62, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              pageCheck("oyunKuralları");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amberAccent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.rule,
                    size: screenWidth / 5,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 13,
                ),
                const Text(
                  TextConst.howToPageTitleRule,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.amberAccent),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          ElevatedButton(
            onPressed: () {
              pageCheck("oyuncuSayısı");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amberAccent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: screenWidth / 5,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 13,
                ),
                const Text(
                  TextConst.howToPageTitleGamer,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.amberAccent),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          ElevatedButton(
            onPressed: () {
              pageCheck("kartDetayları");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amberAccent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.crop_original_outlined,
                    size: screenWidth / 5,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 13,
                ),
                const Text(
                  TextConst.howToPageTitleDetail,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.amberAccent),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          ElevatedButton(
            onPressed: () {
              pageCheck("puanlamaSistemi");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amberAccent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.star_border_outlined,
                    size: screenWidth / 5,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 35,
                ),
                const Text(
                  TextConst.howToPageTitlePoint,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.amberAccent),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          ElevatedButton(
            onPressed: () {
              pageCheck("nasılOynanır");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amberAccent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.question_mark,
                    size: screenWidth / 5,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 7,
                ),
                const Text(
                  TextConst.howToPageTitlePlay,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.amberAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
