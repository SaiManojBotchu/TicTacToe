import 'package:flutter/material.dart';

class MyCountDownTimer extends StatelessWidget {
  final int seconds;
  final int maxSeconds;

  const MyCountDownTimer({required this.seconds, required this.maxSeconds});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
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
        ),
      ),
    );
  }
}
