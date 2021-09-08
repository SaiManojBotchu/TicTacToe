import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class ContainerWidget extends StatelessWidget {
  final Color containerColor;
  final String text;
  final Function() onTapFunction;

  ContainerWidget(
      {required this.onTapFunction,
      required this.containerColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTapFunction,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: Center(
              child: Text(
                text,
                style: text == 'X' ? kXTextStyle : kOTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
