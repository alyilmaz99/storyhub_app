import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  Map<dynamic, dynamic> playersMap = <dynamic, dynamic>{};

  Future<Map> recallPlayersMap(Map) async {
    return playersMap;
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    var screenWidth = screenInfo.size.width;
    int userNumber = Provider.of<GameSettingsModel>(context).playerCount;
    Future<void> createPlayerfunc() async {
      for (var i = 1; i <= userNumber; i++) {
        playersMap[i] = i;
        playersMap["name"] = textFieldController.value.text;
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 128, 106, 1.0),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight / 15),
                child: SizedBox(
                  height: screenHeight / 9,
                  width: screenWidth / 4,
                  child: Image.asset(
                    'assets/images/LogoV1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
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
            ),
            Scrollbar(
              radius: const Radius.circular(20.0),
              thumbVisibility: true,
              thickness: 5,
              child: SizedBox(
                height: 400,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 50),
                  child: ListView.builder(
                    itemCount: userNumber,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: screenHeight / 20),
                          child: playerNameCreateContainer(context));
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight / 15),
                child: SizedBox(
                  height: screenHeight / 10,
                  width: screenWidth / 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(216, 91, 47, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/DEVAm.png',
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        createPlayerfunc();
                        // ignore: avoid_print
                        print(playersMap);
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container playerNameCreateContainer(BuildContext context) {
    return Container(
      height: 90,
      width: 350,
      decoration: playerNameCreateContainerDecoration(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Image.asset('assets/images/human/human1.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(height: 30, width: 130, child: playerNameCreateTextField(context)),
          ),
          isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.check)))
              : Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.cancel)),
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
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        fillColor: Colors.red,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
