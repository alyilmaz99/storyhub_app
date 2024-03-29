import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/Service/ad_mob_service.dart';
import '../model/vote_model.dart';
import '../viewmodel/vote_screen_viewmodel.dart';
import '../../../settings/model/game_settings_model.dart';
import '../../../../product/widgets/button/nasil_oylama_soru_isareti_button.dart';

class VoteScreenView extends StatefulWidget {
  const VoteScreenView({Key? key}) : super(key: key);

  @override
  State<VoteScreenView> createState() => _VoteScreenViewState();
}

class _VoteScreenViewState extends VoteScreenViewModel {
  @override
  void initState() {
    super.initState();
    if (Provider.of<Vote>(context, listen: false).counterForTour ==
        Provider.of<GameSettingsModel>(context, listen: false).playerCount) {
      for (int i = 0;
          i <
              Provider.of<GameSettingsModel>(context, listen: false)
                  .playerCount;
          i++) {
        Provider.of<Vote>(context, listen: false)
            .playerList3[i]
            .playerVoteNumber = 3;
      }
    }
    Provider.of<Vote>(
      context,
      listen: false,
    ).setPlayerList(context);
    Provider.of<Vote>(
      context,
      listen: false,
    ).setPlayerSort(context);
    Provider.of<Vote>(
      context,
      listen: false,
    ).setPlayerScore(context);
    print(Provider.of<Vote>(
      context,
      listen: false,
    ).playerList2.length);
    Provider.of<Vote>(
      context,
      listen: false,
    ).setPlayerVoteNumber(context);
  }

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
            colors: [
              Color.fromRGBO(255, 149, 113, 1),
              Color.fromRGBO(216, 91, 47, 1)
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight / 20, left: screenWidth / 2.5),
                    child: SizedBox(
                      height: screenHeight / 14,
                      width: screenWidth / 4,
                      child: SvgPicture.asset(
                        'assets/images/LogoV1.svg',
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: screenHeight / 22,
                      top: screenWidth / 9,
                    ),
                    child: NasilOylamaSoruIsaretiButton(
                      myHeight: screenHeight / 8,
                      myWidth: screenWidth / 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 50,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: screenHeight / 8,
                  width: screenWidth / 3,
                  child: Image.asset(
                    Provider.of<Vote>(context, listen: false).sendFirstImage(),
                  ),
                ),
              ],
            ),
            Scrollbar(
              radius: const Radius.circular(20.0),
              thumbVisibility: true,
              thickness: 5,
              child: SizedBox(
                height: screenHeight / 1.8,
                width: screenWidth / 1.05,
                child: ListView.builder(
                  itemCount:
                      Provider.of<GameSettingsModel>(context).playerCount - 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight / 40),
                      child: PlayerVoteRateContainer(
                        fun2: () {
                          setState(() {});
                        },
                        screenWidth: screenWidth / 10,
                        screenHeight: screenHeight / 8,
                        name:
                            Provider.of<Vote>(context).playerList2[index].name,
                        //Provider.of<Player>(context).playerList[index + 1].name
                        imagePath:
                            Provider.of<Vote>(context).playerList2[index].image,
                        indexincontainer: index,
                      ),
                    );
                  },
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
