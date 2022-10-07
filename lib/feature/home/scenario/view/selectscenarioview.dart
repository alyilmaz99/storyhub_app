import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:flutter/services.dart';
import 'package:storyhub/core/Service/SenaryoServise.dart';
import 'package:storyhub/feature/home/gamepage/view/HomeCardsOrder.dart';
import 'package:storyhub/feature/home/scenario/model/select_scenerio_model.dart';
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
                "DENİZALTI",
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
                "ŞİRKET",
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
                "MARS KOLONİSİ",
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
                "UZAY",
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
                "BEYAZ SARAY",
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
                "AHIR",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: w / 20),
                  child: Align(alignment: Alignment.center, child: buildIcon()),
                ),

                /* Align(
                  alignment: Alignment.centerRight,
                  child: buildIcon1(),
                ),*/
              ],
            ),
            Row(children: [
              const Spacer(flex: 2),
              Align(
                alignment: Alignment.center,
                child: Text("SENARYO SEÇ",
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(0.0, 5.0),
                            blurRadius: 7.0,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                          ),
                        ],
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
                            padding: EdgeInsets.zero,
                            physics: const ScrollPhysics(),
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 1,

                            // Generate 100 widgets that display their index in the List.
                            children:
                                List.generate(filteredList.length, (index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FlipCard(
                                      front: SizedBox(
                                        width: w / 1.2,
                                        height: h / 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/senaryolar/${filteredList[index].senaryoNumber}.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: w / 20),
                                                  child: Container(
                                                    color: const Color.fromRGBO(
                                                        208, 33, 33, 1),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  w / 90,
                                                              vertical:
                                                                  w / 150),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        filteredList[index]
                                                            .category,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              "GamerStation",
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                child: SizedBox(
                                                  width: w / 2.5,
                                                  child: OutlinedButton(
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty.all(
                                                                const Color.fromRGBO(
                                                                    251,
                                                                    251,
                                                                    251,
                                                                    0.6)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        18.0)))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          filteredList[index]
                                                              .senaryoText,
                                                          style: const TextStyle(
                                                              fontFamily:
                                                                  "GamerStation",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      back: SizedBox(
                                        width: w / 1.2,
                                        height: h / 2.8,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: w / 1.2,
                                              height: h / 3,
                                              decoration: const BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                            ),
                                            Positioned(
                                                child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: w / 15),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      //titles[index],
                                                      filteredList[index]
                                                          .senaryoText
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          fontFamily:
                                                              "GamerStation"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: h / 35,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30.0),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        filteredList[index]
                                                            .shortText,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15,
                                                        )),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 30.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: SizedBox(
                                                      width: 70,
                                                      height: 40,
                                                      child:
                                                          FloatingActionButton(
                                                        heroTag: "btn$index",
                                                        splashColor: const Color
                                                                .fromRGBO(
                                                            251, 251, 251, 1),
                                                        backgroundColor:
                                                            const Color
                                                                    .fromRGBO(
                                                                226,
                                                                105,
                                                                63,
                                                                1),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20.0)),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          DisplayScenario()));
                                                          Provider.of<SelectScenarioModel>(
                                                                  context,
                                                                  listen: false)
                                                              .setScenarioIndex(
                                                                  index);
                                                        },
                                                        child: Text(
                                                          "OYNA",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
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
                                        ),
                                      )),
                                ],
                              );
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
    return IconButton(
      icon: Image.asset("assets/images/LogoV1.png"),
      iconSize: 100,
      onPressed: () {},
    );
  }

  Widget buildIcon1() {
    return IconButton(
      icon: Image.asset("assets/images/Frame.png"),
      iconSize: 50,
      onPressed: () {},
    );
  }

  Widget buildIcon2() {
    return IconButton(
      icon: Image.asset("assets/images/Group12.png"),
      iconSize: 50,
      onPressed: () {
        selectCategory();
      },
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
                      Row(children: const [
                        Text(
                          "KORKU - 4",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage('assets/images/icons/icon5.png'),
                          ),
                        ),
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
                        Row(children: const [
                          Text("EĞLENCE - 4 ",
                              style: TextStyle(
                                  fontFamily: "GamerStation",
                                  color: Colors.white,
                                  fontSize: 20.0)),
                          Spacer(),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(
                              image:
                                  AssetImage('assets/images/icons/icon1.png'),
                            ),
                          ),
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
                      Row(children: const [
                        Text(
                          "FANTASTİK - 4",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage('assets/images/icons/icon2.png'),
                          ),
                        ),
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
                      Row(children: const [
                        Text(
                          "MACERA - 4",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage('assets/images/icons/icon3.png'),
                          ),
                        ),
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
                      Row(children: const [
                        Text(
                          "DRAM - 4",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage('assets/images/icons/icon4.png'),
                          ),
                        ),
                      ]),
                    ])),
              ],
            ),
          );
        });
  }
}
