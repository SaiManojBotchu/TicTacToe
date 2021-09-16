import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/settings.dart';

class PlayerSettings extends StatefulWidget {
  final int playerIndex;
  PlayerSettings({required this.playerIndex});

  @override
  _PlayerSettingsState createState() => _PlayerSettingsState();
}

class _PlayerSettingsState extends State<PlayerSettings> {
  @override
  void initState() {
    super.initState();
    Settings.getTextFieldValues();
  }

  @override
  void dispose() {
    super.dispose();
    Settings.updatePlayerNames();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Settings.playerRoleNames[widget.playerIndex],
          style: kTextStyle.copyWith(fontSize: 20.0, fontWeight: null, fontFamily: 'Coiny'),
        ),
        SizedBox(width: 10.0),
        SizedBox(width: 180.0, child: _buildTextField()),
      ],
    );
  }

  TextField _buildTextField() {
    return TextField(
      cursorColor: kXColor,
      maxLength: 10,
      controller: Settings.textControllers[widget.playerIndex],
      decoration: InputDecoration(
        filled: true,
        fillColor: kContainerColor,
        focusColor: Colors.red,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}