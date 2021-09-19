import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer = AssetsAudioPlayer();
final assetsAudioPlayer1 = AssetsAudioPlayer();

class AudioPlayer {
  static Map<String, String> notesMap = {
    'X': 'assets/audios/note1.wav',
    'O': 'assets/audios/note2.wav',
  };

  static void playSound(String side) {
    try {
      assetsAudioPlayer.open(Audio('${notesMap[side]}'));
    } catch (e) {
      print('cannot play audio');
    }
  }

  static void playResultSound(bool winner) {
    try {
      assetsAudioPlayer.open(
        Audio(winner ? 'assets/audios/winner.wav' : 'assets/audios/draw.mp3'),
      );
    } catch (e) {
      print('cannot play audio');
    }
  }

  static void playMusic() async {
    try {
      await assetsAudioPlayer1.open(
        Audio('assets/audios/music.mp3'),
      );
      await assetsAudioPlayer1.setLoopMode(LoopMode.single);
    } catch (e) {
      print('assetsAudioPlayer1 error: $e');
    }
  }

  static void stopMusic() {
    assetsAudioPlayer1.stop();
  }

  static void pauseMusic() {
    assetsAudioPlayer1.pause();
  }

  static void toggleLoop() {
    assetsAudioPlayer1.toggleLoop();
  }
}
