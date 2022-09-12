import 'package:flutter/material.dart';
import 'package:storyhub/feature/home/createplayer/viewmodel/create_player_viewmodel.dart';
import 'package:storyhub/product/widgets/button/soru_isareti_button.dart';

class CreatePlayerView extends StatefulWidget {
  const CreatePlayerView({Key? key}) : super(key: key);

  @override
  State<CreatePlayerView> createState() => _CreatePlayerViewState();
}

class _CreatePlayerViewState extends CreatePlayerViewModel {
  var textFieldController = TextEditingController();
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenHeight = screenInfo.size.height;
    var screenWidth = screenInfo.size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 128, 106, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 15),
                    child: SizedBox(
                      height: screenHeight / 9,
                      width: screenWidth / 4,
                      child: Image.asset(
                        'assets/images/LogoV1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 50,
                  top: 120,
                  child: SoruIsaretiButton(
                    myHeight: screenHeight / 2,
                    myWidth: screenWidth / 1.5,
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 300,
                  child: playerNameCreateContainer(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container playerNameCreateContainer(BuildContext context) {
    return Container(
      height: 100,
      width: 350,
      decoration: playerNameCreateContainerDecoration(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Image.asset('assets/images/human/human1.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
                height: 30,
                width: 130,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        isEmpty = false;
                      } else {
                        isEmpty = true;
                      }
                    });
                  },
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                  controller: textFieldController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    hintText: "İsim",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    fillColor: Colors.red,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                )),
          ),
          isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.check)))
              : Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.cancel)),
                ),
        ],
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
