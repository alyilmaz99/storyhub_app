// ignore_for_file: file_names, use_key_in_widget_constructors, unused_local_variable

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
      backgroundColor: const Color.fromARGB(255, 143, 85, 203),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SingleChildScrollView(
        child: Column(children: const [
          SizedBox(height: 20),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 15),
            child: Text(
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'GamerStation',
                  color: Colors.white,
                ),
                'ZORLUK SEVİYESİ, OYUN KARTLARI İLE SENARYO ARASINDAKİ İLİŞKİYİ BELİRLER',
                textAlign: TextAlign.center),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
