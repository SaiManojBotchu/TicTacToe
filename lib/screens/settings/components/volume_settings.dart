import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/settings.dart';
import 'package:tic_tac_toe/utilities/audio_player.dart';

class VolumeSettings extends StatefulWidget {
  @override
  _VolumeSettingsState createState() => _VolumeSettingsState();
}

class _VolumeSettingsState extends State<VolumeSettings> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Sound'),
        SizedBox(width: 10.0),
        _buildSwitchButtons(0),
        SizedBox(width: 20.0),
        Text('Music'),
        SizedBox(width: 10.0),
        _buildSwitchButtons(1),
      ],
    );
  }

  _buildSwitchButtons(int index) {
    return Switch.adaptive(
      activeColor: kBackgroundColor,
      inactiveTrackColor: kContainerColor,
      inactiveThumbColor: kTextColor,
      value: Settings.audioValues[index],
      onChanged: (v) => setState(() {
        Settings.audioValues[index] = v;
        if (index == 1) _musicHandler();
      }),
    );
  }

  void _musicHandler() {
    if (Settings.audioValues[1]) {
      AudioPlayer.playMusic();
    } else if (!Settings.audioValues[1]) {
      AudioPlayer.toggleLoop();
      AudioPlayer.stopMusic();
    }
  }
}
