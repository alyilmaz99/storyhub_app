import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storyhub/viewmodel/how_to_page_viewmodel.dart';

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
      backgroundColor: Color.fromRGBO(15, 61, 62, 1.0),
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
                  "Oyun Kuralları",
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
                  "Oyuncu Sayısı",
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
                  "Kart Detayları ",
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
                  "Puanlama Sistemi",
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
                  "Nasıl Oynanır?",
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
