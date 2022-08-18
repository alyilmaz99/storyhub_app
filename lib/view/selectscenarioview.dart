import 'package:flutter/material.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:storyhub/const/textconst.dart';

class SelectScenarioView extends StatefulWidget {
  const SelectScenarioView({Key? key}) : super(key: key);

  @override
  State<SelectScenarioView> createState() => _SelectScenarioViewState();
}

class _SelectScenarioViewState extends State<SelectScenarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade100,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        backgroundColor: Colors.white60,
        centerTitle: true,
        title: Text(
          TextConst.selectscenarioAppBarTitleText,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(letterSpacing: 1.5, fontSize: 25.0, color: Colors.black54),
        ),
      ),
      body: FluidActionCard(
        color1: Colors.white,
        color2: Colors.white60,
        backgroundcolor: Colors.redAccent.shade100,
        borderRadius1: BorderRadius.circular(20),
        borderRadius2: BorderRadius.circular(20),
        height: 400.0,
        width: 240.0,
        CardCount: 6,
        Position: 100.0,
        assetimage: "assets/images/kovboy.png",
        shadow: const BoxShadow(
          color: Colors.black45,
          blurRadius: 10.0,
          spreadRadius: 0.2,
          offset: Offset(0, 3),
        ),
        ontap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.pink.shade600,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          side: BorderSide(
            color: Colors.black45,
            width: 1.5,
          ),
        ),
        onPressed: () {},
        child: Text(
          "OYNA",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black,
                letterSpacing: 1.5,
              ),
        ),
      ),
    );
  }
}
