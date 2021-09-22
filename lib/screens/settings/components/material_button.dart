import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class MyMaterialButton extends StatelessWidget {
  final int index;
  final IconData icon;
  final Function()? onPressed;
  MyMaterialButton({required this.index, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 24.0,
      shape: CircleBorder(),
      color: kBackgroundColor,
      disabledColor: Color(0xFF5d5e60),
      disabledTextColor: kTextColor,
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
