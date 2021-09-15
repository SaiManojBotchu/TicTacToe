import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/settings/components/avatar_settings.dart';
import 'package:tic_tac_toe/screens/settings/components/volume_settings.dart';
import 'package:tic_tac_toe/screens/settings/components/player_settings.dart';

class SettingsScreen extends StatelessWidget {
  final TextEditingController textEditingControllerP1 = TextEditingController();
  final TextEditingController textEditingControllerP2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingControllerP1.text = 'Player 1';
    textEditingControllerP2.text = 'Player 2';
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          _buildDivider(),
          VolumeSettings(),
          _buildDivider(),
          PlayerSettings(playerName: 'Your Name', textEditingController: textEditingControllerP1),
          SizedBox(height: 10.0),
          AvatarSettings(),
          _buildDivider(),
          PlayerSettings(playerName: 'Opponent', textEditingController: textEditingControllerP2),
          SizedBox(height: 10.0),
          AvatarSettings(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(thickness: 3.0, height: 30.0);
  }
}
