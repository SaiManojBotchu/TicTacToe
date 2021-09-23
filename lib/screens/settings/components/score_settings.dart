import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/settings.dart';
import 'package:tic_tac_toe/screens/settings/components/material_button.dart';

class ScoreSettings extends StatefulWidget {
  final int index;
  ScoreSettings(this.index);

  @override
  _ScoreSettingsState createState() => _ScoreSettingsState();
}

class _ScoreSettingsState extends State<ScoreSettings> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Settings.scoreTitles[widget.index], style: TextStyle(fontSize: 19.0)),
        MyMaterialButton(
          index: widget.index,
          icon: Icons.remove,
          onPressed: Settings.scores[widget.index] > 1 ? decrementFunc : null,
        ),
        Text('${Settings.scores[widget.index]}'),
        MyMaterialButton(
          index: widget.index,
          icon: Icons.add,
          onPressed: Settings.scores[widget.index] < 20 ? incrementFunc : null,
        ),
      ],
    );
  }

  void incrementFunc() {
    setState(() => Settings.scores[widget.index]++);
  }

  void decrementFunc() {
    setState(() => Settings.scores[widget.index]--);
  }
}
