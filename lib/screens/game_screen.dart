import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/result_widget.dart';
import 'package:tic_tac_toe/widgets/select_button.dart';
import 'package:tic_tac_toe/widgets/player_card.dart';
import 'package:tic_tac_toe/widgets/player.dart';

Player player = Player();

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    player.getPlayerSides();
  }

  List<SelectButton> getSelectButtons() {
    List<SelectButton> buttons = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        buttons.add(
          SelectButton(
            onTapFunction: () => displaySide(i, j),
            boxSide: player.matrix[i][j],
            cardColor: player.cardColors[i][j],
          ),
        );
      }
    }
    return buttons;
  }

  void displaySide(int x, int y) {
    setState(() {
      player.updateMatrix(x, y);
      if (player.checkWinner(x, y)) {
        player.updateCardColors();
        Future.delayed(Duration(milliseconds: 1000), () => setState(() => player.winner = true));
      } else if (player.count == 9) {
        Future.delayed(Duration(milliseconds: 100), () => setState(() => player.draw = true));
      } else {
        player.changeProfileCardColor();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerCard(player: 'Player 1', symbol: player.p1, cardColor: player.cardColorP1),
                SizedBox(width: 30.0),
                PlayerCard(player: 'Player 2', symbol: player.p2, cardColor: player.cardColorP2),
              ],
            ),
            player.winner || player.draw
                ? ResultWidget(player: player)
                : Container(
                    constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: MediaQuery.of(context).size.width - 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Wrap(children: getSelectButtons()),
                  ),
          ],
        ),
      ),
    );
  }
}
