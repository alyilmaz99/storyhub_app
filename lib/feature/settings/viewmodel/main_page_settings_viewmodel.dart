import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';

import '../view/main_page_settings.dart';

abstract class MainPageSettingsViewModel extends State<MainPageSettings> {
  Color color = Colors.red;
  Widget buildColorPicker() => BlockPicker(
      pickerColor: color,
      availableColors: const [
        Colors.red,
        Colors.green,
        Colors.yellowAccent,
        Colors.blue,
        Colors.grey,
        Colors.indigo,
        Colors.deepOrangeAccent,
        Colors.tealAccent,
        Colors.pink,
        Colors.amber,
        Colors.deepPurple,
        Colors.brown
      ],
      onColorChanged: (color) => setState(
            () => this.color = color,
          ));

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text(TextConst.chooseJustColorTxt),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker(),
                TextButton(
                  child: const Text(
                    TextConst.chooseTxt,
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            )),
      );
}
