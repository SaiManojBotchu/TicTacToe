import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer = AssetsAudioPlayer();

class AudioPlayer {
  static Map<String, String> notesMap = {
    'X': 'assets/audios/note1.wav',
    'O': 'assets/audios/note2.wav',
  };

  void playSound(String side) {
    try {
      assetsAudioPlayer.open(Audio('${notesMap[side]}'));
    } catch (e) {
      print('cannot play audio');
    }
  }

  void playResultSound(bool winner) {
    try {
      assetsAudioPlayer.open(
        Audio(winner ? 'assets/audios/winner.wav' : 'assets/audios/draw.mp3'),
      );
    } catch (e) {
      print('cannot play audio');
    }
  }
}
