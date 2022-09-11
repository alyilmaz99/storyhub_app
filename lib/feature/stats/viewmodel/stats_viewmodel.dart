import '../model/stats_model.dart';

class StatsViewModel extends StatsModel {
  Map<String, String>? catchData;

  StatsViewModel(
      {required super.cardsNumber,
      required super.playerNumber,
      required super.scenario,
      required super.totalTime,
      required super.tourNumber,
      this.catchData});
  void init() {
    catchData = {
      "cardsNumber": cardsNumber,
      "playerNumber": playerNumber,
      "scenario": scenario,
      "totalTime": totalTime,
      "tourNumber": tourNumber
    };
  }

  void update(String cardsNumber, String playerNumber, String scenario,
      String totalTime, String tourNumber) {
    catchData?.update("cardsNumber", (value) => cardsNumber);
    catchData?.update("playerNumber", (value) => playerNumber);
    catchData?.update("scenario", (value) => scenario);
    catchData?.update("totalTime", (value) => totalTime);
    catchData?.update("tourNumber", (value) => tourNumber);
  }

  void clear() {
    catchData?.clear();
  }
}
