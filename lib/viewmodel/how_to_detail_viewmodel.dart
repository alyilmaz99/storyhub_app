import 'package:flutter/cupertino.dart';
import 'package:storyhub/view/how_to_detail_view.dart';

abstract class HowToDetailViewModel extends State<HowToDetailView> {
  void popFuntion() {
    Navigator.pop(context);
  }

  HowToDetailViewModel(
      {required this.title, required this.icon, required this.body});
  final String title;
  final IconData icon;
  final String body;
}
