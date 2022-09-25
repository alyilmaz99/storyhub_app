import 'package:flutter/material.dart';
import 'package:storyhub/core/components/container/create_player_page/create_player_container_core.dart';

class CreatePlayerContainer extends CreatePlayerContainerCore {
  // ignore: use_key_in_widget_constructors
  CreatePlayerContainer(
      {required super.containerHeight,
      required super.containerWidth,
      required super.containerColor,
      required super.containerWidget});
  @override
  Widget build(BuildContext context) {
    return CreatePlayerContainer(
      containerColor: const Color.fromRGBO(218, 153, 115, 1),
      containerHeight: 200,
      containerWidget: const Text("dsa"),
      containerWidth: 300,
    );
  }
}
