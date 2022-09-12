import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/mainpage/view/about_us_view.dart';
import 'package:storyhub/product/widgets/container/background_dark_gradient.dart';
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
        decoration: BackgroundDarkGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 35,
                      )),
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
                        Icons.contact_support,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
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
