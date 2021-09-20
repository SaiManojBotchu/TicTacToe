import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/responsive_ui.dart';
import 'package:tic_tac_toe/screens/welcome/components/alert_dialog.dart';
import 'package:tic_tac_toe/screens/welcome/components/scaffold_body.dart';
import 'package:tic_tac_toe/utilities/audio_player.dart';
import 'package:tic_tac_toe/models/settings.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Settings.audioValues[1]) AudioPlayer.playMusic();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: MyScaffoldBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      title: Center(
        child: Text(
          'TIC TAC TOE',
          textAlign: TextAlign.center,
          style: kTextStyle.copyWith(
            fontSize: ResponsiveUI.getFontSize(context, 33.0),
          ),
        ),
      ),
      leading: IconButton(
        color: kTextColor,
        iconSize: ResponsiveUI.getFontSize(context, 35.0),
        padding: EdgeInsets.zero,
        onPressed: () => MyAlertDialog.buildAlert(context),
        icon: Icon(Icons.menu),
      ),
    );
  }
}
