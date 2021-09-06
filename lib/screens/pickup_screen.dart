import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/start_button.dart';
import 'package:tic_tac_toe/widgets/player.dart';

class PickUpScreen extends StatefulWidget {
  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  String pressed = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose a side',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Carter',
                  ),
                ),
              ),
            ),
            ContainerWidget(
              onTapFunction: () {
                setState(() {
                  pressed = Player.X;
                });
              },
              containerColor: pressed == Player.X ? kTextColor : kBackgroundColor,
              text: "X",
              textColor: pressed == Player.X ? kBackgroundColor : kTextColor,
            ),
            ContainerWidget(
              onTapFunction: () {
                setState(() {
                  pressed = Player.O;
                });
              },
              containerColor: pressed == Player.O ? kTextColor : kBackgroundColor,
              text: "O",
              textColor: pressed == Player.O ? kBackgroundColor : kTextColor,
            ),
            StartButton(
              text: 'Start',
              textSize: 30.0,
              textPadding: 5.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameScreen(
                            player1Side: pressed,
                          )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
