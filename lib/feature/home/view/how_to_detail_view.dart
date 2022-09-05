// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/viewmodel/how_to_detail_viewmodel.dart';

class HowToDetailView extends StatefulWidget {
  String title;
  String body;
  IconData icons;
  HowToDetailView({
    Key? key,
    required this.title,
    required this.body,
    required this.icons,
  }) : super(key: key);

  @override
  State<HowToDetailView> createState() => _HowToDetailViewState(title2: title, body2: body, icons2: icons);
}

class _HowToDetailViewState extends HowToDetailViewModel {
  String title2;
  String body2;
  IconData icons2;
  _HowToDetailViewState({required this.title2, required this.body2, required this.icons2})
      : super(title: title2, body: body2, icons: icons2);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            Container(
                padding: EdgeInsets.only(
                  right: screenWidth / 10,
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight / 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        icons2,
                        size: screenWidth / 7,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 10,
                    ),
                    Text(
                      title2,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    body2,
                    style: TextStyle(
                      fontSize: screenWidth / 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
