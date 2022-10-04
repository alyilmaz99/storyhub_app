import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
            title: const Text("Renk Seç"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker(),
                TextButton(
                  child: const Text(
                    "Seç",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            )),
      );
}
