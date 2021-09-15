import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class MyProfileContainer extends StatelessWidget {
  final String player;
  final String symbol;
  final Color cardColor;

  const MyProfileContainer({required this.player, required this.symbol, required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
        border: cardColor == kActiveCardColor || cardColor == kWinnerCardColor ? Border.all(color: Colors.white) : null,
      ),
      constraints: BoxConstraints.tightFor(
        width: 110.0,
        height: 125.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(player, style: kTextStyle.copyWith(fontSize: 15.0)),
          Text(
            symbol,
            style: kTextStyle.copyWith(
              color: symbol == 'X' ? kXColor : kOColor,
              fontFamily: symbol == 'X' ? 'Carter' : 'Paytone',
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
