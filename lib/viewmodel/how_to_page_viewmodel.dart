import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/view/how_to_detail_view.dart';
import 'package:storyhub/view/how_to_page_view.dart';

abstract class HowToPageViewModal extends State<HowToPageView> {
  void pushFuntion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HowToDetailView()),
    );
  }
}
