import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class AvatarSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20.0),
        Text(
          'Avatar',
          style: TextStyle(color: kTextColor, fontSize: 20.0),
        ),
        SizedBox(width: 10.0),
        MyToggleButtons(),
      ],
    );
  }
}

class MyToggleButtons extends StatefulWidget {
  @override
  _MyToggleButtonsState createState() => _MyToggleButtonsState();
}

class _MyToggleButtonsState extends State<MyToggleButtons> {
  List<bool> isSelected = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      fillColor: kActiveCardColor,
      splashColor: kActiveCardColor,
      renderBorder: false,
      children: [
        _buildCircleAvatar(0),
        _buildCircleAvatar(1),
        _buildCircleAvatar(2),
        _buildCircleAvatar(3),
      ],
      onPressed: (newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            isSelected[index] = newIndex == index ? true : false;
          }
        });
      },
    );
  }

  CircleAvatar _buildCircleAvatar(int index) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: isSelected[index] ? kBackgroundColor : kActiveCardColor,
      child: Image.asset('assets/images/draw.png', width: 40.0),
    );
  }
}
