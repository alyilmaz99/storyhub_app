import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:storyhub/feature/home/gamepage/view/HomeCardsOrder.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class SelectScenarioView extends StatefulWidget {
  const SelectScenarioView({Key? key}) : super(key: key);

  @override
  State<SelectScenarioView> createState() => _SelectScenarioViewState();
}

class _SelectScenarioViewState extends State<SelectScenarioView> {
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
        decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/denizalti.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "DENİZALTI",
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/sirket.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "ŞİRKET",
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/marskolonisi.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "MARS KOLONİSİ",
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/uzay.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "UZAY",
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/beyazsaray.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "BEYAZ SARAY",
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/ahir.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: w / 2.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "AHIR",
                style:
                    TextStyle(fontFamily: "GamerStation", color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(217, 217, 217, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
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
            Container(
              child: Row(
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Align(alignment: Alignment.center, child: buildIcon()),
                  Spacer(
                    flex: 2,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: buildIcon1(),
                  ),
                ],
              ),
            ),
            Row(children: [
              Spacer(flex: 2),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text("SENARYO SEÇ",
                      style: TextStyle(
                          fontFamily: 'GamerStation',
                          letterSpacing: 0.5,
                          fontSize: 25.0,
                          color: Colors.white)
                      //  Theme.of(context).textTheme.bodyLarge?.copyWith(
                      //     letterSpacing: 1.5, fontSize: 25.0, color: Colors.white),
                      ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: buildIcon2(),
              ),
            ]),
            Expanded(
              child: Scrollbar(
                  child: GridView.count(
                      physics: ScrollPhysics(),
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 1,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(images.length, (index) {
                        return Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 15.0),
                          child: FlipCard(
                              front: images[index],
                              back: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: colors[index],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  Positioned(
                                      child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 50),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            titles[index],
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: "GamerStation"),
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis   ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Montserrat")),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 15.0),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: SizedBox(
                                              width: 70,
                                              height: 40,
                                              child: FloatingActionButton(
                                                splashColor:
                                                    Colors.pink.shade600,
                                                backgroundColor: Color.fromRGBO(
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
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeCardsOrder()));
                                                },
                                                child: Text(
                                                  "OYNA",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color: Colors.white,
                                                          letterSpacing: 1.5,
                                                          fontFamily:
                                                              "GamerStation"),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              )),
                        ));
                      }))),
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
          return Container(
            width: MediaQuery.of(context).size.width / 2,
            child: SimpleDialog(
              insetPadding: EdgeInsets.only(
                  bottom: 2 * (MediaQuery.of(context).size.height / 8),
                  left: (MediaQuery.of(context).size.width / 10)),
              backgroundColor: Color.fromRGBO(255, 163, 114, 1),
              children: [
                SimpleDialogOption(
                    onPressed: () {},
                    child: Column(children: [
                      Row(children: [
                        Text(
                          "KORKU - 6",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        Icon(
                          Icons.abc,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      Divider()
                    ])),
                SimpleDialogOption(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Row(children: [
                          Text("EĞLENCE - 4 ",
                              style: TextStyle(
                                  fontFamily: "GamerStation",
                                  color: Colors.white,
                                  fontSize: 20.0)),
                          Spacer(),
                          Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.white,
                            size: 40,
                          )
                        ]),
                        Divider()
                      ],
                    )),
                SimpleDialogOption(
                    onPressed: () {},
                    child: Column(children: [
                      Row(children: [
                        Text(
                          "FANTASTİK - 2",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        Icon(
                          Icons.add_alarm_sharp,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      Divider()
                    ])),
                SimpleDialogOption(
                    onPressed: () {},
                    child: Column(children: [
                      Row(children: [
                        Text(
                          "MACERA - 8",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        Icon(
                          Icons.access_alarm_rounded,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      Divider()
                    ])),
                SimpleDialogOption(
                    onPressed: () {},
                    child: Column(children: [
                      Row(children: [
                        Text(
                          "DRAM - 3",
                          style: TextStyle(
                              fontFamily: "GamerStation",
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        Spacer(),
                        Icon(
                          Icons.accessibility_new_sharp,
                          color: Colors.white,
                          size: 40,
                        )
                      ]),
                      Divider()
                    ])),
              ],
            ),
          );
        });
  }
}
