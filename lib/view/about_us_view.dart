// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storyhub/view/game_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 61, 62, 1.0),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    TextConst.aboutUs,
                    style: TextStyle(color: Colors.amberAccent, fontSize: 25),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    TextConst.aboutUsDetail,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                const Text(
                  TextConst.contactUs,
                  style: TextStyle(color: Colors.amberAccent, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    const url = TextConst.ourMailAddress;
                    launchURL('mailto:url?');
                  },
                  child: const Text(
                    TextConst.ourMailAddress,
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        const url =
                            'https://www.instagram.com/vessac.software/';
                        launchURL(url);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      TextConst.ourInstaUserName,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        const url = 'https://twitter.com/vessac_software';
                        launchURL(url);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "vessac_software",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        const url =
                            'https://www.linkedin.com/company/vessac-software/';
                        launchURL(url);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      TextConst.ourLinkedin,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
