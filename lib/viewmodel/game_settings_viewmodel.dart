import 'package:storyhub/model/game_settings_model.dart';

class GameSettingsViewmodel extends GameSettingsModel {
  Map<String, int>? catchData;

  GameSettingsViewmodel(
      {required super.playerCount,
      required super.timerValue,
      required super.roundSpeedValue,
      required super.roundCount,
      this.catchData});

  void init() {
    catchData = {
      "playerCount": playerCount,
      "timerValue": timerValue,
      "roundSpeedValue": roundSpeedValue,
      "roundCount": roundCount
    };
  }

  void update(String cardsNumber, String playerNumber, String scenario,
      String totalTime, String tourNumber) {
    catchData?.update("playerCount", (value) => playerCount);
    catchData?.update("timerValue", (value) => timerValue);
    catchData?.update("roundSpeedValue", (value) => roundSpeedValue);
    catchData?.update("roundCount", (value) => roundCount);
  }

  void clear() {
    catchData?.clear();
  }
}
