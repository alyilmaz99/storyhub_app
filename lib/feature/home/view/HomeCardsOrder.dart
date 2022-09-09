
import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/core/components/GameContreller.dart';
import 'gameTimeVİew.dart';
import 'tappedCard.dart';
import '../viewmodel/home_cards_order_viewmodel.dart';

import 'drawer_page_view.dart';

class HomeCardsOrder extends StatefulWidget {
  const HomeCardsOrder({super.key});

  @override
  State<HomeCardsOrder> createState() => _HomeCardsOrderState();
}

class _HomeCardsOrderState extends HomeCardsOrderViewModel {


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    bool isCardTurned = false;

    return ElasticDrawer(
      mainColor: Colors.white,
      drawerColor: Colors.white10.withOpacity(0.3),
      markPosition: 0.18,
      mainChild: Scaffold(
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
                padding: EdgeInsets.only(left: screenWidth/18,top: screenHeight/25,right: screenWidth/12),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth / 5,
                          height: screenHeight / 10,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/human2.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
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
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            "Kart Seçimi",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: screenWidth/30,left: screenWidth/30),
                  child: Center(
                    child: SizedBox(
                      height: screenHeight/2.0,
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 180,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        children: <Widget>[
                          Container(
                            child: newCard,
                          ),
                          Container(
                            child: newCard2,
                          ),
                          Container(
                            child: newCard3,
                          ),
                          Container(
                            child: newCard,
                          ),
                          Container(
                            child: newCard2,
                          ),
                          Container(
                            child: newCard3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  CountdownTimer(startTimerFrom: 30),
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
      ),
      drawerChild: const DrawerPage(),
    );
  }
}

