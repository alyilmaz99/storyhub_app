import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'tappedCard.dart';
import '../viewmodel/home_cards_order_viewmodel.dart';

import 'drawer_page_view.dart';

class HomeCardsOrder extends HomeCardsOrderViewModel {
  HomeCardsOrder({Key? key}) : super(null);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return ElasticDrawer(
      mainColor: Colors.white,
      drawerColor: Colors.white10.withOpacity(0.3),
      markPosition: 0.18,
      mainChild: Scaffold(
        backgroundColor: const Color.fromRGBO(15, 61, 62, 1.0),
        body: Column(
          children: [
            /* Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 40, left: 25),
              child: Icon(
                Icons.menu,
                color: Colors.black87,
                size: 30,
              ),
            ), */
            Container(
              alignment: Alignment.center,
              width: screenWidth / 1.001,
              height: screenHeight / 10,
              padding: const EdgeInsets.only(left: 25, right: 25),
              margin: EdgeInsets.only(
                left: 15,
                top: screenHeight / 18,
                right: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                    child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 160,
                        child: newCard,
                      ),
                      Positioned(
                          left: 50, height: 200, width: 160, child: newCard),
                      Positioned(
                          left: 100, height: 200, width: 160, child: newCard),
                      Positioned(
                          left: 150, height: 200, width: 160, child: newCard),
                    ],
                  ),
                )),
              ),
            ),
            Row(
              children: [
                Container(
                  width: screenWidth / 4,
                  height: screenWidth / 4,
                  margin: const EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 3),
                        blurRadius: 7,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SÜRE",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      const Text(
                        "15",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 50),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: screenHeight / 20),
                  width: screenWidth / 1.9,
                  height: screenHeight / 15,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    borderRadius: BorderRadius.circular(50),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 3),
                        blurRadius: 7,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawerChild: const DrawerPage(),
    );
  }
}
