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
        border: Border.all(color: Colors.white),
      ),
      constraints: BoxConstraints.tightFor(
        width: 110.0,
        height: 125.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            player,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            symbol,
            style: TextStyle(
              color: symbol == 'X' ? kXColor : kOColor,
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Carter',
            ),
          ),
        ],
      ),
    );
  }
}
