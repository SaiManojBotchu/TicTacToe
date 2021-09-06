import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color containerColor;
  final String text;
  final Color textColor;
  final Function() onTapFunction;

  ContainerWidget({required this.onTapFunction, required this.containerColor, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: onTapFunction,
          child: Container(
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 180.0,
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Carter',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
