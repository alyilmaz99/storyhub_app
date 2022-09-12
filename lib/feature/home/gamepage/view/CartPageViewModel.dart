import 'package:flutter/material.dart';

import 'CardPAge.dart';


abstract class CartPageViewModel extends State<CardPage> {

  String? assetImageCardBack;
  String? assetImageCardFront;


  CartPageViewModel({
    Key? key,
    required this.assetImageCardBack,
    required this.assetImageCardFront,
  });
}