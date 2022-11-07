import 'package:flutter/material.dart';
import '../../../../core/components/popup/SettingsPopup.dart';
import 'about_us_view.dart';
import '../../../../product/widgets/container/background_dark_gradient.dart';
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
              "Çıkmak İstediğinizden Emin Misiniz?",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GamerStation',
                fontSize: 15,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 1, color: Colors.white.withOpacity(0.5)),
                      ),
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.blueAccent,
                      minimumSize: Size(MediaQuery.of(context).size.width / 4.5,
                          MediaQuery.of(context).size.height / 30),
                      maximumSize: Size(MediaQuery.of(context).size.width / 4.5,
                          MediaQuery.of(context).size.height / 20),
                    ),
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      "No",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 1, color: Colors.white.withOpacity(0.5)),
                      ),
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.red,
                      minimumSize: Size(MediaQuery.of(context).size.width / 4.5,
                          MediaQuery.of(context).size.height / 30),
                      maximumSize: Size(MediaQuery.of(context).size.width / 4.5,
                          MediaQuery.of(context).size.height / 20),
                    ),
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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
              SizedBox(height: MediaQuery.of(context).size.height / 20),
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
