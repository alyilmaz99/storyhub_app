// ignore_for_file: no_logic_in_create_state

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storyhub/const/how_to_const.dart';
import 'package:storyhub/viewmodel/how_to_detail_viewmodel.dart';

class HowToDetailView extends StatefulWidget {
  const HowToDetailView({Key? key}) : super(key: key);

  @override
  State<HowToDetailView> createState() =>
      _HowToDetailViewState(body: '', icon: Icons.abc, title: '');
}

class _HowToDetailViewState extends HowToDetailViewModel {
  _HowToDetailViewState(
      {required super.title, required super.icon, required super.body});

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
                        icon,
                        size: screenWidth / 7,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 10,
                    ),
                    Text(
                      title,
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
                    body,
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
