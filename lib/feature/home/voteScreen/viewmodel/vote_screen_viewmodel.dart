import 'package:flutter/cupertino.dart';
import 'package:storyhub/feature/home/voteScreen/view/vote_screen_view.dart';

abstract class VoteScreenViewModel extends State<VoteScreenView> {
  BoxDecoration playerPlayerVoteContainerDecoration() {
    return const BoxDecoration(
      color: Color.fromRGBO(218, 153, 115, 0.8),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
  }
}

//OUT OF VoteScreenViewModel

