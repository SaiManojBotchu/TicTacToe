import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class PlayerCard extends StatelessWidget {
  final String player;
  final String symbol;
  final Color cardColor;

  const PlayerCard({required this.player, required this.symbol, required this.cardColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
        border: cardColor == kActiveCardColor ? Border.all(color: Colors.white) : null,
      ),
      constraints: BoxConstraints.tightFor(
        width: 110.0,
        height: 125.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(player, style: kSmallTextStyle.copyWith(fontSize: 15.0)),
          Text(symbol, style: kSmallTextStyle.copyWith(color: symbol == 'X' ? kXColor : kOColor)),
        ],
      ),
    );
  }
}
