import 'package:flutter/material.dart';

/** IMAGE - TITLE - TEXT*/
class WelcomeImageTitleText extends StatelessWidget {
  final AssetImage myImage;
  final String myTitle;
  final String myText;

  WelcomeImageTitleText(
      {required this.myImage, required this.myTitle, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          alignment: Alignment.topCenter,
          image: myImage,
          //soll die ganze Breite des Apps nehmen
          width: MediaQuery.of(context).size.width,
          //Image should have height of 37,5% of the whole app height
          height: MediaQuery.of(context).size.height * 0.45,
          //height: 300.0,
        ),
        SizedBox(height: 12.0),
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
