import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/settings.dart';
import 'package:tic_tac_toe/screens/game/components/alert_result.dart';
import 'package:tic_tac_toe/screens/game/components/profile_container.dart';
import 'package:tic_tac_toe/screens/game/components/result_container.dart';
import 'package:tic_tac_toe/screens/game/components/card_gesture_detector.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/models/responsive_ui.dart';
import 'package:tic_tac_toe/screens/game/components/timer.dart';
import 'package:tic_tac_toe/screens/game/components/score_container.dart';
import 'package:tic_tac_toe/utilities/audio_player.dart';
import 'package:tic_tac_toe/screens/game/components/text_button.dart';

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
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  static const maxSeconds = 15;
  int seconds = maxSeconds;
  int pauseSeconds = 0;
  late Timer? timer;

  void resetTimer() => setState(() => seconds = maxSeconds);

  void stopTimer() => setState(() => timer!.cancel());

  void pauseTimer() => setState(() => pauseSeconds = seconds);

  void resumeTimer() => setState(() => seconds = pauseSeconds);

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0 && seconds < 16)
        setState(() => seconds--);
      else if (seconds == 0) {
        Player.player1 = !Player.player1;
        Player.changeProfileCardColor();
        resetTimer();
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
            Visibility(
                visible: !Player.completed,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextButton(
                        text: 'pause',
                        onPressed: () {
                          pauseTimer();
                          stopTimer();
                          MyAlert.showAlert(context, 'Game Paused!', '⏸', 'Resume', () {
                            Navigator.pop(context);
                            resumeTimer();
                            startTimer();
                          });
                        },
                      ),
                      MyTextButton(
                        text: 'new',
                        onPressed: () {
                          resetTimer();
                          Player.resetStaticData();
                          Player.updatePlayer1();
                        },
                      ),
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyProfileContainer(playerIndex: 0, symbol: Player.p1, cardColor: Player.cardColorP1),
                const SizedBox(width: 10.0),
                Column(
                  children: [
                    Visibility(
                      visible: !Player.completed,
                      child: MyCountDownTimer(seconds: seconds, maxSeconds: maxSeconds),
                    ),
                    const SizedBox(height: 50.0),
                    Text('D', style: kTextStyle.copyWith(fontSize: 30.0, color: Colors.blue)),
                    MyScoreContainer('${Player.drawScore}'),
                  ],
                ),
                const SizedBox(width: 10.0),
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
          resetTimer();
          startTimer();
          Player.resetStaticData();
          Player.resetData1();
          Player.changeProfileCardColor();
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
          Player.changeProfileCardColor();
          resetTimer();
        }
      }
    });
  }

  void winnerLogic() {
    stopTimer();
    Player.finished = true;
    player.changeWinnerCardColor();
    Future.delayed(Duration(milliseconds: 100), () => setState(() => player.updateCardColors()));
    Future.delayed(
      Duration(milliseconds: 800),
      () => setState(() {
        Player.winner = true;
        Player.updateScores();
        if (!Player.completed) MyAlert.showAlert(context, '${Player.getAlertTitle()}', '😎', 'Next Round', nextRoundFunc);
        if (Settings.audioValues[0]) AudioPlayer.playResultSound(Player.winnerPlayer);
      }),
    );
  }

  void drawLogic() {
    stopTimer();
    Future.delayed(
      Duration(milliseconds: 800),
      () => setState(() {
        Player.draw = true;
        Player.updateScores();
        if (!Player.completed) MyAlert.showAlert(context, '${Player.getAlertTitle()}', '😔', 'Next Round', nextRoundFunc);
        if (Settings.audioValues[0]) AudioPlayer.playResultSound(Player.winnerPlayer);
      }),
    );
  }

  void nextRoundFunc() {
    setState(() {
      Player.resetStaticData();
      Player.changeProfileCardColor();
      resetTimer();
      startTimer();
      Navigator.pop(context);
    });
  }
}
