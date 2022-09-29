import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import '../../../../product/model/player_selection_model.dart';
import '../../scenario/view/selectscenarioview.dart';
import '../viewmodel/create_player_viewmodel.dart';
import '../../../settings/model/game_settings_model.dart';
import '../../../../product/widgets/button/nasil_oynanir_soru_isareti_button.dart';

class CreatePlayerView extends StatefulWidget {
  const CreatePlayerView({Key? key}) : super(key: key);

  @override
  State<CreatePlayerView> createState() => _CreatePlayerViewState();
}

class _CreatePlayerViewState extends CreatePlayerViewModel {
  var textFieldController = TextEditingController();
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    bool _isCheckOkay = false;
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    var screenWidth = screenInfo.size.width;
    int userNumber = Provider.of<GameSettingsModel>(context).playerCount;
    Map? myPlayersMap = Provider.of<Player>(context).playersMap;
    /* Future<void> mycreatePlayerfunc = Provider.of<Player>(context)
        .createPlayerfunc(userNumber, textFieldController);*/

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            colors: [
              Color.fromRGBO(255, 149, 113, 1),
              Color.fromRGBO(216, 91, 47, 1)
            ],
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
              /*
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth / 10,
                    top: screenHeight / 150,
                  ),
                  child: NasilOynanirSoruIsaretiButton(
                    myHeight: screenHeight / 2,
                    myWidth: screenWidth / 1.5,
                  ),
                ),
              ),*/
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
                        return Padding(
                            padding: EdgeInsets.only(bottom: screenHeight / 45),
                            child: playerNameCreateContainer(
                                context, index + 1, _isCheckOkay));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 30,
              ),
              buildFirstButton(context, _isCheckOkay),
            ],
          ),
        ),
      ),
    );
  }

  Container playerNameCreateContainer(
      BuildContext context, int number, bool isCheckOkay) {
    return Container(
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: playerNameCreateContainerDecoration(),
      child: Row(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
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
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 30),
            child: SizedBox(
                height: 50,
                width: 160,
                child: playerNameCreateTextField(context)),
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

  TextField playerNameCreateTextField(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            isEmpty = false;
          } else {
            isEmpty = true;
          }
        });
      },
      maxLines: 1,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
      controller: textFieldController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: "İsim",
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Color.fromRGBO(223, 97, 50, 1),
              width: 4,
            )),
        fillColor: Colors.red,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(223, 97, 50, 1),
            width: 1.1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  BoxDecoration playerNameCreateContainerDecoration() {
    return const BoxDecoration(
      color: Color.fromRGBO(218, 153, 115, 0.8),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
  }
}
