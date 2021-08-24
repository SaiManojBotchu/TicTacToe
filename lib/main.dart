import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TIC-TAC-TOE'),
          backgroundColor: Colors.green[500],
        ),
        body: SafeArea(
          child: WelcomeScreen(),
        ),
      ),
    );
  }
