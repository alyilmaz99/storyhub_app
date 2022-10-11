import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/voteScreen/model/vote_model.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';
import 'package:storyhub/feature/stats/viewmodel/sorting_page_viewmodel.dart';

class SortingPageView extends SortingPageViewModel {
  const SortingPageView({super.key});

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
            buildContainer(
              context,
              const Color.fromRGBO(255, 221, 85, 1),
              Provider.of<Vote>(context).showSortingImage(0),
              'assets/images/first.png',
              Provider.of<Vote>(context).showSortingName(0),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(
              context,
              const Color.fromRGBO(220, 229, 246, 1),
              Provider.of<Vote>(context).showSortingImage(1),
              'assets/images/second.png',
              Provider.of<Vote>(context).showSortingName(1),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(
              context,
              const Color.fromRGBO(232, 93, 70, 1),
              Provider.of<Vote>(context).showSortingImage(2),
              'assets/images/third.png',
              Provider.of<Vote>(context).showSortingName(2),
            ),
            SizedBox(
              height: screenHeight / 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: const Color.fromRGBO(216, 91, 47, 1),
                  minimumSize: Size(screenWidth / 1.7, screenHeight / 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: const Text(

                'ANA MENÜ',
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
