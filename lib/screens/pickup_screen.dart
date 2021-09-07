import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/widgets/player.dart';

class PickUpScreen extends StatefulWidget {
  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose a side',
              textAlign: TextAlign.center,
              style: kSmallTextStyle,
            ),
            ContainerWidget(
              onTapFunction: () => setState(() => Player.pressed = Player.X),
              containerColor: Player.pressed == Player.X ? kContainerCardColor : kBackgroundColor,
              text: "X",
            ),
            ContainerWidget(
              onTapFunction: () => setState(() => Player.pressed = Player.O),
              containerColor: Player.pressed == Player.O ? kContainerCardColor : kBackgroundColor,
              text: "O",
            ),
            ReusableButton(
              text: 'Start',
              textSize: 30.0,
              textPadding: 5.0,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen())),
            )
          ],
        ),
      ),
    );
  }
}
