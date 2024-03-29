// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carouselItemView.dart';
import 'playerCarouselViewModel.dart';

Widget carousel(BuildContext context, double screenHeight, double screenWidth,
    bool isOpen) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.only(
        top: screenHeight / 40,
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (isOpen) {
                        Provider.of<PlayerCarouselViewModel>(context,
                                listen: false)
                            .carouselPrevious();
                        Provider.of<PlayerCarouselViewModel>(context,
                                listen: false)
                            .counter--;
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: screenWidth / 14,
                    )),
                carouselItem(
                    context,
                    Provider.of<PlayerCarouselViewModel>(context)
                        .playerList[
                            Provider.of<PlayerCarouselViewModel>(context)
                                .firstIndex()]
                        .imgPath,
                    MediaQuery.of(context).size.width / 6.5,
                    MediaQuery.of(context).size.height / 13,
                    0.5,
                    Provider.of<PlayerCarouselViewModel>(context)
                        .playerList[
                            Provider.of<PlayerCarouselViewModel>(context)
                                .firstIndex()]
                        .playerName),
                SizedBox(
                  width: screenWidth / 25,
                ),
                carouselItem(
                    context,
                    Provider.of<PlayerCarouselViewModel>(context)
                        .playerList[
                            Provider.of<PlayerCarouselViewModel>(context)
                                .selectedIndex()]
                        .imgPath,
                    MediaQuery.of(context).size.width / 5,
                    MediaQuery.of(context).size.height / 10,
                    1.0,
                    Provider.of<PlayerCarouselViewModel>(context)
                        .playerList[
                            Provider.of<PlayerCarouselViewModel>(context)
                                .selectedIndex()]
                        .playerName),
                SizedBox(
                  width: screenWidth / 25,
                ),
                carouselItem(
                    context,
                    Provider.of<PlayerCarouselViewModel>(context)
                        .playerList[
                            Provider.of<PlayerCarouselViewModel>(context)
                                .thirdIndex()]
                        .imgPath,
                    MediaQuery.of(context).size.width / 6.5,
                    MediaQuery.of(context).size.height / 13,
                    0.5,
                    Provider.of<PlayerCarouselViewModel>(context)
                        .playerList[
                            Provider.of<PlayerCarouselViewModel>(context)
                                .thirdIndex()]
                        .playerName),
                IconButton(
                    onPressed: () {
                      if (isOpen) {
                        Provider.of<PlayerCarouselViewModel>(context,
                                listen: false)
                            .carouselNext();
                        Provider.of<PlayerCarouselViewModel>(context,
                                listen: false)
                            .counter++;
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: screenWidth / 15,
                    )),
              ],
            ),
            SizedBox(
              height: screenHeight / 50,
            ),
          ],
        ),
      ),
    ),
  );
}
