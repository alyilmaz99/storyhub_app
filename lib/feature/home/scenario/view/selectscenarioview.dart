import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:flutter/services.dart';
import 'package:storyhub/core/Service/SenaryoServise.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import 'package:storyhub/feature/home/gamepage/view/HomeCardsOrder.dart';
import 'package:storyhub/feature/home/scenario/view/displayscenario.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../../../../core/components/senaryo/Senaryo.dart';

class SelectScenarioView extends StatefulWidget {
  const SelectScenarioView({Key? key}) : super(key: key);

  @override
  State<SelectScenarioView> createState() => _SelectScenarioViewState();
}

class _SelectScenarioViewState extends State<SelectScenarioView> {
  String category = "All";

  Future<List<Senaryo>> readJsonData() async {
    final jsondata = await rootBundle.loadString("assets/senaryolar.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Senaryo.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final List<String> titles = [
      "DENİZ ALTI",
      "ŞİRKET",
      "MARS KOLONİSİ",
      "UZAY",
      "BEYAZ SARAY",
      "AHIR",
    ];

    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.red
    ];

    final List<Widget> images = [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/denizalti.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: const Text(
                TextConst.submarineCapsLockTxt,
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sirket.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: const Text(
                TextConst.companyTxt,
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/marskolonisi.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: const Text(
                TextConst.marsColonyTxt,
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/uzay.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: const Text(
                TextConst.spaceTxt,
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/beyazsaray.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: const Text(
                TextConst.whiteHouseTxt,
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ahir.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: const Text(
                TextConst.barnTxt,
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(radius: 1, colors: [
          Color.fromARGB(255, 255, 149, 113),
          Color.fromARGB(255, 216, 91, 47),
          Color.fromARGB(255, 216, 91, 47)
        ])),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(
                  flex: 4,
                ),
                Align(alignment: Alignment.center, child: buildIcon()),
                const Spacer(
                  flex: 2,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: buildIcon1(),
                ),
              ],
            ),
            Row(children: [
              const Spacer(flex: 2),
              const Align(
                alignment: Alignment.center,
                child: Text(TextConst.selectscenarioAppBarTitleText,
                    style: TextStyle(
                        fontFamily: 'GamerStation',
                        letterSpacing: 0.5,
                        fontSize: 25.0,
                        color: Colors.white)
                    //  Theme.of(context).textTheme.bodyLarge?.copyWith(
                    //     letterSpacing: 1.5, fontSize: 25.0, color: Colors.white),
                    ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: buildIcon2(),
              ),
            ]),
            FutureBuilder(
              future: readJsonData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as List<Senaryo>;
                  List<Senaryo> filteredList = snapshot.data as List<Senaryo>;

                  if (category == "Korku") {
                    filteredList = items
                        .where((element) => element.category == "Korku")
                        .toList();
                  } else if (category == 'Eglence') {
                    filteredList = items
                        .where((element) => element.category == "Eglence")
                        .toList();
                  } else if (category == "Fantastik") {
                    filteredList = items
                        .where((element) => element.category == "Fantastik")
                        .toList();
                  } else if (category == "Macera") {
                    filteredList = items
                        .where((element) => element.category == "Macera")
                        .toList();
                  } else if (category == "Dram") {
                    filteredList = items
                        .where((element) => element.category == "Dram")
                        .toList();
                  } else {
                    filteredList = items;
                  }

                  return Expanded(
                    child: Scrollbar(
                        child: GridView.count(
                            physics: const ScrollPhysics(),
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 1,
                            // Generate 100 widgets that display their index in the List.
                            children:
                                List.generate(filteredList.length, (index) {
                              return Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 15.0),
                                child: FlipCard(
                                    front: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/senaryolar/${filteredList[index].senaryoNumber}.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: SizedBox(
                                          width: w / 2.5,
                                          child: OutlinedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color.fromRGBO(
                                                            217, 217, 217, 1)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                18.0)))),
                                            child: Text(
                                              filteredList[index].senaryoText,
                                              style: const TextStyle(
                                                  fontFamily: "GamerStation",
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    back: Stack(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        Positioned(
                                            child: Column(
                                          children: [
                                            const SizedBox(height: 50),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                //titles[index],
                                                filteredList[index]
                                                    .senaryoText
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: "GamerStation"),
                                              ),
                                            ),
                                            const SizedBox(height: 25),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    filteredList[index]
                                                        .shortText,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily:
                                                            "Montserrat")),
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 15.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: SizedBox(
                                                  width: 70,
                                                  height: 40,
                                                  child: FloatingActionButton(
                                                    heroTag: "btn$index",
                                                    splashColor:
                                                        Colors.pink.shade600,
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            232, 114, 73, 1),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DisplayScenario()));
                                                    },
                                                    child: Text(
                                                      TextConst.playTxt,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  1.5,
                                                              fontFamily:
                                                                  "GamerStation"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                      ],
                                    )),
                              ));
                            }))),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Container(
      child: IconButton(
        icon: Image.asset("assets/images/LogoV1.png"),
        iconSize: 100,
        onPressed: () {},
      ),
    );
  }

  Widget buildIcon1() {
    return Container(
      child: IconButton(
        icon: Image.asset("assets/images/Frame.png"),
        iconSize: 50,
        onPressed: () {},
      ),
    );
  }

  Widget buildIcon2() {
    return Container(
      child: IconButton(
        icon: Image.asset("assets/images/Group12.png"),
        iconSize: 50,
        onPressed: () {
          selectCategory();
        },
      ),
    );
  }

  Future<void> selectCategory() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: SimpleDialog(
              insetPadding: EdgeInsets.only(
                  bottom: 2 * (MediaQuery.of(context).size.height / 8),
                  left: (MediaQuery.of(context).size.width / 10)),
              backgroundColor: const Color.fromRGBO(255, 163, 114, 1),
              children: [
                SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        category = "Korku";
                      });
                    },
                    child: Column(children: [
                      Row(children: [
                        const Text(
                          TextConst.horrorSixTxt,
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.abc,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      const Divider()
                    ])),
                SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        category = "Eglence";
                      });
                    },
                    child: Column(
                      children: [
                        Row(children: [
                          const Text(TextConst.funFourTxt,
                              style: TextStyle(
                                  fontFamily: "GamerStation",
                                  color: Colors.white,
                                  fontSize: 20.0)),
                          const Spacer(),
                          const Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.white,
                            size: 40,
                          )
                        ]),
                        const Divider()
                      ],
                    )),
                SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        category = "Fantastik";
                      });
                    },
                    child: Column(children: [
                      Row(children: [
                        const Text(
                          TextConst.fantasticTwoTxt,
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.add_alarm_sharp,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      const Divider()
                    ])),
                SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        category = "Macera";
                      });
                    },
                    child: Column(children: [
                      Row(children: [
                        const Text(
                          TextConst.adventureEightTxt,
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.access_alarm_rounded,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      const Divider()
                    ])),
                SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        category = "Dram";
                      });
                    },
                    child: Column(children: [
                      Row(children: [
                        const Text(
                          TextConst.dramaThreeTxt,
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.accessibility_new_sharp,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                    ])),
              ],
            ),
          );
        });
  }
}
