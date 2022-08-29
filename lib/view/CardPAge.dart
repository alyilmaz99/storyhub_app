import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

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
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.amberAccent,
              ),
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.amberAccent,
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
            Container(
              width: screenWidth / 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/human1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              children: [
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
                  child: const Text(
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
    );
  }
}
