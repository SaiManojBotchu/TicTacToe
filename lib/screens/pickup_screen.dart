import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';

class PickUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4C4B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose a side',
                  style: TextStyle(
                    color: Color(0XFFFFCA28),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Carter',
                  ),
                ),
              ),
            ),
            ContainerWidget(color: Color(0XFFFFCA28),text: "X",textColor: Color(0XFFFF4C4B),),
            ContainerWidget(color: Color(0xFFFF4C4B),text: "O", textColor: Color(0XFFFFCA28),),
          ],
        ),
      ),
    );
  }
}


