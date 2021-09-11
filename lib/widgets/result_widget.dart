import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/widgets/player.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:delayed_display/delayed_display.dart';

class ResultWidget extends StatelessWidget {
  final Player player;
  ResultWidget({required this.player});

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            constraints: BoxConstraints.tightFor(
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.width - 50.0,
            ),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Player.winner ? 'assets/images/win.png' : 'assets/images/draw.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Text(
                  Player.winner ? player.getWinnerText() : 'Draw',
                  style: kTextStyle,
                )
              ],
            ),
          ),
          SizedBox(height: 30.0),
          ReusableButton(
            text: 'Play Again',
            textSize: 30.0,
            textPadding: 8.0,
            onPressed: () {
              player.resetData();
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
            },
          ),
          ReusableButton(
            text: 'Home',
            textSize: 25.0,
            textPadding: 5.0,
            onPressed: () {
              player.resetData();
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
