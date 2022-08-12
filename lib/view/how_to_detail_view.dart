import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storyhub/const/how_to_const.dart';

class HowToDetailView extends StatelessWidget {
  const HowToDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            Container(
                padding: EdgeInsets.only(
                  left: screenWidth / 10,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            Expanded(child: Container()),
            Container(
                padding: EdgeInsets.only(
                  right: screenWidth / 10,
                ),
                child: Icon(
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
                        Icons.rule,
                        size: screenWidth / 7,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 10,
                    ),
                    const Text(
                      "Oyun Kuralları",
                      style: TextStyle(
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
                    HowToConst.gameRule,
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
