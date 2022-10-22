import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NasilOylamaSoruIsaretiButton extends StatelessWidget {
  const NasilOylamaSoruIsaretiButton(
      {Key? key, required this.myHeight, required this.myWidth})
      : super(key: key);
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
                      SvgPicture.asset("assets/images/question.svg"),
                      const Spacer(),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci?", //Nasıl Oynanır?//
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ), //Nasıl Oynanır?
                      const Spacer(),
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
