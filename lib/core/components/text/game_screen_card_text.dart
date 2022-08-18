import 'package:flutter/cupertino.dart';

class GameScreenCardText extends StatelessWidget {
  const GameScreenCardText(
      {Key? key, required this.myText, this.myStyle, this.myTextAlign, this.myMaxLines, this.myOverFlow})
      : super(key: key);
  final String myText;
  final TextStyle? myStyle;
  final TextAlign? myTextAlign;
  final int? myMaxLines;
  final TextOverflow? myOverFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: myStyle,
      textAlign: myTextAlign,
      maxLines: myMaxLines,
      overflow: myOverFlow,
    );
  }
}
