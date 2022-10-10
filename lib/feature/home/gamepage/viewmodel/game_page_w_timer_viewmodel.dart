import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';
import 'package:storyhub/feature/home/voteScreen/view/vote_screen_view.dart';
import 'package:storyhub/feature/settings/viewmodel/game_settings_viewmodel.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../../settings/model/game_settings_model.dart';
import '../../final/view/final_page_view.dart';
import '../../final/viewmodel/final_page_viewmodel.dart';
import '../view/CardPAge.dart';
import '../view/game_page_w_timer_view.dart';

abstract class GamePageWithTimerViewModel extends State<GamePageWithTimer> {
  void countIncrease() {
    Provider.of<PlayerCarouselViewModel>(context, listen: false).countTour++;
    Provider.of<PlayerCarouselViewModel>(context, listen: false)
        .useForTourCountChechk = 1;
  }

  String isFinalRouter(bool isFinal) {
    if (!isFinal) {
      return Provider.of<PlayerCarouselViewModel>(context)
          .playerList[
              Provider.of<PlayerCarouselViewModel>(context).selectedIndex()]
          .imgPath;
    } else {
      return Provider.of<FinalPageViewModel>(context).choosenImgPath;
    }
  }

  String isFinalRouterName(bool isFinal) {
    if (!isFinal) {
      return Provider.of<PlayerCarouselViewModel>(context)
          .playerList[
              Provider.of<PlayerCarouselViewModel>(context).selectedIndex()]
          .playerName;
    } else {
      return Provider.of<FinalPageViewModel>(context).choosenName;
    }
  }

  Widget isFinalSizedBox() {
    return Provider.of<FinalPageViewModel>(context).isFinal == true
        ? SizedBox(height: MediaQuery.of(context).size.height / 30)
        : const SizedBox();
  }

  void nextPlayerFunctions(bool isFinish) {
    if (isFinish == true) {
      if (Provider.of<PlayerCarouselViewModel>(context, listen: false)
              .useForTourCountChechk ==
          Provider.of<GameSettingsModel>(context, listen: false).playerCount) {
        if (Provider.of<PlayerCarouselViewModel>(context, listen: false)
                .countTour ==
            (Provider.of<GameSettingsModel>(context, listen: false)
                .roundCount)) {
          finalPageRoute();
        } else {
          countIncrease();
        }
      } else {
        cardPageRoute();
      }
    }
  }

  void halfTimerChechk(String value, void Function() callback) {
    if ((Provider.of<GameSettingsModel>(context).timerValue.toInt() / 2)
                .toString() ==
            ("$value.0") ||
        (Provider.of<GameSettingsModel>(context).timerValue.toInt() / 2)
                .toString() ==
            ("$value.5")) {
      Future.delayed(Duration.zero, () async {
        setState(() {
          callback();
        });
      });
    }
  }

  void halfTimerChechk2(String value, void Function() callback) {
    if ((Provider.of<GameSettingsModel>(context).timerValue.toInt())
                .toString() ==
            ("$value.0") ||
        (Provider.of<GameSettingsModel>(context).timerValue.toInt())
                .toString() ==
            value) {
      Future.delayed(Duration.zero, () async {
        setState(() {
          callback();
        });
      });
    }
  }

  void finishGame(bool isFinish) {
    if (isFinish == true) {
      Provider.of<FinalPageViewModel>(
        context,
        listen: false,
      ).isFinal = false;
      Provider.of<PlayerCarouselViewModel>(context, listen: false).countTour =
          1;
      Provider.of<PlayerCarouselViewModel>(context, listen: false)
          .useForTourCountChechk = 1;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoteScreenView(),
        ),
      );
    }
  }

  void finalPageRoute() {
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            PageAnimationTransition(
                page: FinalPageView(),
                pageAnimationType: FadeAnimationTransition()),
            (Route<dynamic> route) => false);
      },
    );
  }

  void cardPageRoute() {
    Provider.of<PlayerCarouselViewModel>(context, listen: false)
        .useForTourCountChechk++;
    Provider.of<PlayerCarouselViewModel>(context, listen: false).carouselNext();
    Provider.of<PlayerCarouselViewModel>(context, listen: false)
        .countCheck(context);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardPage(),
      ),
    );
  }
}

Widget crateHeroImage(BuildContext context, String path, double width,
    double height, double opacity) {
  return Column(
    children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
            opacity: opacity,
            fit: BoxFit.fill,
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
            ),
            shadowColor: Colors.transparent,
            primary: Colors.transparent,
            minimumSize: Size(MediaQuery.of(context).size.width / 5,
                MediaQuery.of(context).size.height / 30)),
        child: const Text(
          "İsim",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

Widget buildFirstButton(BuildContext context, String text, double height,
    double width, Color color, Function function, String secondText) {
  return SizedBox(
    width: width,
    height: height,
    child: OutlinedButton(
      onPressed: () {
        function;
      },
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 23, fontFamily: 'GamerStation'),
          ),
          Text(
            secondText,
            style: const TextStyle(
                color: Colors.white, fontSize: 23, fontFamily: 'GamerStation'),
          ),
        ],
      ),
    ),
  );
}
