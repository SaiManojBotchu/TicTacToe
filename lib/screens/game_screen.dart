import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF36268C),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerCard(player: 'Player 1', symbol: 'X'),
                SizedBox(width: 30.0),
                PlayerCard(player: 'Player 2', symbol: 'O'),
              ],
            ),
            Container(
              constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.width - 30.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF6649C4),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Wrap(
                children: [
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                  SelectButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 30.0;
    double boxWidth = containerWidth / 3;
    print(boxWidth * 0.6);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        constraints: BoxConstraints.tightFor(
          width: boxWidth - 20.0,
          height: boxWidth - 20.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF28175C),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'X',
            style: TextStyle(
              color: kBackgroundColor,
              fontSize: boxWidth * 0.6,
              fontWeight: FontWeight.w600,
              fontFamily: 'Carter',
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final String player;
  final String symbol;

  const PlayerCard({required this.player, required this.symbol});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF28175C),
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
              color: kBackgroundColor,
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
