import 'package:flutter/cupertino.dart';

class CreatePlayerContainerCore extends StatelessWidget {
  CreatePlayerContainerCore(
      {Key? key,
      required this.containerHeight,
      required this.containerWidth,
      required this.containerColor,
      required this.containerWidget})
      : super(key: key);
  late double containerHeight;
  late double containerWidth;
  late Color containerColor;
  late Widget containerWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      color: containerColor,
      child: containerWidget,
    );
  }
}
