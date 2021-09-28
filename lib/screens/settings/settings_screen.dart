import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/settings/components/score_settings.dart';
import 'package:tic_tac_toe/screens/settings/components/toggle_buttons.dart';
import 'package:tic_tac_toe/screens/settings/components/volume_settings.dart';
import 'package:tic_tac_toe/screens/settings/components/player_settings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const Divider(thickness: 3.0, height: 0.0),
          VolumeSettings(),
          const Divider(thickness: 3.0, height: 0.0),
          const SizedBox(height: 10.0),
          PlayerSettings(playerIndex: 0),
          const SizedBox(height: 7.0),
          _buildAvatarSettings(0),
          const Divider(thickness: 3.0, height: 10.0),
          const SizedBox(height: 5.0),
          PlayerSettings(playerIndex: 1),
          const SizedBox(height: 7.0),
          _buildAvatarSettings(1),
          const Divider(thickness: 3.0, height: 10.0),
          ScoreSettings(0),
          ScoreSettings(1),
        ],
      ),
    );
  }

  Row _buildAvatarSettings(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 50.0, height: 10.0),
        const Text('Avatar', style: TextStyle(fontSize: 19.0)),
        const SizedBox(width: 10.0),
        MyToggleButtons(index),
      ],
    );
  }
}
