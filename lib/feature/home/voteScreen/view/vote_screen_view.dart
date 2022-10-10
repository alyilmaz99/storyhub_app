import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/createplayer/model/player_model.dart';
import 'package:storyhub/feature/home/voteScreen/model/vote_model.dart';
import 'package:storyhub/feature/home/voteScreen/viewmodel/vote_screen_viewmodel.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';
import 'package:storyhub/product/widgets/button/nasil_oylama_soru_isareti_button.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class VoteScreenView extends StatefulWidget {
  const VoteScreenView({Key? key}) : super(key: key);

  @override
  State<VoteScreenView> createState() => _VoteScreenViewState();
}

class _VoteScreenViewState extends VoteScreenViewModel {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    var screenWidth = screenInfo.size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 128, 106, 1.0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            colors: [Color.fromRGBO(255, 149, 113, 1), Color.fromRGBO(216, 91, 47, 1)],
          ),
        ),
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
                height: screenHeight / 7,
                width: screenWidth / 3,
                child: Image.asset(
                  Provider.of<Vote>(context).getPlayerToHead(context, Provider.of<Player>(context).playerList),
                )),
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
                    itemCount: Provider.of<GameSettingsModel>(context).playerCount - 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight / 20),
                        child: PlayerVoteRateContainer(
                          screenWidth: screenWidth / 10,
                          screenHeight: screenHeight / 8,
                          name: Provider.of<Player>(context).playerList[index + 1].name,
                          imagePath: Provider.of<Player>(context).playerList[index + 1].image,
                          indexincontainer: index,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 13,
                child: const VoteScreenContinueButton()),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class VoteScreenContinueButton extends StatelessWidget {
  const VoteScreenContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5),
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(0, 82, 4, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(219, 96, 52, 1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      child: const Text(
        "DEVAM",
        style: TextStyle(
          fontFamily: 'GamerStation',
          color: Colors.white,
          fontSize: 35,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PlayerVoteRateContainer extends StatelessWidget {
  PlayerVoteRateContainer({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.name,
    required this.imagePath,
    required this.indexincontainer,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String name;
  double ratingstarincontainer = 0;
  final String imagePath;
  final int indexincontainer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: playerPlayerVoteContainerDecoration(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(height: 75, width: 75, child: Image.asset(imagePath)),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 2),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 7, top: screenHeight / 40),
                  child: Text(name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'GamerStation',
                            color: Colors.white,
                            fontSize: 25.0,
                          )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight / 10, left: screenWidth / 8),
                  child: RateStarWidget(
                    index: indexincontainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RateStarWidget extends StatelessWidget {
  RateStarWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  int index;
  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: Provider.of<Player>(context, listen: false).playerList[index + 1].score,
      onValueChanged: (currentValue) {
        // ignore: avoid_print
        print("benim skor:$currentValue");
        Provider.of<Player>(context, listen: false).playerList[index + 1].score =
            Provider.of<Player>(context, listen: false).playerList[index + 1].score + currentValue;
      },
      maxValue: 5,
      maxValueVisibility: true,
      starCount: 3,
      starSize: 35,
      valueLabelMargin: const EdgeInsets.all(10),
      valueLabelPadding: const EdgeInsets.all(2),
      valueLabelVisibility: true,
      starSpacing: 15,
      starColor: const Color.fromRGBO(64, 13, 115, 1),
      valueLabelColor: Colors.black,
      starOffColor: const Color.fromRGBO(143, 87, 119, 1),
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
