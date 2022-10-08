import 'package:flutter/widgets.dart';

class Vote with ChangeNotifier {
  String? fromWho;
  String? toWho;
  int? point;
  Vote(this.fromWho, this.toWho, this.point);

  // Future<int> givePoint(BuildContext context, String? fromWho, String? toWho, int? point) async {
  //   if(Provider.of<Player>(context).playersMap!.values.contains(fromWho)){
  //     Provider.of<Player>(context).playersMap!<'name',toWho>
  //   }
  //   return 50;
  // }
}
