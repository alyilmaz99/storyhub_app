import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/components/senaryo/Senaryo.dart';
import '../../afterScenarioPage/view/after_scenario_page_view.dart';

import '../../../../product/model/button_sound.dart';

class DisplayScenario extends StatefulWidget {
  int senaryo;

  DisplayScenario({super.key, required this.senaryo});

  @override
  State<DisplayScenario> createState() => _DisplayScenario();
}

class _DisplayScenario extends State<DisplayScenario> {
  //Button//sound //sound = Button//sound();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/LogoV1.svg',
                ),
                iconSize: 120,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / (1.3),
              child: InkWell(
                onTap: () {
                  //sound.playButton//sound(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AfterScenarioView(),
                    ),
                  );
                },
                child: FutureBuilder(
                  future: readJsonData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var scenarioList = snapshot.data as List<Senaryo>;
                      var scn = scenarioList
                          .where((element) =>
                              element.senaryoNumber == widget.senaryo)
                          .toList();
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
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              alignment: Alignment.bottomRight,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        scn[0].senaryoText,
                                        style: TextStyle(
                                            fontSize: scn[0]
                                                        .senaryoText
                                                        .characters
                                                        .length >
                                                    10
                                                ? 21
                                                : 25,
                                            fontFamily: "GamerStation",
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  scn[0].longText.characters.length > 600
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        )
                                      : SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                        ),
                                  Container(
                                    color: Colors.transparent,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        scn[0].longText,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: scn[0]
                                                      .longText
                                                      .characters
                                                      .length >
                                                  600
                                              ? 13
                                              : 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
