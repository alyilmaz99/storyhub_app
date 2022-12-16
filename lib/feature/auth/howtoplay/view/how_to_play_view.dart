import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_animations/main.dart';
import '../viewmodel/how_to_play_viewmodel.dart';

import '../../../home/mainpage/view/main_page_view.dart';

class HowToPlayView extends StatefulWidget {
  const HowToPlayView({Key? key}) : super(key: key);

  @override
  State<HowToPlayView> createState() => _HowToPlayViewState();
}

class _HowToPlayViewState extends HowToPlayViewModel {
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
                    width: screenWidth / 3.5,
                    height: screenWidth / 4,
                    child: SvgPicture.asset(
                      'assets/images/LogoV1.svg',
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
                    icon: SvgPicture.asset("assets/icons/fast_forward_icon.svg",
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
                            index == 0
                                ? const SizedBox(
                                    width: 15,
                                  )
                                : IconButton(
                                    onPressed: previousSlide,
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                            index == numPages
                                ? SizedBox(
                                    width: 15,
                                  )
                                : SizedBox(
                                    width: screenWidth / 1.5,
                                    child: Image.asset(oi.image)),
                            index ==
                                    OnboardingItems.loadOnboardingItem()
                                            .length -
                                        1
                                ? const SizedBox(
                                    width: 15,
                                  )
                                : IconButton(
                                    onPressed: nextSlide,
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    )),
                          ],
                        ),
                        TextArea(
                            myWidth: screenWidth / 1.2,
                            textPadding: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                oi.subtitle,
                                style: const TextStyle(
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
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage()));
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
