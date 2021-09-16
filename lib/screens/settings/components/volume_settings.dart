import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/settings.dart';

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
        _buildCupertinoSwitch(0),
        SizedBox(width: 20.0),
        Text('Music'),
        SizedBox(width: 10.0),
        _buildCupertinoSwitch(1),
      ],
    );
  }

  CupertinoSwitch _buildCupertinoSwitch(int index) {
    return CupertinoSwitch(
      activeColor: kBackgroundColor,
      trackColor: kContainerColor,
      value: Settings.audioValues[index],
      onChanged: (v) => setState(() => Settings.audioValues[index] = v),
    );
  }
}
