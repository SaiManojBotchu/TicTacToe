import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/settings.dart';
import 'package:tic_tac_toe/screens/game/components/alert_result.dart';
import 'package:tic_tac_toe/screens/game/components/result_container.dart';
import 'package:tic_tac_toe/screens/game/components/card_gesture_detector.dart';
import 'package:tic_tac_toe/screens/game/components/profile_container.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/models/responsive_ui.dart';
import 'package:tic_tac_toe/utilities/audio_player.dart';
import 'package:tic_tac_toe/screens/game/components/score_container.dart';

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
    Player.resetData1();
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyProfileContainer(playerIndex: 0, symbol: Player.p1, cardColor: Player.cardColorP1),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    Text('D', style: kTextStyle.copyWith(fontSize: 30.0, color: Colors.blue)),
                    MyScoreContainer('${Player.drawScore}'),
                  ],
                ),
                SizedBox(width: 10.0),
                MyProfileContainer(playerIndex: 1, symbol: Player.p2, cardColor: Player.cardColorP2),
              ],
            ),
            Player.completed ? _buildResultContainer() : Expanded(child: _buildGameContainer(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildGameContainer(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.tightFor(
          width: ResponsiveUI.getWidth(context, 30.0),
          height: ResponsiveUI.getWidth(context, 30.0),
        ),
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Wrap(children: _buildCardButtons()),
      ),
    );
  }

  MyResultContainer _buildResultContainer() {
    return MyResultContainer(
      player: player,
      onPressed: () {
        setState(() {
          Player.resetStaticData();
          Player.resetData1();
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
        if (Settings.audioValues[0]) AudioPlayer.playSound(Player.side);
        if (player.checkWinner(x, y)) {
          winnerLogic();
        } else if (Player.count == 9) {
          drawLogic();
        } else {
          player.changeProfileCardColor();
        }
      }
    });
  }

  void winnerLogic() {
    Player.finished = true;
    player.changeWinnerCardColor();
    Future.delayed(Duration(milliseconds: 100), () => setState(() => player.updateCardColors()));
    Future.delayed(
      Duration(milliseconds: 800),
      () => setState(() {
        Player.winner = true;
        Player.updateScores();
        if (!Player.completed) MyAlert.showAlert(context, '${Player.getAlertTitle()}', '😎', nextRoundFunc);
        if (Settings.audioValues[0]) AudioPlayer.playResultSound(Player.winnerPlayer);
      }),
    );
  }

  void drawLogic() {
    Future.delayed(
      Duration(milliseconds: 800),
      () => setState(() {
        Player.draw = true;
        Player.updateScores();
        if (!Player.completed) MyAlert.showAlert(context, '${Player.getAlertTitle()}', '😔', nextRoundFunc);
        if (Settings.audioValues[0]) AudioPlayer.playResultSound(Player.winnerPlayer);
      }),
    );
  }

  void nextRoundFunc() {
    setState(() {
      Player.resetStaticData();
      player.changeProfileCardColor();
      Navigator.pop(context);
    });
  }
}
