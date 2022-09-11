import 'package:flutter/material.dart';
import '../../../product/model/Player.dart';

class SortingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SortingPage();
  }
}

class _SortingPage extends State<SortingPage> {
  List<Player> players = [
    Player("Abdullah", "Dündar", 90),
    Player("Murat", "Arslan", 100),
    Player("Ahmet", "Özyörük", 25)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sıralama"),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("${players[index].firstName} ${players[index].lastName}"),
                    subtitle: Text("Score : ${players[index].score}"),
                    leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.google.com/search?q=1.cilik+icon&tbm=isch&chips=q:1+cilik+icon,online_chips:png:VHrCFeKmQHU%3D&hl=tr&sa=X&ved=2ahUKEwjahLnQpcj5AhWMNewKHZXUBccQ4lYoAXoECAEQJg&biw=1903&bih=938#imgrc=gsz0Koy_N-bMvM")),
                    trailing: const Icon(Icons.abc_rounded),
                  );
                })),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Flexible(fit: FlexFit.tight, flex: 1, child: SizedBox()),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Ana Memü'),
              //style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            ),
          ),
          const Flexible(fit: FlexFit.tight, flex: 2, child: SizedBox()),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Yeni Oyun'),
              //style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            ),
          ),
          const Flexible(fit: FlexFit.tight, flex: 1, child: SizedBox()),
        ]),
        const SizedBox(height: 20),
      ],
    );
  }
}
