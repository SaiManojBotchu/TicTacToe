import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class MyScoreContainer extends StatelessWidget {
  final String text;
  MyScoreContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: kContainerColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: kTextStyle.copyWith(
          fontSize: 30.0,
        ),
      ),
    );
  }
}
