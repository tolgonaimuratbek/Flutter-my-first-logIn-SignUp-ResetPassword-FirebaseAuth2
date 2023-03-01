import 'package:flutter/material.dart';
import '../../constants.dart';

//bottom button
class BottomButton extends StatelessWidget {
  final String bottomTitle;
  final Function() onTap;
  BottomButton({required this.bottomTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: kColourBlueMain,
          height: MediaQuery.of(context).size.height * 0.075,
          //85% of the app width
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.only(bottom: 10), //für Tex// t
          child: Align(
            child: Text(
              bottomTitle,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: kColourYellowMain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
