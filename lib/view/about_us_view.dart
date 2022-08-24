import 'package:flutter/material.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
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
                const Text(
                  TextConst.ourMailAddress,
                  style: TextStyle(color: Colors.amberAccent),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(FontAwesomeIcons.instagramSquare,
                          color: Colors.white),
                    ),
                    Text(
                      TextConst.ourInstaUserName,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 13.0),
                      child: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                      ),
                    ),
                    Text(
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
