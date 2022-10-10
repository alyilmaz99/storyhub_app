import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/voteScreen/view/vote_screen_view.dart';

import '../../createplayer/model/player_model.dart';
import '../model/vote_model.dart';

abstract class VoteScreenViewModel extends State<VoteScreenView> {
  BoxDecoration playerPlayerVoteContainerDecoration() {
    return const BoxDecoration(
      color: Color.fromRGBO(218, 153, 115, 0.8),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
  }
}

class RateStarWidget extends StatelessWidget {
  RateStarWidget({
    required this.fun,
    required this.index,
    Key? key,
  }) : super(key: key);
  Function fun;
  int index;
  @override
  Widget build(BuildContext context) {
    return RatingStars(
      valueLabelVisibility: false,
      value: Provider.of<Player>(context, listen: false).playerList[index + 1].score,
      onValueChanged: (currentValue) {
        // ignore: avoid_print
        fun();
        print("benim skor:$currentValue");
        Provider.of<Player>(context, listen: false).playerList[index + 1].score =
            Provider.of<Player>(context, listen: false).playerList[index + 1].score = currentValue;
        print(Provider.of<Player>(context, listen: false).playerList[index + 1].score);
      },
      maxValue: 3,
      starCount: 3,
      starSize: 35,
      valueLabelMargin: const EdgeInsets.all(10),
      valueLabelPadding: const EdgeInsets.all(2),
      starSpacing: 15,
      starColor: const Color.fromRGBO(64, 13, 115, 1),
      starOffColor: const Color.fromRGBO(143, 87, 119, 1),
      animationDuration: const Duration(milliseconds: 1),
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

class PlayerVoteRateContainer extends StatelessWidget {
  PlayerVoteRateContainer({
    Key? key,
    required this.fun,
    required this.screenWidth,
    required this.screenHeight,
    required this.name,
    required this.imagePath,
    required this.indexincontainer,
  }) : super(key: key);
  Function fun;
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
                    fun: fun,
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

class VoteScreenContinueButton extends StatelessWidget {
  const VoteScreenContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Vote>(context, listen: false).buttonFunc(context);
        Provider.of<Vote>(context, listen: false).changeHead(
          context,
        );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const VoteScreenView()), (Route<dynamic> route) => false);
      },
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
//OUT OF VoteScreenViewModel

