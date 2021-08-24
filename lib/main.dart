import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PickUpScreen(),
    );
  }
}
