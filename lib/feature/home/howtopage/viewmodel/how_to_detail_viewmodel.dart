import 'package:flutter/cupertino.dart';

import '../view/how_to_detail_view.dart';

abstract class HowToDetailViewModel extends State<HowToDetailView> {
  String title;
  String body;
  IconData icons;
  void popFuntion() {
    Navigator.pop(context);
  }

  HowToDetailViewModel(
      {required this.title, required this.body, required this.icons});
}
