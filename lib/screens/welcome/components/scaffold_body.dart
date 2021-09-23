import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup/pickup_screen.dart';
import 'package:tic_tac_toe/models/responsive_ui.dart';
import 'package:tic_tac_toe/widgets/material_button.dart';

class MyScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: _buildRichText(context)),
          MaterialButtonWidget(
            text: 'Pick a side',
            textSize: ResponsiveUI.getFontSize(35.0),
            textPadding: 12.0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PickUpScreen()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRichText(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            _buildTextSpan(context, 'X', kXTextStyle),
            _buildTextSpan(context, 'O', kOTextStyle),
          ],
        ),
      ),
    );
  }

  TextSpan _buildTextSpan(BuildContext context, String letter, TextStyle textStyle) {
    return TextSpan(
      text: letter,
      style: textStyle.copyWith(
        fontSize: ResponsiveUI.getFontSize(200.0),
      ),
    );
  }
}
