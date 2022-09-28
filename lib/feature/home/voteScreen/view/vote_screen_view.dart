import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';
import 'package:storyhub/product/widgets/button/nasil_oylama_soru_isareti_button.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class VoteScreenView extends StatefulWidget {
  const VoteScreenView({Key? key}) : super(key: key);

  @override
  State<VoteScreenView> createState() => _VoteScreenViewState();
}

class _VoteScreenViewState extends State<VoteScreenView> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    var screenWidth = screenInfo.size.width;
    List nameList = <String>[];
    int userNumber = Provider.of<GameSettingsModel>(context).playerCount;
    Map? myPlayerMap = Provider.of<Player>(context).playersMap;
    var entryList = myPlayerMap?.entries.toList();
    Future<List> getNameToList() async {
      for (var element in entryList!) {
        if (element.key == 'name') {
          nameList.add(element.value);
        }
      }
      return entryList;
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 128, 106, 1.0),
      body: Column(
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
              child: NasilOylamaSoruIsaretiButton(
                myHeight: screenHeight / 2,
                myWidth: screenWidth / 1.5,
              ),
            ),
          ),
          SizedBox(
              height: screenHeight / 7, width: screenWidth / 3, child: Image.asset('assets/images/profiles/1.png')),
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
                      child: PlayerVoteRateContainer(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        nameListContainer: nameList,
                        name: nameList[index].toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerVoteRateContainer extends StatelessWidget {
  const PlayerVoteRateContainer({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.nameListContainer,
    required this.name,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final List nameListContainer;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 350,
      decoration: playerPlayerVoteContainerDecoration(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(height: 75, width: 75, child: Image.asset('assets/images/profiles/2.png')),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 7, top: screenHeight / 40),
                child: Text(name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 25.0,
                        )),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 70, left: screenWidth / 8),
                child: const RatingStars(
                  maxValue: 3,
                  maxValueVisibility: true,
                  starCount: 3,
                  starSize: 35,
                  valueLabelMargin: EdgeInsets.all(10),
                  valueLabelPadding: EdgeInsets.all(2),
                  valueLabelVisibility: false,
                  starSpacing: 15,
                  starColor: Color.fromRGBO(64, 13, 115, 1),
                  starOffColor: Color.fromRGBO(143, 87, 119, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

BoxDecoration playerPlayerVoteContainerDecoration() {
  return const BoxDecoration(
    color: Color.fromRGBO(218, 153, 115, 0.8),
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  );
}
