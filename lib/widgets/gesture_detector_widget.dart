import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/responsive_ui.dart';

class GestureDetectorWidget extends StatelessWidget {
  final Function() onTapFunction;
  final String boxSide;
  final Color cardColor;

  const GestureDetectorWidget({required this.onTapFunction, required this.boxSide, required this.cardColor});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: onTapFunction,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              constraints: BoxConstraints.tightFor(
                width: ResponsiveUI.getBoxWidth(constraints.maxWidth, 10.0),
                height: ResponsiveUI.getBoxWidth(constraints.maxWidth, 10.0),
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
                    fontSize: constraints.maxWidth * 0.19,
                    fontWeight: FontWeight.bold,
                    fontFamily: boxSide == 'X' ? 'Carter' : 'Paytone',
                    height: boxSide == 'X' ? 1.4 : 2.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
