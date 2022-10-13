import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/voteScreen/view/vote_screen_view.dart';
import 'package:storyhub/feature/stats/view/sorting_page_view.dart';

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

// ignore: must_be_immutable
class RateStarWidget extends StatelessWidget {
  RateStarWidget({
    required this.fun2,
    required this.index,
    Key? key,
  }) : super(key: key);
  Function fun2;

  int index;
  @override
  Widget build(BuildContext context) {
    return RatingStars(
      //Provider.of<Vote>(context, listen: false).playerList2[index].score,

      onValueChanged: (currentValue) {
        /* Provider.of<Vote>(context, listen: false).playerScores[index] =
            currentValue;*/
        for (var i = 0;
            i < Provider.of<Vote>(context, listen: false).playerList3.length;
            i++) {
          if (Provider.of<Vote>(context, listen: false)
                  .playerList2[index]
                  .name ==
              Provider.of<Vote>(context, listen: false).playerList3[i].name) {
            Provider.of<Vote>(context, listen: false).playerList3[i].score +=
                currentValue;
          }
        }

        (Provider.of<Vote>(context, listen: false)
            .playerList3
            .forEach((element) {
          print('score ${element.name}:  ${element.score}');
        }));
      },
      valueLabelVisibility: false,
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
    required this.fun2,
    required this.screenWidth,
    required this.screenHeight,
    required this.name,
    required this.imagePath,
    required this.indexincontainer,
  }) : super(key: key);
  Function fun2;
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
            padding: EdgeInsets.only(left: screenHeight / 4),
            child:
                SizedBox(height: 75, width: 75, child: Image.asset(imagePath)),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
                right: screenHeight / 3, top: screenHeight / 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth / 5, top: screenHeight / 15),
                  child: Container(
                    width: screenHeight / 0.45,
                    height: screenHeight / 3.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: Center(
                      child: Text(name,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight / 10, left: screenWidth / 8),
                  child: RateStarWidget(
                    fun2: fun2,
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
        Provider.of<Vote>(context, listen: false).counterForTour++;

        Provider.of<Vote>(context, listen: false).printPlayerScoreList(context);
        Provider.of<Vote>(context, listen: false).isFinishVote
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SortingPageView()))
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VoteScreenView()));
        Provider.of<Vote>(context, listen: false).isFinishVoteFunc(context);
        Provider.of<Vote>(context, listen: false).isFinishVote
            ? Provider.of<Vote>(context, listen: false).isEqual(context)
            : null;

        Provider.of<Vote>(context, listen: false).isFinishVote
            ? Provider.of<Vote>(context, listen: false).bubbleSort()
            : null;
        (Provider.of<Vote>(context, listen: false)
            .playerList
            .forEach((element) {
          print('score ${element.score}');
        }));
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5),
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(0, 82, 4, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(219, 96, 52, 1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      child: Text(
        Provider.of<Vote>(context).isFinishVote ? "BİTİR" : "YILDIZLA",
        style: const TextStyle(
          fontFamily: 'GamerStation',
          color: Colors.white,
          fontSize: 35,
        ),
      ),
    );
  }
}
//OUT OF VoteScreenViewModel

