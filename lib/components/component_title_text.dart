import 'package:flutter/material.dart';

class ReusableTitleWithText extends StatelessWidget {
  final String myTitle;
  final String myText;

  ReusableTitleWithText({required this.myTitle, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          myTitle,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.0),
        Text(
          myText,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
