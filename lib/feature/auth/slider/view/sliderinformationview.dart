import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:im_animations/main.dart';
import '../../../home/mainpage/view/main_page_view.dart';
import '../viewmodel/sliderinformationviewmodel.dart';

class SliderInformationView extends StatefulWidget {
  const SliderInformationView({Key? key}) : super(key: key);

  @override
  State<SliderInformationView> createState() => _SliderInformationViewState();
}

class _SliderInformationViewState extends SliderInformationViewModel {
  @override
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(center: Alignment.center, colors: [
          Color.fromRGBO(250, 141, 104, 1.0),
          Color.fromRGBO(216, 91, 47, 1),
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: screenWidth / 7),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 13),
                  child: SizedBox(
                    // height: screenHeight / 10,
                    width: screenWidth / 4,
                    child: Image.asset(
                      'assets/images/LogoV1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight / 13,
                  ),
                  child: IconButton(
                    onPressed: endSlide,
                    icon: const ImageIcon(
                        AssetImage("assets/icons/fast_forward_icon.png"),
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight / 25,
          ),
          SizedBox(
              height: screenHeight / 1.5,
              child: PageView.builder(
                  controller: controller,
                  itemCount: OnboardingItems.loadOnboardingItem().length,
                  itemBuilder: (BuildContext context, int index) {
                    OnboardingItem oi =
                        OnboardingItems.loadOnboardingItem()[index];
                    return Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text(
                          oi.title,
                          style: const TextStyle(
                            fontFamily: 'GamerStation',
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: previousSlide,
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            SizedBox(
                                width: screenWidth / 1.7,
                                child: Image.asset(oi.image)),
                            IconButton(
                                onPressed: nextSlide,
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight / 20,
                        ),
                        TextArea(
                            myWidth: screenWidth / 1.2,
                            myHeight: screenWidth / 5,
                            textPadding: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                oi.subtitle,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        index == numPages
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: screenHeight / 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage()),
                                          (Route<dynamic> route) => false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 7,
                                      backgroundColor:
                                          const Color.fromRGBO(91, 49, 134, 1),
                                      shadowColor:
                                          const Color.fromRGBO(91, 49, 134, 1)
                                              .withOpacity(1),
                                      minimumSize: Size(
                                          screenWidth / 1.7, screenHeight / 18),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 12,
                                          top: 7,
                                          right: 12,
                                          bottom: 7),
                                      child: Text(
                                        "OYUNA GEÇ",
                                        style: TextStyle(
                                          fontFamily: 'GamerStation',
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(
                                width: 5,
                                height: 5,
                              ),
                      ],
                    );
                  }))
        ],
      ),
    ));
  }
}
