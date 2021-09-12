import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/responsive_ui.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('TIC TAC TOE', textAlign: TextAlign.center, style: kTextStyle.copyWith(fontSize: ResponsiveUI.getFontSize(context, 50))),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: 'X', style: kXTextStyle.copyWith(fontSize: ResponsiveUI.getFontSize(context, 200.0))),
              TextSpan(text: 'O', style: kOTextStyle.copyWith(fontSize: ResponsiveUI.getFontSize(context, 200.0))),
            ]),
          ),
          ReusableButton(
            text: 'Pick a side',
            textSize: ResponsiveUI.getFontSize(context, 35.0),
            textPadding: 12.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PickUpScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
