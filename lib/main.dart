import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

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
