import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/start_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'TIC TAC TOE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextColor,
              fontSize: 60.0,
              fontFamily: 'Paytone',
            ),
          ),
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
              child: StartButton(
                text: 'Pick a side',
                textSize: 35.0,
                textPadding: 20.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PickUpScreen()),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
