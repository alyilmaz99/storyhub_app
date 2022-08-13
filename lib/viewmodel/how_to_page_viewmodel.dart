import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyhub/const/how_to_const.dart';
import 'package:storyhub/view/how_to_detail_view.dart';
import 'package:storyhub/view/how_to_page_view.dart';

abstract class HowToPageViewModal extends State<HowToPageView> {
  void pushFuntion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HowToDetailView()),
    );
  }

  static const List<HowToModal> details = <HowToModal>[
    HowToModal(
        title: "Oyun Kuralları", icon: Icons.rule, body: HowToConst.gameRule1),
  ];
}

class HowToModal {
  const HowToModal({
    required this.title,
    required this.icon,
    required this.body,
  });

  final String title;
  final IconData icon;
  final String body;
}
