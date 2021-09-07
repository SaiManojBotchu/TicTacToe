import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final double textSize;
  final double textPadding;
  final Function() onPressed;

  ReusableButton({required this.text, required this.textSize, required this.textPadding, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: MaterialButton(
        padding: EdgeInsets.all(textPadding),
        textColor: kTextColor,
        color: kContainerCardColor,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: TextStyle(fontFamily: 'Paytone', fontSize: textSize),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
