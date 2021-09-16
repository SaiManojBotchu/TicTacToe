import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
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
          _buildDivider(),
          VolumeSettings(),
          _buildDivider(),
          PlayerSettings(playerIndex: 0),
          _buildSizedBox(),
          _buildAvatarText(0),
          _buildDivider(),
          PlayerSettings(playerIndex: 1),
          _buildSizedBox(),
          _buildAvatarText(1),
        ],
      ),
    );
  }

  SizedBox _buildSizedBox() => SizedBox(height: 10.0);

  Widget _buildDivider() => Divider(thickness: 3.0, height: 30.0);

  Row _buildAvatarText(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSizedBox(),
        Text('Avatar', style: TextStyle(color: kTextColor, fontSize: 20.0)),
        SizedBox(width: 10.0),
        MyToggleButtons(index),
      ],
    );
  }
}
