// ignore: file_names
import 'package:flutter/material.dart';

import 'gameTimeVİew.dart';
import '../viewmodel/CartPageViewModel.dart';

class CardPage extends StatefulWidget {
  String? assetImageCardBack;
  String? assetImageCardFront;

  CardPage({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
  }) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState(
      assetImageCardBack: this.assetImageCardBack,
      assetImageCardFront: this.assetImageCardFront);
}

class _CardPageState extends CartPageViewModel {
  _CardPageState(
      {required super.assetImageCardBack, required super.assetImageCardFront});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(37, 29, 58, 1),
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            colors: [
              Color.fromRGBO(59, 52, 114, 1),
              Color.fromRGBO(37, 29, 58, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white),
                  onPressed: () {},
                ),
                Container(
                  width: screenWidth / 6,
                  height: screenHeight / 12,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/human/human1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 4,
                  height: screenHeight / 8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/human/human2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 6,
                  height: screenHeight / 12,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/human/human3.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            Card(
              margin: const EdgeInsets.all(10),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              elevation: 5,
              child: Container(
                width: screenWidth / 2,
                height: screenHeight / 2.5,
                child: Image.asset(
                  this.assetImageCardFront!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 30,
            ),
            Row(
              children: [
                CountdownTimer(startTimerFrom: 10, pageText: "CardPage"),
                Container(
                  margin: EdgeInsets.only(bottom: screenHeight / 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onSurface: Colors.white,
                        primary: const Color.fromRGBO(216, 91, 47, 0.7),
                        minimumSize:
                            Size(screenWidth / 1.8, screenHeight / 19)),
                    child: const Text(
                      "İLERİ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
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
