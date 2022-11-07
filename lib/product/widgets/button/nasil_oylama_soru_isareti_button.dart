import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/button_sound.dart';

class NasilOylamaSoruIsaretiButton extends StatelessWidget {
  const NasilOylamaSoruIsaretiButton(
      {Key? key, required this.myHeight, required this.myWidth})
      : super(key: key);
  final double myHeight;
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    //Button//sound //sound = Button//sound();
    return GestureDetector(
      onTap: () {
        //sound.playButton//sound(context);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color.fromRGBO(143, 85, 203, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                content: SizedBox(
                  height: myHeight,
                  width: myWidth,
                  child: Column(
                    children: const [
                      Spacer(),
                      Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            "ARKADAŞLARINI YILDIZLAYARAK EN İYİ ANLATICIYI SEÇ", //Nasıl Oynanır?//
                            maxLines: 20,
                            style: TextStyle(
                              fontFamily: 'GamerStation',
                              letterSpacing: 1.2,
                              fontSize: 20,
                              color: Colors.white,
                            )),
                      ),
                      Spacer(), //Nasıl Oynanır?
                    ],
                  ),
                ),
              );
            });
      },
      child: SvgPicture.asset("assets/images/question.svg", width: 25),
    );
  }
}
