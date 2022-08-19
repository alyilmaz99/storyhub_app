import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../viewmodel/stats_page_viewmodel.dart';

class StatsPageView extends StatefulWidget {
  const StatsPageView({Key? key}) : super(key: key);

  @override
  State<StatsPageView> createState() => _StatsPageViewState();
}

class _StatsPageViewState extends StatsPageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(61, 16, 91, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Container(
                  padding: EdgeInsets.only(
                    right: screenWidth / 10,
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
