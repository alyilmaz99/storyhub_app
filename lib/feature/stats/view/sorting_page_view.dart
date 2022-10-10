import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storyhub/feature/stats/viewmodel/sorting_page_viewmodel.dart';

class SortingPageView extends SortingPageViewModel {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              Color.fromARGB(255, 253, 163, 133),
              Color.fromRGBO(216, 91, 47, 1),
            ],
            radius: 0.7,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 13),
                    child: SizedBox(
                      // height: screenHeight / 10,
                      width: screenWidth / 4,
                      child: Image.asset(
                        'assets/images/LogoV1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            Text(
              'SIRALAMA',
              style: TextStyle(
                fontFamily: 'GamerStation',
                fontSize: 40,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(0, 5.0),
                    blurRadius: 6.0,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(context, const Color.fromRGBO(255, 221, 85, 1),
                'assets/images/profiles/1.png', 'assets/images/first.png'),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(context, const Color.fromRGBO(220, 229, 246, 1),
                'assets/images/profiles/2.png', 'assets/images/second.png'),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(context, const Color.fromRGBO(232, 93, 70, 1),
                'assets/images/profiles/3.png', 'assets/images/third.png'),
            SizedBox(
              height: screenHeight / 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  minimumSize: Size(screenWidth / 1.7, screenHeight / 15),
                  primary: const Color.fromRGBO(216, 91, 47, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: const Text(
                'SIRALAMA TABLOSU',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
