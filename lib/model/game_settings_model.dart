class GameSettingsModel {
  int playerCount;
  int timerValue;
  int roundSpeedValue;
  int diffuciltyValue;
  GameSettingsModel({
    required this.playerCount,
    required this.timerValue,
    required this.roundSpeedValue,
    required this.diffuciltyValue,
  }) {
    playerCount = 1;
    timerValue = 0;
    roundSpeedValue = 0;
    diffuciltyValue = 0;
  }
}
