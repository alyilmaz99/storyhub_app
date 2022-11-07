import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LifeCycleManager extends ChangeNotifier {
  bool showExitWidget = false;

  void didChangeAppLifecycleState(BuildContext context) {
    AppLifecycleState? state;
    if (state == AppLifecycleState.inactive && showExitWidget == false) {
      Provider.of<LifeCycleManager>(context).showExitWidget = true;
      print("applife.inactive");
      showWarning(context);
      Provider.of<LifeCycleManager>(context).showExitWidget = false;
    } else if (state == AppLifecycleState.paused && showExitWidget == false) {
      Provider.of<LifeCycleManager>(context).showExitWidget = true;
      print("applife.paused");
      showWarning(context);
      Provider.of<LifeCycleManager>(context).showExitWidget = false;
    } else {
      Provider.of<LifeCycleManager>(context).showExitWidget = false;
    }
  }
}

Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 143, 85, 203),
          title: const Text(
            "Çıkmak İstediğinizden",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GamerStation',
              fontSize: 20,
            ),
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/exitpopupimage.png"),
                    const Text(
                      "Emin Misiniz?",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GamerStation',
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: const Color.fromRGBO(255, 0, 0, 20),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 4.5, MediaQuery.of(context).size.height / 30),
                        maximumSize:
                            Size(MediaQuery.of(context).size.width / 4.5, MediaQuery.of(context).size.height / 20),
                      ),
                      onPressed: () => exit(0),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          color: Color.fromARGB(255, 143, 85, 203),
                          fontFamily: 'GamerStation',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: const Color.fromRGBO(0, 255, 25, 100),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 4.5, MediaQuery.of(context).size.height / 30),
                        maximumSize:
                            Size(MediaQuery.of(context).size.width / 4.5, MediaQuery.of(context).size.height / 20),
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        "No",
                        style: TextStyle(
                          color: Color.fromARGB(255, 143, 85, 203),
                          fontFamily: 'GamerStation',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
