import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('TIC TAC TOE', textAlign: TextAlign.center, style: kTextStyle),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: 'X', style: kXTextStyle),
              TextSpan(text: 'O', style: kOTextStyle),
            ]),
          ),
          ReusableButton(
            text: 'Pick a side',
            textSize: 35.0,
            textPadding: 20.0,
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
