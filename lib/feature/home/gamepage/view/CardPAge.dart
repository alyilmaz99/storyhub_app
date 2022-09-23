// ignore: file_names
import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/gamepage/view/tappedCard.dart';

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
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 18,
                  top: screenHeight / 25,
                  right: screenWidth / 12),
              child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: screenWidth / 5,
                                height: screenHeight / 10,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/human/human3.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onSurface: Colors.white,
                                    primary: const Color.fromRGBO(216, 91, 47, 0.7),
                                    minimumSize:
                                    Size(screenWidth / 4, screenHeight / 40)),
                                child: const Text(
                                  "İsim",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 40,
                        ),
                        Text(
                          "Kart Seçimi",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
              ),
            SizedBox(
              height: screenHeight / 40,
            ),
            Container(
                color: Colors.transparent,
                width: screenWidth / 1.7,
                height: screenHeight / 2.1,
                child: TappedCard(assetImageCardBack: assetImageCardBack, assetImageCardFront: assetImageCardFront, routeToPage: null,)
            ),
            SizedBox(
              height: screenHeight / 30,
            ),
            // Row(
            //   children: [
            //     CountdownTimer(startTimerFrom: 10, pageText: "CardPage"),
            //     Container(
            //       margin: EdgeInsets.only(bottom: screenHeight / 30),
            //       child: ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20),
            //             ),
            //             onSurface: Colors.white,
            //             primary: const Color.fromRGBO(216, 91, 47, 0.7),
            //             minimumSize:
            //                 Size(screenWidth / 1.8, screenHeight / 19)),
            //         child: const Text(
            //           "İLERİ",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
