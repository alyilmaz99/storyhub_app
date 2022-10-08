import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import '../viewmodel/create_player_viewmodel.dart';
import '../../../settings/model/game_settings_model.dart';

class CreatePlayerView extends StatefulWidget {
  const CreatePlayerView({Key? key}) : super(key: key);

  @override
  State<CreatePlayerView> createState() => _CreatePlayerViewState();
}

class _CreatePlayerViewState extends CreatePlayerViewModel {
  @override
  void initState() {
    super.initState();
    Provider.of<Player>(context, listen: false).textValueisEmpty.clear();
  }

  var textFieldController = TextEditingController();
  final List<TextEditingController> _textEditingControllers = [TextEditingController()];

  Future<void> additemtoList(int index, int maxnumber) async {
    while (index < maxnumber) {
      _textEditingControllers.add(TextEditingController());
      if (Provider.of<Player>(context, listen: false).textValueisEmpty.length <
          Provider.of<GameSettingsModel>(context, listen: false).playerCount) {
        Provider.of<Player>(context, listen: false).textValueisEmpty.add(CreatePlayerViewModel.isEmpty);
      }

      index++;
    }
    print("additemtoList : ${Provider.of<Player>(context, listen: false).textValueisEmpty.length}");
    print("index: $index");
    print("max: $maxnumber");
  }

  @override
  Widget build(BuildContext context) {
    bool isCheckOkay = false;
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    var screenWidth = screenInfo.size.width;
    int? myId = Provider.of<Player>(context).id;
    int? myScore = Provider.of<Player>(context).score;
    int? myRank = Provider.of<Player>(context).rank;
    String? myImageString = Provider.of<Player>(context).image;
    // int userNumber = Provider.of<GameSettingsModel>(context).playerCount;
    Map<dynamic, dynamic>? myPlayersMap = Provider.of<Player>(context).playersMap;
    // Future<void> myEqualMap = Provider.of<Player>(context).equalMaps();
    // Future<String> writemaps(Map<dynamic, dynamic> writemap) async {
    //   return writemap.values.toString();
    // }

    Future<String>? getImagePath(int number) async {
      String myImageString = 'assets/images/profiles/$number.png';
      return myImageString;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            colors: [Color.fromRGBO(255, 149, 113, 1), Color.fromRGBO(216, 91, 47, 1)],
          ),
        ),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 20),
                  child: SizedBox(
                    height: screenHeight / 16,
                    width: screenWidth / 4.5,
                    child: Image.asset(
                      'assets/images/LogoV1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Scrollbar(
                radius: const Radius.circular(20.0),
                thumbVisibility: true,
                thickness: 5,
                child: SizedBox(
                  height: screenHeight / 1.40,
                  width: screenWidth / 1.15,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 200),
                    child: ListView.builder(
                      itemCount: Provider.of<GameSettingsModel>(context).playerCount,
                      itemBuilder: (context, index) {
                        additemtoList(
                          index,
                          Provider.of<GameSettingsModel>(context).playerCount,
                        );

                        //burada player oluşturulabilir*-*-*-*-*-*-*-*-*
                        Provider.of<Player>(context).createPlayerfunc(
                          context,
                          _textEditingControllers,
                          myScore,
                          myRank,
                          getImagePath(index),
                          index,
                        );

                        //burada player oluşturulabilir*-*-*-*-*-*-*-*-*
                        return Padding(
                            padding: EdgeInsets.only(bottom: screenHeight / 45),
                            child: playerNameCreateContainer(
                              context,
                              index + 1,
                              isCheckOkay,
                            ));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 30,
              ),
              buildFirstButton(
                context,
                isCheckOkay,
                Provider.of<Player>(context, listen: false).playersMap,
                Provider.of<Player>(context, listen: false).textValueisEmpty,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container playerNameCreateContainer(
    BuildContext context,
    int numberforimages,
    bool isCheckOkay,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: playerNameCreateContainerDecoration(),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/profiles/$numberforimages.png'),
                  opacity: 1,
                  fit: BoxFit.fill,
                )),
                child: Provider.of<Player>(context, listen: false).textValueisEmpty[numberforimages - 1]
                    ? const Center(
                        child: Text(
                          'HAZIR!',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset.infinite,
                                blurRadius: 5,
                              ),
                            ],
                            fontFamily: 'GamerStation',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : const Center(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 30),
            child: SizedBox(
                height: 50,
                width: 160,
                child: playerNameCreateTextField(
                  context,
                  _textEditingControllers,
                  Provider.of<Player>(context, listen: false).textValueisEmpty,
                  numberforimages,
                )),
          ),
          Provider.of<Player>(context, listen: false).textValueisEmpty[numberforimages - 1]
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/images/check1.png'),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/images/check0.png'),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
