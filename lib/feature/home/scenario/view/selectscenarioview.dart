import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/const/text_const/textconst.dart';
import '../../gamepage/view/HomeCardsOrder.dart';

class SelectScenarioView extends StatefulWidget {
  const SelectScenarioView({Key? key}) : super(key: key);

  @override
  State<SelectScenarioView> createState() => _SelectScenarioViewState();
}

class _SelectScenarioViewState extends State<SelectScenarioView> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
    ];

    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.red.withOpacity(0.6), BlendMode.dstATop),
          image: const AssetImage("assets/images/front.png"),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.yellow.withOpacity(0.6), BlendMode.dstATop),
          image: const AssetImage("assets/images/front.png"),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
          image: const AssetImage("assets/images/front.png"),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.cyan.withOpacity(0.6), BlendMode.dstATop),
          image: const AssetImage("assets/images/front.png"),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.blue.withOpacity(0.6), BlendMode.dstATop),
          image: const AssetImage("assets/images/front.png"),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.6), BlendMode.dstATop),
          image: const AssetImage("assets/images/front.png"),
          fit: BoxFit.cover,
        )),
      ),
    ];

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
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              letterSpacing: 1.5, fontSize: 25.0, color: Colors.black54),
        ),
      ),

      body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 1,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(images.length, (index) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: FlipCard(
                  front: images[index],
                  back: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      Positioned(
                          child: Container(
                        child: Center(
                          child: Text(
                            titles[index],
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ))
                    ],
                  )),
            ));
          })),

      // body: Center(
      //   child: FlipCard(
      //     direction: FlipDirection.HORIZONTAL,
      //     front: Container(
      //       width: 300,
      //       height: 400,
      //       color: Colors.red,
      //     ),
      //     back: Container(
      //       width: 300,
      //       height: 400,
      //       color: Colors.blue,
      //     ),
      //   ),
      // ),

      // body: SafeArea(
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //         child: Container(
      //             child: FlipCard(
      //                 direction: FlipDirection.HORIZONTAL,
      //                 front: VerticalCardPager(
      //                     titles: titles, // required
      //                     images: images, // required
      //                     textStyle: TextStyle(
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold), // optional
      //                     onPageChanged: (page) {
      //                       // optional
      //                     },
      //                     onSelectedItem: (index) {
      //                       // optional
      //                     },
      //                     initialPage: 0, // optional
      //                     align: ALIGN.CENTER // optional
      //                     ),
      //                 back: Container(
      //                   child: Text("Murat"),
      //                 ))),
      //       ),
      //     ],
      //   ),
      // ),

      // body: FluidActionCard(
      //   color1: Colors.white,
      //   color2: Colors.white60,
      //   backgroundcolor: Colors.redAccent.shade100,
      //   borderRadius1: BorderRadius.circular(20),
      //   borderRadius2: BorderRadius.circular(20),
      //   height: 400.0,
      //   width: 240.0,
      //   CardCount: 6,
      //   Position: 100.0,
      //   assetimage: "assets/images/kovboy.png",
      //   shadow: const BoxShadow(
      //     color: Colors.black45,
      //     blurRadius: 10.0,
      //     spreadRadius: 0.2,
      //     offset: Offset(0, 3),
      //   ),
      //   ontap: () {},
      // ),
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
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeCardsOrder()));
        },
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
