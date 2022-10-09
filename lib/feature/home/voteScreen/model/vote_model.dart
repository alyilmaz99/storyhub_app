import 'package:flutter/widgets.dart';

class Vote with ChangeNotifier {
  Future<List<String>> playerNameToList(Map<String, dynamic> myPlayerMap) async {
    List<String>? myNameList;
    myNameList != myPlayerMap.values.toList();
    return myNameList!;
  }
}
