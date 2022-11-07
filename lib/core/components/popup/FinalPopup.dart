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
        child: Column(children: const [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 15),
            child: Text(
              'HİKAYENİN SON ZİNCİRİ EKLENEREK HİKAYE TAMAMLANIR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GamerStation',
                letterSpacing: 1.2,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
