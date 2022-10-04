import 'package:flutter/cupertino.dart';
import '../../../core/components/color/background_gradient_core.dart';

class BackgroundDarkGradient extends BackgroundGradient {
  BackgroundDarkGradient({super.alignmentGeometry, super.color1, super.color2});

  @override
  BoxDecoration build(BuildContext context) {
    return const BoxDecoration(
      gradient: RadialGradient(center: Alignment.center, colors: [
        Color.fromRGBO(61, 16, 91, 1),
        Color.fromRGBO(19, 6, 45, 1),
      ]),
    );
  }
}
