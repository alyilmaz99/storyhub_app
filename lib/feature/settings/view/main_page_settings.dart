import 'package:flutter/material.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';

import '../viewmodel/main_page_settings_viewmodel.dart';

class MainPageSettings extends StatefulWidget {
  const MainPageSettings({Key? key}) : super(key: key);

  @override
  State<MainPageSettings> createState() => _MainPageSettingsState();
}

class _MainPageSettingsState extends MainPageSettingsViewModel {
  @override
  Widget build(BuildContext context) {
    double volControl = 50.0;
    double buttonVolControl = 50.0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 61, 62, 1.0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 150, right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                TextConst.soundOfGameTxt,
                style: TextStyle(color: Colors.amberAccent),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                  ),
                  Slider(
                    max: 100.0,
                    min: 0.0,
                    value: volControl,
                    activeColor: Colors.white,
                    inactiveColor: Colors.amberAccent,
                    onChanged: (double i) {
                      setState(() {
                        volControl = i;
                      });
                    },
                  ),
                  const Icon(
                    Icons.volume_off,
                    color: Colors.white,
                  ),
                ],
              ),
              const Text(
                TextConst.soundOfButtonTxt,
                style: TextStyle(color: Colors.amberAccent),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                  ),
                  Slider(
                      label: buttonVolControl.abs().toString(),
                      max: 100.0,
                      min: 0.0,
                      value: buttonVolControl,
                      activeColor: Colors.white,
                      inactiveColor: Colors.amberAccent,
                      onChanged: (double i) {
                        setState(() {
                          buttonVolControl = i;
                        });
                      }),
                  const Icon(
                    Icons.volume_off,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      TextConst.musicTxt,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              ),
              const Text(
                TextConst.colorSettingsTxt,
                style: TextStyle(color: Colors.amberAccent),
              ),
              ElevatedButton(
                onPressed: () => pickColor(context),
                // ignore: deprecated_member_use
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: const Text(
                  TextConst.chooseColorTxt,
                  style: TextStyle(color: Color.fromRGBO(15, 61, 62, 1.0)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
