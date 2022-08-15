import 'package:storyhub/model/stats_model.dart';

class StatsViewModel extends StatsModel {
  List<String>? catchData;

  StatsViewModel(
      {required super.cardsNumber,
      required super.playerNumber,
      required super.scenario,
      required super.totalTime,
      required super.tourNumber,
      this.catchData});

  void AddData(String data) {
    catchData?.add(data);
    print("Data added: catchData= ${catchData?.length}");
  }

  void DeleteData(String data) {
    catchData?.remove(data);
    print("Data deleted: catchdata = ${catchData?.length}");
  }

  void KillList() {
    catchData?.clear();
  }
}
