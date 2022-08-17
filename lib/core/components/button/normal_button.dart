import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({Key? key, this.myFunction, this.myWidget, this.myButtonStyle}) : super(key: key);
  final Widget? myWidget;
  final VoidCallback? myFunction;
  final ButtonStyle? myButtonStyle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: myFunction,
      style: myButtonStyle,
      child: myWidget,
    );
  }
}
