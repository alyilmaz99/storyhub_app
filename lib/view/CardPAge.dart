import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';

import 'drawer_page_view.dart';


class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(15, 61, 62, 1.0),
        body: Column(
          children: [
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
            Expanded(
                  child: SizedBox(
                    width: screenHeight / 2,
                    height: screenHeight / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image:AssetImage("assets/images/front.png"),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                ),
            ),
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
                        "SÜRE",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "15",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
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
                        offset: Offset(0, 3),
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
      );
  }
}