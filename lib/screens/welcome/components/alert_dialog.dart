import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/settings/settings_screen.dart';

class MyAlertDialog {
  static AlertStyle alertStyle = AlertStyle(
    backgroundColor: kActiveCardColor,
    titleStyle: TextStyle(
      fontSize: 30.0,
      fontFamily: 'Coiny',
      fontWeight: FontWeight.bold,
    ),
    alertPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static Future buildAlert(context) {
    return Alert(
      context: context,
      padding: EdgeInsets.all(0.0),
      title: 'Settings',
      closeIcon: Icon(Icons.close),
      style: alertStyle,
      content: SettingsScreen(),
      buttons: [
        DialogButton(
          child: Text('Done'),
          onPressed: () => Navigator.pop(context),
          color: kBackgroundColor,
        ),
      ],
    ).show();
  }
}
