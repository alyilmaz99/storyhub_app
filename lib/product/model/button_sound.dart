import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../feature/settings/model/settings_model.dart';


class ButtonSound{
   playButtonSound(BuildContext context){
     AssetsAudioPlayer.newPlayer().open(Audio("assets/button22.mp3"),
          volume: Provider.of<SettingsModel>(context, listen: false).buttonVolumeVal,
          autoStart: true,
          showNotification: true);
  }
}