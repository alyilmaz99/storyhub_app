import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/voteScreen/view/vote_screen_view.dart';
import 'package:storyhub/feature/settings/model/game_settings_model.dart';
import 'package:storyhub/feature/stats/view/sorting_page_view.dart';
import '../../../../product/model/button_sound.dart';
import '../model/vote_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      onValueChanged: (currentValue) {
        print(
            "player vote number:  ${Provider.of<Vote>(context, listen: false).playerList3[Provider.of<Vote>(context, listen: false).counterForTour].playerVoteNumber}");
        print("current value: $currentValue");
        print(
            "provider CurrrentValue: ${Provider.of<Vote>(context, listen: false).currentValue}");
        /*
        if (currentValue == 0) {
          Provider.of<Vote>(context).currentValue = currentValue;
          if (Provider.of<Vote>(context, listen: false)
                      .playerList3[Provider.of<Vote>(context, listen: false)
                          .counterForTour]
                      .playerVoteNumber >
                  0 &&
              Provider.of<Vote>(context, listen: false)
                      .playerList3[Provider.of<Vote>(context, listen: false)
                          .counterForTour]
                      .playerVoteNumber >=
                  currentValue) {
            playerVoteCountController(context, index, currentValue);
            fun2();
          }
        } else if (currentValue != 0) {
          if (Provider.of<Vote>(context, listen: false).currentValue <
              currentValue) {
            Provider.of<Vote>(context, listen: false)
                    .playerList3[Provider.of<Vote>(context, listen: false)
                        .counterForTour]
                    .playerVoteNumber +=
                Provider.of<Vote>(context, listen: false).currentValue;
            Provider.of<Vote>(context, listen: false).currentValue =
                currentValue;
            playerVoteCountController(context, index, currentValue);
            fun2();
          } else if (Provider.of<Vote>(context, listen: false).currentValue >
              currentValue) {
            Provider.of<Vote>(context, listen: false)
                    .playerList3[Provider.of<Vote>(context, listen: false)
                        .counterForTour]
                    .playerVoteNumber +=
                Provider.of<Vote>(context, listen: false).currentValue;
            Provider.of<Vote>(context, listen: false).currentValue =
                currentValue;

            playerVoteCountController(context, index, currentValue);
            fun2();
          }
        }
*/
        if (Provider.of<Vote>(context, listen: false)
                .playerList3[
                    Provider.of<Vote>(context, listen: false).counterForTour]
                .playerVoteNumber >
            0) {
          if (currentValue <=
              Provider.of<Vote>(context, listen: false)
                  .playerList3[
                      Provider.of<Vote>(context, listen: false).counterForTour]
                  .playerVoteNumber) {
            fun2();
            playerVoteCountController(context, index, currentValue);
          }
        }

        /*
        if (currentValue <
            Provider.of<Vote>(context, listen: false).currentValue[index]) {
          Provider.of<Vote>(context, listen: false)
                  .playerList3[
                      Provider.of<Vote>(context, listen: false).counterForTour]
                  .playerVoteNumber +=
              Provider.of<Vote>(context, listen: false).currentValue[index] -
                  currentValue;
          for (var i = 0;
              i < Provider.of<Vote>(context, listen: false).playerList3.length;
              i++) {
            if (Provider.of<Vote>(context, listen: false)
                    .playerList2[index]
                    .name ==
                Provider.of<Vote>(context, listen: false).playerList3[i].name) {
              Provider.of<Vote>(context, listen: false).playerList3[i].score -=
                  Provider.of<Vote>(context, listen: false)
                          .currentValue[index] -
                      currentValue;
            }
          }
          fun2();
        }
*/
        (Provider.of<Vote>(context, listen: false)
            .playerList3
            .forEach((element) {
          print(
              'score ${element.name}:  ${element.score} voteNUmber: ${element.playerVoteNumber}');
        }));
      },
      valueLabelVisibility: false,
      maxValue: 3,
      value: Provider.of<Vote>(context).valueChanged[index],
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

void playerVoteCountController(
    BuildContext context, int index, double currentValue) {
  if (Provider.of<Vote>(context, listen: false)
          .playerList3[Provider.of<Vote>(context, listen: false).counterForTour]
          .playerVoteNumber >
      0) {
    Provider.of<Vote>(context, listen: false).valueChanged[index] =
        currentValue;
    Provider.of<Vote>(context, listen: false)
        .playerList3[Provider.of<Vote>(context, listen: false).counterForTour]
        .playerVoteNumber -= currentValue;
  }
  playerVoteMinusController(context);
  for (var i = 0;
      i < Provider.of<Vote>(context, listen: false).playerList3.length;
      i++) {
    if (Provider.of<Vote>(context, listen: false).playerList2[index].name ==
        Provider.of<Vote>(context, listen: false).playerList3[i].name) {
      Provider.of<Vote>(context, listen: false).playerList3[i].score +=
          currentValue;
    }
  }
  Provider.of<Vote>(context, listen: false).currentValue[index] = currentValue;
}

void playerVoteMinusController(BuildContext context) {
  Provider.of<Vote>(context, listen: false)
              .playerList3[
                  Provider.of<Vote>(context, listen: false).counterForTour]
              .playerVoteNumber ==
          -1
      ? Provider.of<Vote>(context, listen: false)
          .playerList3[Provider.of<Vote>(context, listen: false).counterForTour]
          .playerVoteNumber++
      : null;
  Provider.of<Vote>(context, listen: false)
              .playerList3[
                  Provider.of<Vote>(context, listen: false).counterForTour]
              .playerVoteNumber ==
          -2
      ? Provider.of<Vote>(context, listen: false)
          .playerList3[Provider.of<Vote>(context, listen: false).counterForTour]
          .playerVoteNumber++
      : null;
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
    // Button//sound //sound = Button//sound();
    return ElevatedButton(
      onPressed: () {
        //sound.playButton//sound(context);
        Provider.of<Vote>(context, listen: false).counterForTour++;

        Provider.of<Vote>(context, listen: false).printPlayerScoreList(context);

        Provider.of<Vote>(context, listen: false).valueChanged.clear();
        Provider.of<Vote>(context, listen: false).currentValue.clear();
        Provider.of<Vote>(context, listen: false).currentValue = [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0
        ];
        Provider.of<Vote>(context, listen: false).isFinishVote
            ? Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const SortingPageView(),
                  transitionDuration: Duration(seconds: (0.5).toInt()),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              )
            : Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const VoteScreenView(),
                  transitionDuration: Duration(seconds: (0.5).toInt()),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
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
        Provider.of<Vote>(context).isFinishVote
            ? AppLocalizations.of(context)!.voteScreenFinish
            : AppLocalizations.of(context)!.voteScreenWithStar,
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

