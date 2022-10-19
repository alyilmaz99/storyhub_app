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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black.withOpacity(0.5),
                        pageBuilder: (context, animation1, animation2) =>
                            SettingsPopup(),
                        transitionDuration: Duration(milliseconds: 250),
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
                      SizedBox(height: MediaQuery.of(context).size.height / 8),
                      buildFirstButton(),
                      SizedBox(height: MediaQuery.of(context).size.height / 15),
                      buildSecondButton(context),
                    ],
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
