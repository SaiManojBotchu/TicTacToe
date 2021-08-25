import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'XO',
              style: TextStyle(
                color: kTextColor,
                fontSize: 200.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Carter',
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20.0),
                textColor: kBackgroundColor,
                color: kTextColor,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  'Start',
                  style: TextStyle(fontFamily: 'Paytone', fontSize: 35.0),
                ),
                onPressed: () {
                  // Do Something
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
