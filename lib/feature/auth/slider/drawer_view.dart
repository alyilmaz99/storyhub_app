import 'package:flutter/material.dart';
import '../../drawer/viewmodel/drawer_viewmodel.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'DURAKLATILDI',
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSurface: Colors.white,
                  primary: const Color.fromRGBO(216, 91, 47, 0.7),
                  minimumSize: Size(screenWidth / 1.8, screenHeight / 19)),
              child: const Text(
                "DEVAM ET",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              label: const Text('Close'),
            )
          ],
        ),
      ),
    );
  }
}
