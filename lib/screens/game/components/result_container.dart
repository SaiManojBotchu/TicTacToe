import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/widgets/material_button.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:tic_tac_toe/models/responsive_ui.dart';

class MyResultContainer extends StatelessWidget {
  final Player player;
  final Function() onPressed;
  MyResultContainer({required this.player, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double containerHeight = ResponsiveUI.getHeight(context, 0.44);
    return DelayedDisplay(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              constraints: BoxConstraints.tightFor(
                width: ResponsiveUI.getWidth(context, 40.0),
                height: containerHeight,
              ),
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Player.winner ? 'assets/images/win.png' : 'assets/images/draw.png', height: containerHeight * 0.63),
                  Text(
                    Player.winner ? player.getWinnerText() : 'Draw',
                    style: kTextStyle.copyWith(fontSize: ResponsiveUI.getFontSize(context, 40.0)),
                  )
                ],
              )),
          SizedBox(height: 20.0),
          MaterialButtonWidget(
            text: 'Play Again',
            textSize: ResponsiveUI.getFontSize(context, 28.0),
            onPressed: onPressed,
          ),
          MaterialButtonWidget(
            text: 'Home',
            textSize: ResponsiveUI.getFontSize(context, 23.0),
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
