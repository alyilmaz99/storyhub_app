// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class BackgroundGradient extends BoxDecoration {
  BackgroundGradient({
    this.alignmentGeometry,
    this.color1,
    this.color2,
  });
  late AlignmentGeometry? alignmentGeometry;
  late Color? color1;
  late Color? color2;

  BoxDecoration build(BuildContext context) {
    return BoxDecoration(
      gradient: RadialGradient(center: alignmentGeometry!, colors: [
        color1!,
        color2!,
      ]),
    );
  }
}
