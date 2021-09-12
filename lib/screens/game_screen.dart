import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/result_widget.dart';
import 'package:tic_tac_toe/widgets/gesture_detector_widget.dart';
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
    Player.resetStaticData();
    Player.player1 = true;
    player.getPlayerSides();
  }

  List<GestureDetectorWidget> getSelectButtons() {
    List<GestureDetectorWidget> buttons = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        buttons.add(
          GestureDetectorWidget(
            onTapFunction: () => displaySide(i, j),
            boxSide: Player.matrix[i][j],
            cardColor: Player.cardColors[i][j],
          ),
        );
      }
    }
    return buttons;
  }

  void displaySide(int x, int y) {
    setState(() {
      if (Player.matrix[x][y] == '' && !Player.finished) {
        player.updateMatrix(x, y);
        player.playSound();
        if (player.checkWinner(x, y)) {
          Player.finished = true;
          player.changeWinnerCardColor();
          Future.delayed(Duration(milliseconds: 100), () => setState(() => player.updateCardColors()));
          Future.delayed(
            Duration(milliseconds: 800),
            () => setState(() {
              Player.winner = true;
              player.playResultSound();
            }),
          );
        } else if (Player.count == 9) {
          Future.delayed(
            Duration(milliseconds: 800),
            () => setState(() {
              Player.draw = true;
              player.playResultSound();
            }),
          );
        } else {
          player.changeProfileCardColor();
        }
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
                PlayerCard(player: 'Player 1', symbol: Player.p1, cardColor: Player.cardColorP1),
                SizedBox(width: 30.0),
                PlayerCard(player: 'Player 2', symbol: Player.p2, cardColor: Player.cardColorP2),
              ],
            ),
            Player.winner || Player.draw
                ? ResultWidget(
                    player: player,
                    onPressed: () {
                      setState(() {
                        Player.resetStaticData();
                        player.changeProfileCardColor();
                      });
                    })
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
