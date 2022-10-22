import 'package:flutter/material.dart';

class FinalPopup extends StatefulWidget {
  @override
  State<FinalPopup> createState() => _FinalPopupState();
}

class _FinalPopupState extends State<FinalPopup> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 143, 85, 203),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 25),
          const Text(
            'Zinciri Tamamlamak',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GamerStation',
              fontSize: 25,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Text(
              'BİR OYUNCU TÜM HİKAYEYİ FİNALE BAĞLAYARAK SENARYOYU TAMAMLASIN.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(216, 91, 47, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: screenWidth / 4,
                height: screenWidth / 10,
                alignment: Alignment.center,
                child: const Text(
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
