import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';

enum Option { X, O }

class PickUpScreen extends StatefulWidget {
  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  Option? pressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose a side',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Carter',
                  ),
                ),
              ),
            ),
            ContainerWidget(
              onTapFunction: () {
                setState(() {
                  pressed = Option.X;
                });
              },
              containerColor: pressed == Option.X ? kTextColor : kBackgroundColor,
              text: "X",
              textColor: pressed == Option.X ? kBackgroundColor : kTextColor,
            ),
            ContainerWidget(
              onTapFunction: () {
                setState(() {
                  pressed = Option.O;
                });
              },
              containerColor: pressed == Option.O ? kTextColor : kBackgroundColor,
              text: "O",
              textColor: pressed == Option.O ? kBackgroundColor : kTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
