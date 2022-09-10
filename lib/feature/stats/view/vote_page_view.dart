import 'package:flutter/material.dart';
import '../../home/gamepage/model/Player.dart';

class VotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VotePageState();
  }
}

class _VotePageState extends State<VotePage> {
  List<Player> players = [
    Player("Abdullah", "Dündar", 90),
    Player("Murat", "Arslan", 100),
    Player("Ahmet", "Özyörük", 25)
  ];

  @override
  Widget build(Object context) {
    return Scaffold(
      body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(players.length, (index) {
            return Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(players[index].firstName),
                    )));
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: const Icon(Icons.check),
      ),
    );
  }

  //GridView.builder(
  //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  //         maxCrossAxisExtent: 200,
  //         childAspectRatio: 3 / 2,
  //         crossAxisSpacing: 20,
  //         mainAxisSpacing: 20),
  //     itemCount: players.length,
  //     itemBuilder: (BuildContext context, index) {
  //       return Container(
  //         alignment: Alignment.center,
  //         decoration: BoxDecoration(
  //           color: Colors.amber,
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Text(players[index].firstName),
  //       );
  //     }));

}
