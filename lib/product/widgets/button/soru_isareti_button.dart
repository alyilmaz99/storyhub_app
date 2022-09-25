import 'package:flutter/material.dart';

class SoruIsaretiButton extends StatelessWidget {
  const SoruIsaretiButton({Key? key, required this.myHeight, required this.myWidth}) : super(key: key);
  final double myHeight;
  final double myWidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                    children: [
                      const Spacer(),
                      Image.asset('assets/images/oylamanasılyapılır.png'),
                      const Spacer(),
                      Text(
                        "Nasıl Oynanır?", //Nasıl Oynanır?//
                        maxLines: 6,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 20.0,
                              overflow: TextOverflow.ellipsis,
                            ),
                      ), //Nasıl Oynanır?
                      const Spacer(),
                    ],
                  ),
                ),
              );
            });
      },
      child: Image.asset(
        'assets/images/soruisareti.png',
      ),
    );
  }
}
