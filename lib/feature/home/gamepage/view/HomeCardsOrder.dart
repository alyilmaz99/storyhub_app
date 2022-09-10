// ignore_for_file: file_names

import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import '../../../drawer/view/drawer_view.dart';
import '../viewmodel/home_cards_order_viewmodel.dart';

import 'drawer_page_view.dart';

class HomeCardsOrder extends HomeCardsOrderViewModel {
  HomeCardsOrder({Key? key}) : super(null);

  final List<Widget> frontImages = [
    Container(
        decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
          image: AssetImage("assets/images/cards/card2.png"),
          fit: BoxFit.cover),
    )),
    Container(
        decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
          image: AssetImage("assets/images/cards/card2.png"),
          fit: BoxFit.cover),
    )),
    Container(
        decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
          image: AssetImage("assets/images/cards/card2.png"),
          fit: BoxFit.cover),
    )),
    Container(
        decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
          image: AssetImage("assets/images/cards/card2.png"),
          fit: BoxFit.cover),
    )),
    Container(
        decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
          image: AssetImage("assets/images/cards/card2.png"),
          fit: BoxFit.cover),
    )),
    Container(
        decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      image: DecorationImage(
          image: AssetImage("assets/images/cards/card2.png"),
          fit: BoxFit.cover),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(37, 29, 58, 1),
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(FullScreenModal());
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            colors: [
              Color.fromRGBO(59, 52, 114, 1),
              Color.fromRGBO(37, 29, 58, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 18,
                  top: screenHeight / 25,
                  right: screenWidth / 12),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: screenWidth / 5,
                        height: screenHeight / 10,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/human/human3.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onSurface: Colors.white,
                            primary: const Color.fromRGBO(216, 91, 47, 0.7),
                            minimumSize:
                                Size(screenWidth / 4, screenHeight / 40)),
                        child: const Text(
                          "İsim",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Kart Seçimi",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    right: screenWidth / 30, left: screenWidth / 30),
                child: Center(
                  child: SizedBox(
                    height: screenHeight / 2.0,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 190,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      children: <Widget>[
                        Container(
                          child: newCard,
                        ),
                        Container(
                          child: newCard,
                        ),
                        Container(
                          child: newCard,
                        ),
                        Container(
                          child: newCard,
                        ),
                        Container(
                          child: newCard,
                        ),
                        Container(
                          child: newCard,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: screenWidth / 2.6,
                  height: screenHeight / 5,
                  child: Stack(children: [
                    Image.asset(
                      'assets/images/timer.png',
                      fit: BoxFit.fill,
                    ),
                    const Positioned(
                        bottom: 75,
                        right: 50,
                        child: Text(
                          "0:00",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: screenHeight / 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onSurface: Colors.white,
                        primary: const Color.fromRGBO(216, 91, 47, 0.7),
                        minimumSize:
                            Size(screenWidth / 1.8, screenHeight / 19)),
                    child: const Text(
                      "İLERİ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // Scaffold(
    //   backgroundColor: const Color.fromRGBO(15, 61, 62, 1.0),
    //   body: Column(
    //     children: [
    //       /* Container(
    //         alignment: Alignment.centerLeft,
    //         padding: EdgeInsets.only(top: 40, left: 25),
    //         child: Icon(
    //           Icons.menu,
    //           color: Colors.black87,
    //           size: 30,
    //         ),
    //       ), */
    //       Container(
    //         alignment: Alignment.center,
    //         width: screenWidth / 1.001,
    //         height: screenHeight / 10,
    //         padding: const EdgeInsets.only(left: 25, right: 25),
    //         margin: EdgeInsets.only(
    //           left: 15,
    //           top: screenHeight / 18,
    //           right: 15,
    //         ),
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(25),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black.withOpacity(0.3),
    //               offset: const Offset(0, 3),
    //               blurRadius: 7,
    //               spreadRadius: 1,
    //             ),
    //           ],
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               height: (screenWidth / 1.001) / 5.8,
    //               width: (screenWidth / 1.001) / 5.8,
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: Colors.blue,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             Container(
    //               height: (screenWidth / 1.001) / 5.8,
    //               width: (screenWidth / 1.001) / 5.8,
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: Colors.green,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             Container(
    //               height: (screenWidth / 1.001) / 5.8,
    //               width: (screenWidth / 1.001) / 5.8,
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: Colors.red,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             Container(
    //               height: (screenWidth / 1.001) / 5.8,
    //               width: (screenWidth / 1.001) / 5.8,
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: Colors.red,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //           child: Center(
    //             child: SizedBox(
    //               height: screenHeight/2.0,
    //               child: GridView(
    //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 3,
    //                   mainAxisExtent: 190,
    //                   crossAxisSpacing: 0,
    //                   mainAxisSpacing: 0,
    //                 ),
    //                 physics: NeverScrollableScrollPhysics(),
    //                 primary: false,
    //                 padding: const EdgeInsets.all(0),
    //                 children: <Widget>[
    //                   Container(
    //                     child: newCard,
    //                   ),
    //                   Container(
    //                     child: newCard,
    //                   ),
    //                   Container(
    //                     child: newCard,
    //                   ),
    //                   Container(
    //                     child: newCard,
    //                   ),
    //                   Container(
    //                     child: newCard,
    //                   ),
    //                   Container(
    //                     child: newCard,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //       ),
    //       Row(
    //         children: [
    //           Container(
    //             width: screenWidth / 4,
    //             height: screenWidth / 4,
    //             margin: const EdgeInsets.only(
    //               left: 20,
    //               bottom: 20,
    //             ),
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: Colors.white,
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.black.withOpacity(0.3),
    //                   offset: const Offset(0, 3),
    //                   blurRadius: 7,
    //                   spreadRadius: 1,
    //                 ),
    //               ],
    //             ),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Text(
    //                   "SÜRE",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 17,
    //                     color: Colors.black.withOpacity(0.7),
    //                   ),
    //                 ),
    //                 const Text(
    //                   "15",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.w800, fontSize: 50),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             alignment: Alignment.center,
    //             margin: EdgeInsets.only(left: screenHeight / 20),
    //             width: screenWidth / 1.9,
    //             height: screenHeight / 15,
    //             decoration: BoxDecoration(
    //               color: Colors.amber.shade200,
    //               borderRadius: BorderRadius.circular(50),
    //               // ignore: prefer_const_literals_to_create_immutables
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.black.withOpacity(0.3),
    //                   offset: const Offset(0, 3),
    //                   blurRadius: 7,
    //                   spreadRadius: 1,
    //                 ),
    //               ],
    //             ),
    //             child: Text(
    //               "Next",
    //               style: TextStyle(
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
  }
}
