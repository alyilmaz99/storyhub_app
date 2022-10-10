import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/components/senaryo/Senaryo.dart';
import 'package:storyhub/feature/home/afterScenarioPage/view/after_scenario_page_view.dart';
import 'package:storyhub/feature/home/scenario/model/select_scenerio_model.dart';

class DisplayScenario extends StatefulWidget {
  @override
  State<DisplayScenario> createState() => _DisplayScenario();
}

class _DisplayScenario extends State<DisplayScenario> {
  Future<List<Senaryo>> readJsonData() async {
    final jsondata = await rootBundle.loadString("assets/senaryolar.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Senaryo.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  Color.fromRGBO(59, 52, 114, 1),
                  Color.fromRGBO(42, 37, 80, 1),
                  Color.fromRGBO(37, 29, 58, 1),
                ],
                radius: 1,
                tileMode: TileMode.clamp),
          ),
          child: Column(children: [
            const SizedBox(height: 30),
            Center(
              child: IconButton(
                icon: Image.asset("assets/images/LogoV1.png"),
                iconSize: 100,
                onPressed: () {},
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / (1.3),
              //decoration: BoxDecoration(

              //borderRadius: BorderRadius.circular(15),
              //color: Color.fromRGBO(47, 13, 75, 1)),

              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AfterScenarioView()));
                  },
                  child: FutureBuilder(
                      future: readJsonData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var scenarioList = snapshot.data as List<Senaryo>;
                          List.generate(scenarioList.length, (index) => index);
                          return Card(
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 6,
                              margin: const EdgeInsets.all(12),
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/cards/emptycard.png"),
                                              fit: BoxFit.cover)),
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        padding: const EdgeInsets.all(12),
                                        child: Consumer<SelectScenarioModel>(
                                            builder: (context, value, child) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    9,
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    scenarioList[
                                                            value.getIndex()]
                                                        .senaryoText,
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        fontFamily:
                                                            "GamerStation",
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 35),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      scenarioList[
                                                              value.getIndex()]
                                                          .longText,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                      ))));
                        } else {
                          return Container();
                        }
                      })),
            ),
          ])),
    );
  }
}
