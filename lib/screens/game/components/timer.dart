import 'package:flutter/material.dart';

class MyCountDownTimer extends StatelessWidget {
  final int seconds;
  final int maxSeconds;

  const MyCountDownTimer({required this.seconds, required this.maxSeconds});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - seconds / maxSeconds,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
            backgroundColor: Colors.greenAccent,
          ),
          Center(child: Text('$seconds')),
        ],
      ),
    );
  }
}
