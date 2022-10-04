import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../feature/settings/model/settings_model.dart';

class SettingsPopup extends StatefulWidget {
  @override
  State<SettingsPopup> createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
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
          const Text(
            "Ayarlar",
            style: TextStyle(
                fontFamily: 'GamerStation',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          SizedBox(
            height: screenHeight / 30,
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.white,
              activeTrackColor: Colors.white70,
              inactiveTrackColor: Color.fromARGB(255, 49, 49, 49),
              trackHeight: 3.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 1.2,
                  child: const Text(
                    "Oyun Sesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 49, 49, 49)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_off,
                      color: Color.fromARGB(255, 49, 49, 49),
                      size: 30.0,
                    ),
                    Container(
                      width: screenWidth / 2,
                      child: Slider(
                        max: 1.0,
                        min: 0.0,
                        divisions: 100,
                        value:
                            Provider.of<SettingsModel>(context).gameVolumeVal,
                        onChanged: (value) {
                          Provider.of<SettingsModel>(context, listen: false)
                              .setGameVolumeVal(value);
                        },
                      ),
                    ),
                    Icon(
                      Icons.music_note,
                      color: Color.fromARGB(255, 49, 49, 49),
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
              thumbColor: Colors.white,
              activeTrackColor: Colors.white70,
              inactiveTrackColor: Color.fromARGB(255, 49, 49, 49),
              trackHeight: 3.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth / 1.2,
                  child: const Text(
                    "Buton Sesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 49, 49, 49)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.volume_off,
                      color: Color.fromARGB(255, 49, 49, 49),
                      size: 30.0,
                    ),
                    Container(
                      width: screenWidth / 2,
                      child: Slider(
                        max: 1.0,
                        min: 0.0,
                        divisions: 100,
                        value:
                            Provider.of<SettingsModel>(context).buttonVolumeVal,
                        onChanged: (value) {
                          Provider.of<SettingsModel>(context, listen: false)
                              .setButtonVolumeVal(value);
                        },
                      ),
                    ),
                    Icon(
                      Icons.volume_up,
                      color: Color.fromARGB(255, 49, 49, 49),
                      size: 30.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}


/* Kullanım örneği 

//silinecek
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      pageBuilder: (context, animation1, animation2) =>
                          SettingsPopup(),
                      transitionDuration: Duration(milliseconds: 500),
                      transitionBuilder: (context, a1, a2, widget) {
                        return Transform.scale(
                          scale: a1.value,
                          child: Opacity(
                            opacity: a1.value,
                            child: widget,
                          ),
                        );
                      },
                    );
                  },
                ),

//silinecek

*/