// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/feature/home/scenario/view/selectscenarioview.dart';
import 'package:storyhub/feature/home/voteScreen/view/vote_screen_view.dart';
import 'package:storyhub/feature/stats/view/sorting_page_view.dart';
import 'package:storyhub/product/model/player_selection_model.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../../../product/model/button_sound.dart';
import '../../../settings/model/game_settings_model.dart';
import '../../voteScreen/model/vote_model.dart';
import '../model/player_model.dart';
import '../view/create_player_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class CreatePlayerViewModel extends State<CreatePlayerView> {
  static bool isEmpty = false;
  static bool isReady = false;

  TextField playerNameCreateTextField(
    BuildContext context,
    List<TextEditingController>? textEditingControllers,
    List<bool>? textValueisEmpty,
    int? order,
  ) {
    return TextField(
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            textValueisEmpty![order! - 1] = false;
          } else {
            textValueisEmpty![order! - 1] = true;
          }
        });
      },
      maxLines: 1,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
      controller: textEditingControllers![order!],
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: AppLocalizations.of(context)!.createPlayerName,
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

PlayerSelectionModel createPlayer(BuildContext context, int i) {
  return PlayerSelectionModel(
      imgPath: Provider.of<Player>(context, listen: false).playerList[i].image,
      playerName:
          Provider.of<Player>(context, listen: false).playerList[i].name);
}

Widget buildFirstButton(
  List<TextEditingController> textEditingControllers,
  BuildContext context,
  bool isCheck,
  Map<String, dynamic>? myMap,
  List<bool> myList,
) {
  bool checkIsChechk = false;
  ButtonSound sound = ButtonSound();
  return SizedBox(
    width: MediaQuery.of(context).size.width / 1.4,
    height: MediaQuery.of(context).size.height / 13,
    child: OutlinedButton(
      onPressed: () {
        
        sound.playButtonSound(context);
        for (bool element in myList) {
          if (element == true) {
            checkIsChechk = true;
          } else if (element == false) {
            checkIsChechk = false;
            break;
          }
        }
        if (checkIsChechk == true) {
          isCheck = true;
        }
        if (isCheck == true) {
          Provider.of<Player>(context, listen: false)
              .createList(context, textEditingControllers, 1, 1);
          List<PlayerSelectionModel> tempList = <PlayerSelectionModel>[
            for (int i = 0;
                i <
                    Provider.of<GameSettingsModel>(context, listen: false)
                        .playerCount;
                i++)
              (createPlayer(context, i)),
          ];
          Provider.of<PlayerCarouselViewModel>(context, listen: false)
              .playerList = tempList;

          Provider.of<Player>(
            context,
            listen: false,
          ).playerList.forEach((element) {
            element.isVote = false;
          });

          Provider.of<Vote>(context, listen: false).counterForTour = 0;
          Provider.of<Vote>(context, listen: false).isFinishVote = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SelectScenarioView()));

          //*******************TEST****************** */
          print(myMap);
          print(
            Provider.of<Player>(context, listen: false).playerList[0].image,
          );
          print(
            Provider.of<Player>(context, listen: false).playerList[0].name,
          );
          print(
            Provider.of<Player>(context, listen: false).playerList.length,
          );
          print(
            myList,
          );
          print(
            checkIsChechk,
          );
          print(
            Provider.of<GameSettingsModel>(context, listen: false).playerCount,
          );
        }
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5),
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromRGBO(0, 82, 4, 1),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(isCheck
            ? const Color.fromRGBO(143, 85, 203, 1)
            : const Color.fromRGBO(219, 96, 52, 1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      child: Text(
        AppLocalizations.of(context)!.createPlayerContinue,
        style: TextStyle(
          fontFamily: 'GamerStation',
          color: Colors.white,
          fontSize: 35,
        ),
      ),
    ),
  );
}
