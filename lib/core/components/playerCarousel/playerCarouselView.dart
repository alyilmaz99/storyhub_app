import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyhub/core/components/playerCarousel/carouselItemView.dart';
import 'package:storyhub/core/components/playerCarousel/playerCarouselViewModel.dart';

Widget carousel(BuildContext context, double screenHeight, double screenWidth) {
  return Padding(
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
                    Provider.of<PlayerCarouselViewModel>(context, listen: false)
                        .carouselPrevious();
                    Provider.of<PlayerCarouselViewModel>(context, listen: false)
                        .counter--;
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: screenWidth / 10,
                  )),
              carouselItem(
                  context,
                  Provider.of<PlayerCarouselViewModel>(context)
                      .playerList[Provider.of<PlayerCarouselViewModel>(context)
                          .firstIndex()]
                      .imgPath,
                  MediaQuery.of(context).size.width / 6,
                  MediaQuery.of(context).size.height / 12,
                  0.5,
                  Provider.of<PlayerCarouselViewModel>(context)
                      .playerList[Provider.of<PlayerCarouselViewModel>(context)
                          .firstIndex()]
                      .playerName),
              SizedBox(
                width: screenWidth / 23,
              ),
              carouselItem(
                  context,
                  Provider.of<PlayerCarouselViewModel>(context)
                      .playerList[Provider.of<PlayerCarouselViewModel>(context)
                          .selectedIndex()]
                      .imgPath,
                  MediaQuery.of(context).size.width / 4,
                  MediaQuery.of(context).size.height / 8,
                  1.0,
                  Provider.of<PlayerCarouselViewModel>(context)
                      .playerList[Provider.of<PlayerCarouselViewModel>(context)
                          .selectedIndex()]
                      .playerName),
              SizedBox(
                width: screenWidth / 23,
              ),
              carouselItem(
                  context,
                  Provider.of<PlayerCarouselViewModel>(context)
                      .playerList[Provider.of<PlayerCarouselViewModel>(context)
                          .thirdIndex()]
                      .imgPath,
                  MediaQuery.of(context).size.width / 6,
                  MediaQuery.of(context).size.height / 12,
                  0.5,
                  Provider.of<PlayerCarouselViewModel>(context)
                      .playerList[Provider.of<PlayerCarouselViewModel>(context)
                          .thirdIndex()]
                      .playerName),
              IconButton(
                  onPressed: () {
                    Provider.of<PlayerCarouselViewModel>(context, listen: false)
                        .carouselNext();
                    Provider.of<PlayerCarouselViewModel>(context, listen: false)
                        .counter++;
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: screenWidth / 10,
                  )),
            ],
          ),
          SizedBox(
            height: screenHeight / 40,
          ),
        ],
      ),
    ),
  );
}
