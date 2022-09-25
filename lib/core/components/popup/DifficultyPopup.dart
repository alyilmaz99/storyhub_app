import 'package:flutter/material.dart';

class DifficultyPopup extends StatefulWidget {
  @override
  State<DifficultyPopup> createState() => _DifficultyPopupState();
}

class _DifficultyPopupState extends State<DifficultyPopup> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Dialog(
      backgroundColor: Color.fromARGB(255, 143, 85, 203),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 10),
          Text(
            'Zorluk',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'GamerStation',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
                textAlign: TextAlign.center),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 6, 45),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: screenWidth / 4,
                height: screenWidth / 10,
                alignment: Alignment.center,
                child: Text(
                  "Tamam",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'GamerStation',
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
