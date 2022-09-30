import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/const/text_const/textconst.dart';
import '../../../../core/components/popup/FinalPopup.dart';
import '../../../../product/model/player_selection_model.dart';
import '../viewmodel/final_page_viewmodel.dart';

class FinalPageView extends StatefulWidget {
  const FinalPageView({Key? key}) : super(key: key);

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPageView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    /* ----- GEÇİCİ ----- */
    /* ----- Kullanıcıların sayfada nasıl gözüktüğünü görmek için şimdilik buradaki listede tutuluyor ----- */
    /* ----- Normalde dışarıdan gelecek ----- */

    List<PlayerSelectionModel> tempList = [
      PlayerSelectionModel(
          imgPath: "assets/images/human/human1.png", playerName: "Player 1"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human2.png", playerName: "Player 2"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human3.png", playerName: "Player 3"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human1.png", playerName: "Player 4"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human2.png", playerName: "Player 5"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human3.png", playerName: "Player 7"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human2.png", playerName: "Player 8"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human3.png", playerName: "Player 9"),
      PlayerSelectionModel(
          imgPath: "assets/images/human/human3.png", playerName: "Player 9"),
    ];

    /* ----- Gelen liste bu sayfanın viewmodeline işlenebilmesi için bu fonksiyonla atılacak ----- */
    Provider.of<FinalPageViewModel>(context).setPlayerList(tempList);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 20,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/LogoV1.png'),
                ),
              )
            ],
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(radius: 1, colors: [
              // Color.fromARGB(255, 61, 16, 91), Eski renkler
              // Color.fromARGB(255, 36, 10, 63),
              // Color.fromARGB(255, 19, 6, 45),
              // Color.fromARGB(255, 13, 5, 38),
              Color.fromARGB(255, 59, 52, 114),
              Color.fromARGB(255, 59, 52, 114),
              Color.fromARGB(255, 42, 37, 80),
              Color.fromARGB(255, 37, 29, 58)
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: screenHeight / 10)),
                CircleAvatar(
                  radius: screenHeight / 15,
                  backgroundImage: AssetImage(
                      /* ----- Seçilen kullanıcının profil resmi ----- */
                      Provider.of<FinalPageViewModel>(context).choosenImgPath),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth / 5,
                        child: IconButton(
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(context)
                                  .modalBarrierDismissLabel,
                              barrierColor: Colors.black.withOpacity(0.5),
                              pageBuilder: (context, animation1, animation2) =>
                                  FinalPopup(),
                              transitionDuration:
                                  const Duration(milliseconds: 250),
                              transitionBuilder: (context, a1, a2, widget) {
                                return Transform.scale(
                                  scale: a1.value,
                                  child: Opacity(
                                    opacity: a1.value,
                                    child: widget,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        width: (screenWidth / 5) * 2,
                        height: screenHeight / 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          /* ----- Seçilen kullanıcının ismi ----- */
                          Provider.of<FinalPageViewModel>(context).choosenName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 5,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 30),
                          ),
                          onPressed: () {},
                          child: IconButton(
                            icon: const Icon(
                              Icons.shuffle_outlined,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            onPressed: () {
                              /* ----- Burada random bir kullanıcı seçiliyor----- */
                              Provider.of<FinalPageViewModel>(context,
                                      listen: false)
                                  .randomChoose();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: screenHeight / 2,
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: screenHeight / 30),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          crossAxisCount: 3,
                        ),
                        itemCount: Provider.of<FinalPageViewModel>(context)
                            .playerList
                            .length,
                        /* ----- Burada kullanıcıların listesi build ediliyor ----- */
                        itemBuilder: (context, index) {
                          var data =
                              Provider.of<FinalPageViewModel>(context).getMap();
                          var data2 = Provider.of<FinalPageViewModel>(context)
                              .getPlayerList();
                          return GestureDetector(
                            onTap: () {
                              Provider.of<FinalPageViewModel>(context,
                                      listen: false)
                                  .changeMap(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: data[index] == true
                                      ? Colors.orange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50)),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(data2[index].imgPath),
                              ),
                            ),
                          );
                        })),
                Padding(padding: EdgeInsets.only(top: screenHeight / 30)),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 23, 12, 51)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 30,
                    alignment: Alignment.center,
                    child: const Text(
                      TextConst.connectFinalTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'GamerStation',
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )));
  }
}
