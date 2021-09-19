import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/screens/welcome/welcome_screen.dart';
import 'package:tic_tac_toe/models/audio_resume.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
  WidgetsBinding.instance!.addObserver(new Handler());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
