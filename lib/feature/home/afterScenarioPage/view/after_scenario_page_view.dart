import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/components/playerCarousel/playerCarouselView.dart';
import 'package:storyhub/feature/home/gamepage/view/CardPAge.dart';
import '../../../../core/components/playerCarousel/playerCarouselViewModel.dart';
import '../viewmodel/after_scenario_page_viewmodel.dart';
import '../../../drawer/view/drawer_view.dart';
import '../../gamepage/view/HomeCardsOrder.dart';

class AfterScenarioView extends StatefulWidget {
  const AfterScenarioView({super.key});

  @override
  State<AfterScenarioView> createState() => _AfterScenarioViewState();
}

class _AfterScenarioViewState extends AfterScenarioViewModel {
  @override
  void initState() {
    super.initState();
    Provider.of<PlayerCarouselViewModel>(context, listen: false).randomChoose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    CountDownController controller2 = CountDownController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(37, 29, 58, 1),
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: screenWidth / 7),
              height: screenHeight / 17,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/LogoV1.png'),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            colors: [
              Color.fromRGBO(59, 52, 114, 1),
              Color.fromRGBO(37, 29, 58, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 20,
            ),
            carousel(context, screenHeight, (screenWidth / 5) * 3),
            SizedBox(
              height: screenHeight / 10,
            ),
            buildFirstButton(
              context,
              'BAŞLAT',
              MediaQuery.of(context).size.height / 11,
              MediaQuery.of(context).size.width / 1.6,
              const Color.fromRGBO(223, 105, 64, 1).withOpacity(0.9),
              2,
            ),
            SizedBox(
              height: screenHeight / 15,
            ),
            buildFirstButton(
              context,
              'Senaryo',
              MediaQuery.of(context).size.height / 15,
              MediaQuery.of(context).size.width / 1.95,
              const Color.fromRGBO(143, 85, 203, 1).withOpacity(0.9),
              1,
            ),
          ],
        ),
      ),
    );
  }
}
