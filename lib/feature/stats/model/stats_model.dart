class StatsModel {
  String cardsNumber;
  String playerNumber;
  String scenario;
  String totalTime;
  String tourNumber;
  StatsModel(
      {required this.cardsNumber,
      required this.playerNumber,
      required this.scenario,
      required this.totalTime,
      required this.tourNumber}) {
    cardsNumber = "0";
    playerNumber = "0";
    scenario = "none";
    totalTime = "0 mnt";
    tourNumber = "0";
  }
}
