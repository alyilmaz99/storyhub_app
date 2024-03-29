import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../core/components/popup/SettingsPopup.dart';
import 'about_us_view.dart';
import '../viewmodel/main_page_viewmodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends MainPageViewModel {
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 143, 85, 203),
            title: const Text(
              "Çıkmak İstediğinizden",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GamerStation',
                fontSize: 20,
              ),
            ),
            actions: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/exitpopupimage.png"),
                      const Text(
                        "Emin Misiniz?",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GamerStation',
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: const Color.fromRGBO(255, 0, 0, 20),
                          minimumSize: Size(
                              MediaQuery.of(context).size.width / 4.5,
                              MediaQuery.of(context).size.height / 30),
                          maximumSize: Size(
                              MediaQuery.of(context).size.width / 4.5,
                              MediaQuery.of(context).size.height / 20),
                        ),
                        onPressed: () => exit(0),
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            color: Color.fromARGB(255, 143, 85, 203),
                            fontFamily: 'GamerStation',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor:
                              const Color.fromRGBO(0, 255, 25, 100),
                          minimumSize: Size(
                              MediaQuery.of(context).size.width / 4.5,
                              MediaQuery.of(context).size.height / 30),
                          maximumSize: Size(
                              MediaQuery.of(context).size.width / 4.5,
                              MediaQuery.of(context).size.height / 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: Color.fromARGB(255, 143, 85, 203),
                            fontFamily: 'GamerStation',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("Back button pressed1 ");
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  Color.fromRGBO(138, 97, 166, 1),
                  Color.fromRGBO(58, 29, 88, 1),
                  Color.fromRGBO(13, 5, 38, 1),
                ],
                radius: 1,
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 17),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
                        //sound.playButton//sound(context);
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (context, animation1, animation2) =>
                              SettingsPopup(),
                          transitionDuration: const Duration(milliseconds: 250),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        onPressed: () {
                          //sound.playButton//sound(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsView()));
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 35,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildIcon(),
                        const SizedBox(height: 10),
                        buildText(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 8),
                        buildFirstButton(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 15),
                        buildSecondButton(context),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 15),
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: staticAd!.size.width.toDouble(),
                          height: staticAd!.size.height.toDouble(),
                          child: AdWidget(
                            ad: staticAd!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
