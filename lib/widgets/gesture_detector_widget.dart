import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class GestureDetectorWidget extends StatelessWidget {
  final Function() onTapFunction;
  final String boxSide;
  final Color cardColor;

  const GestureDetectorWidget({required this.onTapFunction, required this.boxSide, required this.cardColor});
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 30.0;
    double boxWidth = containerWidth / 3;
    return GestureDetector(
      onTap: onTapFunction,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          constraints: BoxConstraints.tightFor(
            width: boxWidth - 20.0,
            height: boxWidth - 20.0,
          ),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: AnimatedText(
              boxSide,
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                color: cardColor == kWinnerCardColor
                    ? kTextColor
                    : boxSide == 'X'
                        ? kXColor
                        : kOColor,
                fontSize: boxWidth * 0.6,
                fontWeight: FontWeight.bold,
                fontFamily: boxSide == 'X' ? 'Carter' : 'Paytone',
                height: boxSide == 'X' ? 1.4 : 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
