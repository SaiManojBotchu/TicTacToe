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
          _buildDivider(0.0),
          VolumeSettings(),
          _buildDivider(0.0),
          _buildSizedBox(10.0),
          PlayerSettings(playerIndex: 0),
          _buildSizedBox(7.0),
          _buildAvatarSettings(0),
          _buildDivider(10.0),
          _buildSizedBox(5.0),
          PlayerSettings(playerIndex: 1),
          _buildSizedBox(7.0),
          _buildAvatarSettings(1),
          _buildDivider(10.0),
          ScoreSettings(0),
          ScoreSettings(1),
        ],
      ),
    );
  }

  SizedBox _buildSizedBox(height) => SizedBox(height: height);

  Widget _buildDivider(double height) => Divider(thickness: 3.0, height: height);

  Row _buildAvatarSettings(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 50.0, height: 10.0),
        Text('Avatar', style: TextStyle(fontSize: 19.0)),
        SizedBox(width: 10.0),
        MyToggleButtons(index),
      ],
    );
  }
}
