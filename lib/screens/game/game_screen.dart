import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game/components/result_container.dart';
import 'package:tic_tac_toe/screens/game/components/card_gesture_detector.dart';
import 'package:tic_tac_toe/screens/game/components/profile_container.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/models/responsive_ui.dart';
import 'package:tic_tac_toe/utilities/audio_player.dart';

Player player = Player();

AudioPlayer audioPlayer = AudioPlayer();

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
                MyProfileContainer(player: 'Player 1', symbol: Player.p1, cardColor: Player.cardColorP1),
                SizedBox(width: 30.0),
                MyProfileContainer(player: 'Player 2', symbol: Player.p2, cardColor: Player.cardColorP2),
              ],
            ),
            Player.winner || Player.draw ? _buildResultWidget() : _buildGameContainer(context),
          ],
        ),
      ),
    );
  }

  Container _buildGameContainer(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
        width: ResponsiveUI.getWidth(context, 30.0),
        height: ResponsiveUI.getWidth(context, 30.0),
      ),
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Wrap(children: _buildCardButtons()),
    );
  }

  MyResultContainer _buildResultWidget() {
    return MyResultContainer(
      player: player,
      onPressed: () {
        setState(() {
          Player.resetStaticData();
          player.changeProfileCardColor();
        });
      },
    );
  }

  List<CardGestureDetector> _buildCardButtons() {
    List<CardGestureDetector> buttons = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        buttons.add(
          CardGestureDetector(
            onTapFunction: () => showPlayerSide(i, j),
            boxSide: Player.matrix[i][j],
            cardColor: Player.cardColors[i][j],
          ),
        );
      }
    }
    return buttons;
  }

  void showPlayerSide(int x, int y) {
    setState(() {
      if (Player.matrix[x][y] == '' && !Player.finished) {
        player.updateMatrix(x, y);
        audioPlayer.playSound(Player.side);
        if (player.checkWinner(x, y)) {
          Player.finished = true;
          player.changeWinnerCardColor();
          Future.delayed(Duration(milliseconds: 100), () => setState(() => player.updateCardColors()));
          Future.delayed(
            Duration(milliseconds: 800),
            () => setState(() {
              Player.winner = true;
              audioPlayer.playResultSound(Player.winner);
            }),
          );
        } else if (Player.count == 9) {
          Future.delayed(
            Duration(milliseconds: 800),
            () => setState(() {
              Player.draw = true;
              audioPlayer.playResultSound(Player.draw);
            }),
          );
        } else {
          player.changeProfileCardColor();
        }
      }
    });
  }
}
