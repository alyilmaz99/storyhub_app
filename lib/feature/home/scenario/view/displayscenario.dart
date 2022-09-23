import 'package:flutter/material.dart';

import '../../gamepage/view/HomeCardsOrder.dart';

class DisplayScenario extends StatefulWidget {
  @override
  State<DisplayScenario> createState() => _DisplayScenario();
}

class _DisplayScenario extends State<DisplayScenario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(radius: 1, colors: [
            Color.fromRGBO(59, 52, 114, 1),
            Color.fromRGBO(59, 52, 114, 1),
            Color.fromRGBO(42, 37, 80, 1),
            Color.fromRGBO(37, 29, 58, 1)
          ])),
          child: Column(children: [
            const SizedBox(height: 30),
            Center(
              child: IconButton(
                icon: Image.asset("assets/images/LogoV1.png"),
                iconSize: 100,
                onPressed: () {},
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / (1.5),
              //decoration: BoxDecoration(

              //borderRadius: BorderRadius.circular(15),
              //color: Color.fromRGBO(47, 13, 75, 1)),

              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeCardsOrder()));
                },
                child: Card(
                    color: Color.fromRGBO(47, 13, 75, 1),
                    elevation: 6,
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                            width: double.infinity,
                            //height: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/600"),
                                    fit: BoxFit.cover)),
                            child: Container(
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Denizaltı",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "GamerStation",
                                            //color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros donec ac odio tempor orci dapibus ultrices in iaculis nunc sed augue lacusf",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Montserrat")),
                                      ),
                                    )
                                  ],
                                ))))),
              ),
            )
          ])),
    );
  }
}
