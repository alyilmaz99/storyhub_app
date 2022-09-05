import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/model/settings_model.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: screenWidth / 20,
                    left: screenWidth / 15,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(radius: 1, colors: [
              Color.fromARGB(255, 61, 16, 91),
              Color.fromARGB(255, 36, 10, 63),
              Color.fromARGB(255, 19, 6, 45),
              Color.fromARGB(255, 13, 5, 38)
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight / 10,
                ),
                const Text(
                  "Ayarlar",
                  style: TextStyle(
                      fontFamily: 'GamerStation', fontSize: 35, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                SizedBox(
                  height: screenHeight / 15,
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbColor: Color.fromARGB(255, 255, 188, 165),
                    activeTrackColor: Color.fromARGB(255, 255, 188, 165),
                    inactiveTrackColor: Color.fromARGB(206, 255, 187, 165),
                    trackHeight: 3.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth / 1.2,
                        child: const Text(
                          "Oyun Sesi",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.volume_off,
                            color: Color.fromARGB(255, 255, 188, 165),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: screenWidth / 1.5,
                            child: Slider(
                              max: 1.0,
                              min: 0.0,
                              divisions: 100,
                              value: Provider.of<SettingsModel>(context).gameVolumeVal,
                              onChanged: (value) {
                                Provider.of<SettingsModel>(context, listen: false).setGameVolumeVal(value);
                              },
                            ),
                          ),
                          const Icon(
                            Icons.volume_up,
                            color: Color.fromARGB(255, 255, 188, 165),
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
                  data: const SliderThemeData(
                      thumbColor: Color.fromARGB(255, 255, 188, 165),
                      activeTrackColor: Color.fromARGB(255, 255, 188, 165),
                      inactiveTrackColor: Color.fromARGB(206, 255, 187, 165),
                      trackHeight: 3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth / 1.2,
                        child: const Text(
                          "Buton Sesi",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.volume_off,
                            color: Color.fromARGB(255, 255, 188, 165),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: screenWidth / 1.5,
                            child: Slider(
                              max: 1.0,
                              min: 0.0,
                              divisions: 100,
                              value: Provider.of<SettingsModel>(context).buttonVolumeVal,
                              onChanged: (value) {
                                Provider.of<SettingsModel>(context, listen: false).setButtonVolumeVal(value);
                              },
                            ),
                          ),
                          const Icon(
                            Icons.volume_up,
                            color: Color.fromARGB(255, 255, 188, 165),
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

                SizedBox(
                  height: screenHeight / 60,
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbColor: Color.fromARGB(255, 255, 188, 165),
                    activeTrackColor: Color.fromARGB(255, 255, 188, 165),
                    inactiveTrackColor: Color.fromARGB(206, 255, 187, 165),
                    trackHeight: 3.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth / 1.2,
                        child: const Text(
                          "Arka Plan Müziği",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 80,
                      ),
                      SizedBox(
                        width: screenWidth / 1.2,
                        child: Text(
                          Provider.of<SettingsModel>(context).bgMusicName,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 1.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.skip_previous_outlined,
                              color: Color.fromARGB(255, 255, 188, 165),
                              size: 40.0,
                            ),
                            Container(
                                width: screenWidth / 3,
                                decoration: BoxDecoration(
                                    gradient: const RadialGradient(radius: 1, colors: [
                                      Color.fromARGB(255, 255, 210, 194),
                                      Color.fromARGB(255, 255, 149, 113)
                                    ]),
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: const Color.fromARGB(255, 255, 188, 165)),
                                child: const Icon(
                                  Icons.play_circle_outline_outlined,
                                  color: Colors.white,
                                  size: 40.0,
                                )),
                            const Icon(
                              Icons.skip_next_outlined,
                              color: Color.fromARGB(255, 255, 188, 165),
                              size: 40.0,
                            ),
                          ],
                        ),
                      ), // Müzik kontroller
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.volume_off,
                            color: Color.fromARGB(255, 255, 188, 165),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: screenWidth / 1.5,
                            child: Slider(
                              max: 1.0,
                              min: 0.0,
                              divisions: 100,
                              value: Provider.of<SettingsModel>(context).bgMusicVolumeVal,
                              onChanged: (value) {
                                Provider.of<SettingsModel>(context, listen: false).setBgMusicVolumeVal(value);
                              },
                            ),
                          ),
                          const Icon(
                            Icons.volume_up,
                            color: Color.fromARGB(255, 255, 188, 165),
                            size: 30.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ), // Arka plan müziği
                SizedBox(
                  height: screenHeight / 60,
                ),

                SizedBox(
                  height: screenHeight / 20,
                ),
                SizedBox(
                  width: screenWidth / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dil Ayarları",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) => {Provider.of<SettingsModel>(context, listen: false).setLanguage(value)},
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        icon: const Icon(
                          Icons.language,
                          color: Color.fromARGB(255, 255, 188, 165),
                          size: 40.0,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: "TR",
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("TR"),
                                    Container(
                                      child: Flag.fromCode(
                                        FlagsCode.TR,
                                        height: 25,
                                        width: 25,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          PopupMenuItem(
                            value: "EN",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("EN"),
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
                            value: "DE",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("DE"),
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
                            value: "FR",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("FR"),
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
                        offset: const Offset(0, 100),
                        color: Colors.grey,
                        elevation: 2,
                      ),
                    ],
                  ),
                ), // Ses kontroller
              ],
            )));
  }
}
