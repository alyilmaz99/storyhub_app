// ignore_for_file: prefer_const_constructors

import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/view/selectscenarioview.dart';

import 'drawer_page_view.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
        backgroundColor: Color.fromRGBO(15, 61, 62, 1.0),
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
              padding: EdgeInsets.only(left: 25, right: 25),
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
                    offset: Offset(0, 3),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: (screenWidth / 1.001) / 5.8,
                    width: (screenWidth / 1.001) / 5.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: screenHeight / 9),
              width: screenWidth / 1.1,
              height: screenHeight / 8,
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(50),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                "OYUNCU",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: screenWidth / 2.2,
              height: screenWidth / 2.2,
              margin: EdgeInsets.only(top: screenHeight / 9),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "SÜRE",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "25",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 80),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Container(
                  width: screenWidth / 4,
                  height: screenWidth / 4,
                  margin: EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 3),
                        blurRadius: 7,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "TUR",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 50),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawerChild: DrawerPage(),
    );
  }
}
