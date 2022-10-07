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
  var textFieldController = TextEditingController();
  final List<TextEditingController> _textEditingControllers = [TextEditingController()];
  Future<void> additemtoTextEditingControllerList(int index, int maxnumber) async {
    while (index <= maxnumber) {
      _textEditingControllers.add(TextEditingController());
      index++;
    }
  }

  bool isEmpty = false;
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
    int userNumber = Provider.of<GameSettingsModel>(context).playerCount;
    Map? myPlayersMap = Provider.of<Player>(context).playersMap;

    Future<void> mycreatePlayerfunc = Provider.of<Player>(context)
        .createPlayerfunc(userNumber, textFieldController, myScore, myRank, myImageString, myId);

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
                      itemCount: userNumber,
                      itemBuilder: (context, index) {
                        additemtoTextEditingControllerList(
                          index,
                          userNumber,
                        );
                        return Padding(
                            padding: EdgeInsets.only(bottom: screenHeight / 45),
                            child: playerNameCreateContainer(context, index + 1, isCheckOkay));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 30,
              ),
              buildFirstButton(context, isCheckOkay, mycreatePlayerfunc),
            ],
          ),
        ),
      ),
    );
  }

  Container playerNameCreateContainer(BuildContext context, int number, bool isCheckOkay) {
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
                  image: AssetImage('assets/images/profiles/$number.png'),
                  opacity: 1,
                  fit: BoxFit.fill,
                )),
                child: isCheckOkay
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
                  isEmpty,
                  number,
                )),
          ),
          isEmpty
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
