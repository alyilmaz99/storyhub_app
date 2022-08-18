import 'package:flutter/material.dart';

class GameScreenCard extends StatelessWidget {
  const GameScreenCard({Key? key, this.childWidget, this.myShape, this.myColor, this.myElevation}) : super(key: key);
  final Widget? childWidget;
  final RoundedRectangleBorder? myShape;
  final Color? myColor;
  final double? myElevation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: myElevation,
      color: myColor,
      shape: myShape,
      child: childWidget,
    );
  }
}
