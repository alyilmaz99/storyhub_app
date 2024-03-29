import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/Service/ad_mob_service.dart';
import '../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../../home/voteScreen/model/vote_model.dart';
import 'sorting_table_view.dart';
import '../viewmodel/sorting_page_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../product/model/button_sound.dart';

class SortingPageView extends SortingPageViewModel {
  const SortingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<AdMobService>(context, listen: false).initAd();
    //Button//sound //sound = Button//sound();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              Color.fromARGB(255, 253, 163, 133),
              Color.fromRGBO(216, 91, 47, 1),
            ],
            radius: 0.7,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 13),
                    child: SizedBox(
                      // height: screenHeight / 10,
                      width: screenWidth / 4,
                      height: screenHeight / 15,
                      child: SvgPicture.asset(
                        'assets/images/LogoV1.svg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            Text(
              AppLocalizations.of(context)!.sortingPageArrangement,
              style: TextStyle(
                fontFamily: 'GamerStation',
                fontSize: 40,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(0, 5.0),
                    blurRadius: 6.0,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(
              context,
              const Color.fromRGBO(255, 221, 85, 1),
              Provider.of<Vote>(context).showSortingImage(0),
              'assets/images/first.svg',
              Provider.of<Vote>(context).showSortingName(0),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(
              context,
              const Color.fromRGBO(220, 229, 246, 1),
              Provider.of<Vote>(context).showSortingImage(1),
              'assets/images/second.svg',
              Provider.of<Vote>(context).showSortingName(1),
            ),
            SizedBox(
              height: screenHeight / 25,
            ),
            buildContainer(
              context,
              const Color.fromRGBO(232, 93, 70, 1),
              Provider.of<Vote>(context).showSortingImage(2),
              'assets/images/third.svg',
              Provider.of<Vote>(context).showSortingName(2),
            ),
            SizedBox(
              height: screenHeight / 15,
            ),
            ElevatedButton(
              onPressed: () {
                //sound.playButton//sound(context);
                Provider.of<AdMobService>(context, listen: false)
                    .showAdInterstitialAd();
                HapticFeedback.lightImpact();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const SortingTableView()),
                    (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: const Color.fromRGBO(216, 91, 47, 1),
                  minimumSize: Size(screenWidth / 1.7, screenHeight / 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Text(
                AppLocalizations.of(context)!.sortingPageMainMenu,
                style: const TextStyle(
                    fontFamily: 'GamerStation',
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
