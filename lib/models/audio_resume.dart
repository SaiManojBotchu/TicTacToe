import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/utilities/audio_player.dart';
import 'package:tic_tac_toe/models/settings.dart';

class Handler extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Settings.audioValues[1]) {
      if (state == AppLifecycleState.resumed) {
        AudioPlayer.playMusic(); // Audio player is a custom class with resume and pause static methods
      } else {
        AudioPlayer.pauseMusic();
      }
    }
  }
}
