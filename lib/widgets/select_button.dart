import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class SelectButton extends StatelessWidget {
  final Function() onTapFunction;
  final String boxSide;

  const SelectButton({required this.onTapFunction, required this.boxSide});
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 30.0;
    double boxWidth = containerWidth / 3;
    // print(boxWidth * 0.6);
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
            color: Color(0xFF28175C),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              boxSide,
              style: TextStyle(
                color: boxSide == 'X' ? kXColor : kOColor,
                fontSize: boxWidth * 0.6,
                fontWeight: FontWeight.w600,
                fontFamily: boxSide == 'X' ? 'Carter' : 'Paytone',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
