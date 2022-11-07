import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyhub/core/components/playerCarousel/playerCarouselViewModel.dart';
import 'package:storyhub/feature/auth/howtoplay/model/how_to_play_model.dart';
import 'package:storyhub/feature/auth/splashscreen/view/splashscreenview.dart';
import 'package:storyhub/feature/home/final/view/final_page_view.dart';
import 'package:storyhub/feature/home/mainpage/view/main_page_view.dart';
import 'package:storyhub/feature/home/scenario/model/select_scenerio_model.dart';
import 'package:storyhub/feature/stats/view/sorting_table_view.dart';
import 'feature/auth/splashscreen/view/splashscreenview.dart';
import 'feature/home/createplayer/model/player_model.dart';
import 'feature/home/voteScreen/model/vote_model.dart';
import 'product/model/player_selection_model.dart';
import 'feature/home/final/viewmodel/final_page_viewmodel.dart';
import 'feature/settings/model/game_settings_model.dart';
import 'feature/settings/model/settings_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* GELİŞTİRME İÇİN GEÇİCİ LİSTE
     LİSTE GEREKLİ PARAMETLERE DIŞARIDAN VERİLİNCE BU KALDIRILACAK */
  List<PlayerSelectionModel> tempList = [
    PlayerSelectionModel(
        imgPath: "assets/images/profiles/1.png", playerName: "Player 1"),
    PlayerSelectionModel(
        imgPath: "assets/images/profiles/2.png", playerName: "Player 2"),
    PlayerSelectionModel(
        imgPath: "assets/images/profiles/3.png", playerName: "Player 3"),
  ];
  final prefs = await SharedPreferences.getInstance();
  final showMainPage = prefs.getBool('showMainPage') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HowToPlayModel>(
            create: (BuildContext context) => HowToPlayModel()),
        ChangeNotifierProvider<PlayerCarouselViewModel>(
          create: (BuildContext context) => PlayerCarouselViewModel(
            playerList: tempList,
            map: {},
            choosenName: "isim",
            choosenImgPath: "assets/images/blankPerson.jpg",
            index: 0,
            countTour: 1,
          ),
        ),
        ChangeNotifierProvider<SelectScenarioModel>(
          create: (BuildContext context) => SelectScenarioModel(),
        ),
        ChangeNotifierProvider<SettingsModel>(
            create: (BuildContext context) => SettingsModel()),
        ChangeNotifierProvider<GameSettingsModel>(
            create: (BuildContext context) => GameSettingsModel(
                playerCount: 3,
                timerValue: 20,
                roundSpeedValue: 1,
                roundCount: 3)),
        ChangeNotifierProvider<FinalPageViewModel>(
            create: (BuildContext context) => FinalPageViewModel(
                isFinal: false,
                playerList: tempList,
                map: {},
                choosenName: "isim",
                choosenImgPath: "assets/images/blankPerson.jpg")),
        ChangeNotifierProvider<PlayerSelectionModel>(
          create: (BuildContext context) => PlayerSelectionModel(
            imgPath: "assets/images/human/human1.png",
            playerName: "Player 1",
          ),
        ),
        ChangeNotifierProvider<Player>(
          create: (BuildContext context) => Player(
            playerVoteNumber: 3,
            playerList: [],
            backupPlayersMap: {},
            id: 1,
            image: '',
            name: '',
            playersMap: {},
            rank: 1,
            score: 0,
            isVote: false,
          ),
        ),
        ChangeNotifierProvider<Vote>(
          create: (BuildContext context) => Vote(
            counter: 0,
          ),
        ),
      ],
      child: MyApp(
        showMainPage: showMainPage,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showMainPage;
  const MyApp({Key? key, required this.showMainPage}) : super(key: key);

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.amber,
            title: const Text("Do u want to exit app?"),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    minimumSize: Size(MediaQuery.of(context).size.width / 4.5,
                        MediaQuery.of(context).size.height / 30),
                    maximumSize: Size(MediaQuery.of(context).size.width / 4.5,
                        MediaQuery.of(context).size.height / 20),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("No")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Yes")),
            ],
          ));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return WillPopScope(
      onWillPop: () async {
        print("Back button pressed");
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Color.fromARGB(0, 189, 189, 189),
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('tr', ''), // Spanish, no country code
        ],
        home: const SplashScreenView(),
      ),
    );
  }
}
