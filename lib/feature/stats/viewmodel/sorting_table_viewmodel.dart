import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/voteScreen/model/vote_model.dart';
import '../view/sorting_table_view.dart';

abstract class SortingTableViewmodel extends State<SortingTableView> {}

Widget buildContainers(
    BuildContext context, String image, String secondImage, int index) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
    width: screenWidth / 1.15,
    height: screenHeight / 8,
    decoration: const BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.transparent,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenWidth / 4.5,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(image),
          )),
        ),
        SizedBox(
          width: screenWidth / 20,
        ),
        Container(
          width: screenWidth / 3.0,
          height: screenHeight / 25,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              Provider.of<Vote>(context, listen: false).playerList3[index].name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth / 50,
        ),
        Container(
          width: screenWidth / 10,
          height: screenHeight / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/start.jpg'),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth / 40,
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight / 90),
          child: Text(
            'x'
            "${Provider.of<Vote>(context, listen: false).playerList3[index].score.toInt()}",
            style: const TextStyle(
              color: Color.fromRGBO(42, 37, 80, 1),
              fontSize: 30,
              fontFamily: 'GamerStation',
            ),
          ),
        ),
      ],
    ),
  );
}
