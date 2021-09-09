import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WelcomeScreen(),
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}

/* TODO:
    2)if possible draw a line after winning
    3)add sounds for writing x and o and also winning and draw
    4)if possible make the code work for landscape and portrait mode
 */
