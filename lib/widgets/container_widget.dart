import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {

  final color,text,textColor;

  ContainerWidget({this.color,this.text,this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
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
    );
  }
}