import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/player.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';

class ResultWidget extends StatelessWidget {
  final Player player;

  ResultWidget({required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.width - 30.0,
          ),
          decoration: BoxDecoration(
            color: kContainerColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                player.winner ? 'assets/images/win.png' : 'assets/images/draw.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              Text(
                player.winner ? player.getWinnerText() : 'Draw',
                style: TextStyle(fontSize: 50.0, fontFamily: 'Paytone', fontWeight: FontWeight.w500, color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(height: 50.0),
        ReusableButton(
          text: 'Restart',
          textSize: 30.0,
          textPadding: 10.0,
          onPressed: () {
            player.resetData();
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
