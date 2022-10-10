import 'package:flutter/material.dart';
import 'package:storyhub/feature/stats/viewmodel/sorting_table_viewmodel.dart';

class SortingTableView extends StatefulWidget {
  const SortingTableView({super.key});

  @override
  State<SortingTableView> createState() => _SortingTableViewState();
}

class _SortingTableViewState extends State<SortingTableView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
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
              height: screenHeight / 15,
            ),
            buildContainers(context, 'assets/images/profiles/2.png',
                'assets/images/third.png'),
            SizedBox(
              height: screenHeight / 40,
            ),
            buildContainers(context, 'assets/images/profiles/1.png',
                'assets/images/third.png'),
            SizedBox(
              height: screenHeight / 40,
            ),
            buildContainers(context, 'assets/images/profiles/3.png',
                'assets/images/third.png'),
            SizedBox(
              height: screenHeight / 40,
            ),
            buildContainers(context, 'assets/images/profiles/9.png',
                'assets/images/third.png'),
            SizedBox(
              height: screenHeight / 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  minimumSize: Size(screenWidth / 1.6, screenHeight / 12),
                  onPrimary: const Color.fromRGBO(143, 85, 203, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: const Text(
                'YENİ OYUN',
                style: TextStyle(
                    fontFamily: 'GamerStation',
                    color: Colors.white,
                    fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
