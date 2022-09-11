import '../model/game_settings_model.dart';

class GameSettingsViewmodel extends GameSettingsModel {
  Map<String, int>? catchData;

  GameSettingsViewmodel(
      {required super.playerCount,
      required super.timerValue,
      required super.roundSpeedValue,
      this.catchData});

  void init() {
    catchData = {
      "playerCount": playerCount,
      "timerValue": timerValue,
      "roundSpeedValue": roundSpeedValue,
    };
  }

  void update(String cardsNumber, String playerNumber, String scenario,
      String totalTime, String tourNumber) {
    catchData?.update("playerCount", (value) => playerCount);
    catchData?.update("timerValue", (value) => timerValue);
    catchData?.update("roundSpeedValue", (value) => roundSpeedValue);
  }

  void clear() {
    catchData?.clear();
  }
}
