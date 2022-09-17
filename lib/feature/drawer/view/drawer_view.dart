import 'package:flutter/material.dart';
import 'package:storyhub/feature/drawer/viewmodel/drawer_viewmodel.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';

class FullScreenModal extends DrawerViewModel {
  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight / 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'DURAKLATILDI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
              SizedBox(
                height: screenHeight / 4,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSurface: Colors.white,
                    primary: const Color.fromRGBO(223, 105, 64, 1),
                    minimumSize: Size(screenWidth / 1.8, screenHeight / 14)),
                child: const Text(
                  "DEVAM ET",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GamerStation',
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSurface: Colors.white,
                    primary: const Color.fromRGBO(177, 113, 199, 1),
                    minimumSize: Size(screenWidth / 1.8, screenHeight / 14)),
                child: const Text(
                  "Yeni Oyun",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'GamerStation',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}