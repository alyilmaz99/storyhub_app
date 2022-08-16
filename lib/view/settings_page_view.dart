import 'dart:ffi';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flag/flag.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageView> {
  double gameVolumeVal = 0.0;
  double buttonVolumeVal = 0.0;
  double bgMusicVolumeVal = 0.0;
  double colorSetting = 0.0;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight / 10,
          ),
          const Text(
            "Ayarlar",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          SizedBox(
            height: screenHeight / 60,
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.black,
              trackHeight: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 1.5,
                  child: const Text(
                    "Oyun Sesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.volume_off,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    Container(
                      width: screenWidth / 1.5,
                      child: Slider(
                        max: 1.0,
                        min: 0.0,
                        divisions: 100,
                        value: gameVolumeVal,
                        onChanged: (value) {
                          setState(() {
                            gameVolumeVal = value;
                          });
                        },
                      ),
                    ),
                    Icon(
                      Icons.volume_up,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ],
                )
              ],
            ),
          ), // Oyun Sesi
          SizedBox(
            height: screenHeight / 60,
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.black,
              trackHeight: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 1.5,
                  child: const Text(
                    "Buton Sesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.volume_off,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    Container(
                      width: screenWidth / 1.5,
                      child: Slider(
                        max: 1.0,
                        min: 0.0,
                        divisions: 100,
                        value: buttonVolumeVal,
                        onChanged: (value) {
                          setState(() {
                            buttonVolumeVal = value;
                          });
                        },
                      ),
                    ),
                    Icon(
                      Icons.volume_up,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 60,
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.black,
              trackHeight: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 1.5,
                  child: const Text(
                    "Renk Ayarı",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth / 1.1,
                      child: Slider(
                        max: 1.0,
                        min: 0.0,
                        divisions: 100,
                        value: colorSetting,
                        onChanged: (value) {
                          setState(() {
                            colorSetting = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ), // Renk ayarı
          SizedBox(
            height: screenHeight / 60,
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.black,
              trackHeight: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 1.5,
                  child: const Text(
                    "Arka Plan Müziği",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth / 1.1,
                      child: Slider(
                        max: 1.0,
                        min: 0.0,
                        divisions: 100,
                        value: bgMusicVolumeVal,
                        onChanged: (value) {
                          setState(() {
                            bgMusicVolumeVal = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ), // Arka plan müziği
          SizedBox(
            height: screenHeight / 60,
          ),
          Container(
            width: screenWidth / 1.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.skip_previous_outlined,
                  color: Colors.black,
                  size: 40.0,
                ),
                Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.black,
                  size: 40.0,
                ),
                Icon(
                  Icons.skip_next_outlined,
                  color: Colors.black,
                  size: 40.0,
                ),
              ],
            ),
          ), // Müzik kontroller
          SizedBox(
            height: screenHeight / 20,
          ),
          Container(
            width: screenWidth / 1.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dil Ayarları",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                PopupMenuButton<int>(
                  icon: Icon(
                    Icons.language,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TR"),
                          Container(
                            child: Flag.fromCode(
                              FlagsCode.TR,
                              height: 25,
                              width: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("EN"),
                          Container(
                            child: Flag.fromCode(
                              FlagsCode.GB,
                              height: 25,
                              width: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("DE"),
                          Container(
                            child: Flag.fromCode(
                              FlagsCode.DE,
                              height: 25,
                              width: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("FR"),
                          Container(
                            child: Flag.fromCode(
                              FlagsCode.FR,
                              height: 25,
                              width: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  offset: Offset(0, 100),
                  color: Colors.grey,
                  elevation: 2,
                ),
              ],
            ),
          ), // Ses kontroller
        ],
      ),
    );
  }
}
