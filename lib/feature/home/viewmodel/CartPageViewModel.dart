import 'package:flutter/material.dart';

import '../view/CardPAge.dart';
import '../view/gameTimeVİew.dart';

abstract class HowToPageViewModal extends State<CardPage> {

  String? assetImageCardBack;
  String? assetImageCardFront;


  HowToPageViewModal({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
  });
}
