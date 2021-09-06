import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/select_button.dart';
import 'package:tic_tac_toe/widgets/player_card.dart';
import 'package:tic_tac_toe/widgets/player.dart';
import 'package:tic_tac_toe/widgets/start_button.dart';

Player playerObject = Player();

class GameScreen extends StatefulWidget {
  final String player1Side;
  GameScreen({required this.player1Side});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    playerObject.getPlayerSides(widget.player1Side);
  }

  List<SelectButton> getSelectButtons() {
    List<SelectButton> buttons = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        buttons.add(SelectButton(onTapFunction: () => displaySide(i, j), boxSide: playerObject.matrix[i][j]));
      }
    }
    return buttons;
  }

  void displaySide(int x, int y) {
    setState(() {
      playerObject.updateMatrix(x, y);
      if (playerObject.checkWinner(x, y)) {
        Future.delayed(Duration(milliseconds: 100), () => setState(() => playerObject.winner = true));
      } else if (playerObject.count == 9) {
        Future.delayed(Duration(milliseconds: 100), () => setState(() => playerObject.draw = true));
      } else {
        playerObject.changeProfileCardColor();
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
                PlayerCard(player: 'Player 1', symbol: playerObject.p1, cardColor: playerObject.cardColorP1),
                SizedBox(width: 30.0),
                PlayerCard(player: 'Player 2', symbol: playerObject.p2, cardColor: playerObject.cardColorP2),
              ],
            ),
            Container(
              constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.width - 30.0,
              ),
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: playerObject.winner || playerObject.draw ? Text('winner or draw') : Wrap(children: getSelectButtons()),
            ),
            playerObject.winner || playerObject.draw
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: StartButton(
                        text: 'Restart',
                        textSize: 30.0,
                        textPadding: 10.0,
                        onPressed: () {
                          playerObject.resetData();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }
}
