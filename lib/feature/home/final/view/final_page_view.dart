import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:storyhub/core/components/popup/FinalPopup.dart';
import 'package:storyhub/feature/settings/model/settings_model.dart';

class FinalPageView extends StatefulWidget {
  const FinalPageView({Key? key}) : super(key: key);

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPageView> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight / 20,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/LogoV1.png'),
                ),
              )
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(radius: 1, colors: [
              // Color.fromARGB(255, 61, 16, 91),
              // Color.fromARGB(255, 36, 10, 63),
              // Color.fromARGB(255, 19, 6, 45),
              // Color.fromARGB(255, 13, 5, 38),
              Color.fromARGB(255, 59, 52, 114),
              Color.fromARGB(255, 59, 52, 114),
              Color.fromARGB(255, 42, 37, 80),
              Color.fromARGB(255, 37, 29, 58)
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CircleAvatar(
                    radius: screenHeight / 15,
                    backgroundImage:
                        AssetImage('assets/images/human/human1.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth / 5,
                        child: IconButton(
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(context)
                                  .modalBarrierDismissLabel,
                              barrierColor: Colors.black.withOpacity(0.5),
                              pageBuilder: (context, animation1, animation2) =>
                                  FinalPopup(),
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
                      Container(
                        width: (screenWidth / 5) * 2,
                        height: screenHeight / 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "isim",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        width: screenWidth / 5,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 30),
                          ),
                          onPressed: () {},
                          child: Container(
                            child: Icon(
                              Icons.shuffle_outlined,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: screenHeight / 30),
                    primary: false,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/human/human1.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight / 10),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 23, 12, 51)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 30,
                    alignment: Alignment.center,
                    child: Text(
                      "FİNALE BAĞLA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'GamerStation',
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )));
  }
}
